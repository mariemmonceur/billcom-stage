package com.tel.res.controllers;

import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tel.res.entities.Boutique;
import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;
import com.tel.res.service.BoutiqueService;
import com.tel.res.service.ReservationService;
import com.tel.res.service.RessourceService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoutiqueController {

    @Autowired
    private BoutiqueService boutiqueService;

    @Autowired
    private RessourceService rService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping("/list")
    public String listBoutiques(HttpSession session, HttpServletRequest request) {
        Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");

        if (vendeur == null) {
            request.setAttribute("errorMessage", "Vous devez vous connecter pour voir vos boutiques.");
            return "redirect:/login";
        }

        if (vendeur.getPdp() != null) {
            String base64Image = Base64.getEncoder().encodeToString(vendeur.getPdp());
            request.setAttribute("base64Image", base64Image);
        }

        // Filtrer les boutiques en fonction du vendeur connecté
        List<Boutique> boutiques = boutiqueService.findByVendeur(vendeur.getId());
        System.out.println("Boutiques trouvées dans le contrôleur : " + boutiques);
        request.setAttribute("boutiques", boutiques);

        return "list_boutiques";
    }

    @PostMapping("/assignToBoutique")
    public String assignToBoutique(@RequestParam("reservationId") Long reservationId,
            @RequestParam("boutiqueId") Long boutiqueId) {
        Reservation reservation = reservationService.findById(reservationId);
        if (reservation != null && reservation.getStatus() == ReservationStatus.CONFIRMED) {
            Boutique boutique = boutiqueService.findById(boutiqueId);
            if (boutique != null) {
                reservation.getRessource().setBoutique(boutique); // Assigner la ressource à la boutique
                rService.saveRessource(reservation.getRessource()); // Enregistrer la ressource mise à jour
            }
        }
        return "redirect:/consultation"; // Redirection vers la page des consultations
    }

    @GetMapping("/add")
    public String showAddBoutiqueForm(Model model) {
        model.addAttribute("boutique", new Boutique());
        return "add_boutique";
    }

    @PostMapping("/add")
    public String addBoutique(@ModelAttribute Boutique boutique, HttpSession session) {
        Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");
        boutique.setVendeur(vendeur);
        boutiqueService.save(boutique);
        return "redirect:/list";
    }
}
