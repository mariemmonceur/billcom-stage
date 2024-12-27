package com.tel.res.controllers;

import java.io.IOException;
import java.security.Principal;

import org.springframework.ui.Model;

import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tel.res.entities.Boutique;
import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;
import com.tel.res.entities.admin;
import com.tel.res.repos.ReservationRepository;
import com.tel.res.service.BoutiqueService;
import com.tel.res.service.EmailService;
import com.tel.res.service.ReservationService;
import com.tel.res.service.RessourceService;
import com.tel.res.service.VendeurService;
import com.tel.res.service.adminService;

import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class VendeurController {
	
	@Value("${upoadDir}")
	private String uploadFolder;

    private static final Logger log = LoggerFactory.getLogger(VendeurController.class);
    @Autowired
    private RessourceService ressourceService;
    
    @Autowired
    private adminService adminService;
    
    @Autowired
    private BoutiqueService boutiqueService;
    
    @Autowired
    private ReservationRepository reservationRepository;
    
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private VendeurService vendeurService;
    @Autowired
    private EmailService emailService;
    @GetMapping("/register")
    public String register(ModelMap model) {
        model.addAttribute("vendeur", new Vendeur());
        return "registrer"; // Assurez-vous que ce nom correspond à celui de votre fichier de template
    }
    @GetMapping("/recherche")
    public String recherche(ModelMap model, HttpSession session) {
        Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");
        if (vendeur != null) {
            String base64Image = Base64.getEncoder().encodeToString(vendeur.getPdp());
            model.addAttribute("base64Image", base64Image);
        }
        // Récupérer les résultats de recherche de la session ou de la requête
        List<Ressource> results = (List<Ressource>) model.getAttribute("results");
        model.addAttribute("results", results != null ? results : List.of());
        return "recherche"; // Assurez-vous que le nom correspond à celui de votre fichier de template
    }

    @GetMapping("/search")
    public String searchResources(
        @RequestParam(value = "search-type") String searchType,
        @RequestParam(value = "number", required = false) String number,
        @RequestParam(value = "start-range", required = false) String startRange,
        @RequestParam(value = "end-range", required = false) String endRange,
        Model model,
        HttpSession session) {

        // Réintroduction de la photo de profil et de l'ID vendeur dans le modèle
        Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");
        if (vendeur != null) {
            String base64Image = Base64.getEncoder().encodeToString(vendeur.getPdp());
            model.addAttribute("base64Image", base64Image);
            model.addAttribute("vendeurId", vendeur.getId());
        }

        log.info("Search type: {}", searchType);
        log.info("Number: {}", number);
        log.info("Start range: {}", startRange);
        log.info("End range: {}", endRange);

        List<Ressource> results = List.of(); // Initialisation avec une liste vide

        if ("number".equals(searchType) && number != null && !number.isEmpty()) {
            results = ressourceService.findBySim(number); // Recherche par SIM
        } else if ("range".equals(searchType) && startRange != null && !startRange.isEmpty() && endRange != null && !endRange.isEmpty()) {
            results = ressourceService.findByRange(startRange, endRange); // Recherche par plage de SIM
        }

        // Obtenir toutes les ressources réservées confirmées
        List<Ressource> reservedResources = reservationService.findReservedResourcesWithStatus(ReservationStatus.CONFIRMED);

        // Filtrer les ressources pour exclure celles avec une réservation confirmée
        List<Ressource> filteredResults = results.stream()
            .filter(ressource -> !reservedResources.contains(ressource))
            .collect(Collectors.toList());

        // Vérification des réservations pour les ressources restantes
        if (vendeur != null) {
            Map<Long, Boolean> reservedResourcesBySeller = new HashMap<>();
            for (Ressource ressource : filteredResults) {
                boolean isReserved = reservationService.isResourceReservedBySeller(ressource.getId(), vendeur.getId());
                reservedResourcesBySeller.put(ressource.getId(), isReserved);
            }
            model.addAttribute("reservedResources", reservedResourcesBySeller);
        }

        model.addAttribute("results", filteredResults);
        return "recherche"; // Assurez-vous que cela correspond à votre nom de template JSP
    }

    @PostMapping("/cancelReservation")
    public String cancelReservationC(@RequestParam("reservationId") Long reservationId, RedirectAttributes redirectAttributes) {
        try {
            // Supprimer la réservation, quel que soit son statut
            reservationService.deleteReservationById(reservationId);
            redirectAttributes.addFlashAttribute("successMessage", "Réservation annulée avec succès.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Erreur lors de l'annulation de la réservation.");
        }
        return "redirect:/consultation";
    }
    @PostMapping("/cancel")
    public String cancelReservation(@RequestParam("reservationId") Long reservationId, RedirectAttributes redirectAttributes) {
        System.out.println("Tentative d'annulation de la réservation avec l'ID : " + reservationId); // Log pour débogage
        try {
            Optional<Reservation> reservation = reservationRepository.findById(reservationId);
            if (reservation.isPresent()) {
                reservationService.deleteReservationById(reservationId);
                redirectAttributes.addFlashAttribute("message", "Réservation annulée avec succès.");
            } else {
                redirectAttributes.addFlashAttribute("error", "Réservation non trouvée avec l'ID : " + reservationId);
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Une erreur est survenue lors de l'annulation.");
        }
        return "redirect:/recherche";
    }







    
    @GetMapping("/consultation")
    public String viewReservations(Model model, HttpSession session) {
        Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");
        if (vendeur == null) {
            model.addAttribute("error", "Vous devez être connecté pour consulter vos réservations.");
            return "login";
        }

        Long vendeurId = vendeur.getId();
        List<Reservation> reservations = reservationService.getReservationsByVendeurId(vendeurId);
        model.addAttribute("reservations", reservations);

        // Ajouter l'image de profil au modèle
        String base64Image = vendeur.getPdp() != null ? Base64.getEncoder().encodeToString(vendeur.getPdp()) : "";
        model.addAttribute("base64Image", base64Image);

        // Ajouter les boutiques au modèle
        List<Boutique> boutiques = boutiqueService.findByVendeur(vendeurId);
        model.addAttribute("boutiques", boutiques);

        return "consultations";
    }











    @PostMapping("/register")
    public String save(
            @RequestParam("adresse") String adresse,
            @RequestParam("categorie") String categorie,
            @RequestParam("city") String city,
            @RequestParam("email") String email,
            @RequestParam("mdp") String mdp,
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam("state") String state,
            @RequestParam("telephone") long telephone,
            @RequestParam("pdp") MultipartFile file,
            Model model,
            HttpServletRequest request) throws IOException {

        // Créer une nouvelle instance de Vendeur
        Vendeur vendeur = new Vendeur();
        vendeur.setAdresse(adresse);
        vendeur.setCategorie(categorie);
        vendeur.setCity(city);
        vendeur.setEmail(email);
        vendeur.setMdp(mdp);
        vendeur.setNom(nom);
        vendeur.setPrenom(prenom);
        vendeur.setState(state);
        vendeur.setTelephone(telephone);
        
        // Gérer le fichier
        if (file != null && !file.isEmpty()) {
            byte[] imageData = file.getBytes();
            vendeur.setPdp(imageData);
        }

        // Définir la date de création
        vendeur.setCreateDate(new Date());

        // Sauvegarder le vendeur
        vendeurService.save(vendeur);
        log.info("Vendeur saved: {}", vendeur.toString());

        // Envoyer un email de confirmation
        String subject = "Confirmation d'enregistrement";
        String text = "Bonjour " + vendeur.getNom() + ",\n\n" +
                      "Votre enregistrement en tant que vendeur a été effectué avec succès.\n\n" +
                      "Voici vos informations :\n" +
                      "Nom : " + vendeur.getNom() + "\n" +
                      "Prénom : " + vendeur.getPrenom() + "\n" +
                      "Téléphone : " + vendeur.getTelephone() + "\n" +
                      "Email : " + vendeur.getEmail() + "\n" +
                      "Adresse : " + vendeur.getAdresse() + "\n" +
                      "Ville : " + vendeur.getCity() + "\n" +
                      "État : " + vendeur.getState() + "\n" +
                      "Catégorie : " + vendeur.getCategorie() + "\n\n" +
                      "Merci de nous avoir rejoint !";

        emailService.sendSimpleMessage(vendeur.getEmail(), subject, text);

        return "redirect:/showCreate"; // Assurez-vous que cette route existe
    }  


    @RequestMapping("/listeVendeurs")
    public String listeVendeurs(ModelMap modelMap) {
        List<Vendeur> vendeurs = vendeurService.getAllVendeurs();
        for (Vendeur vendeur : vendeurs) {
            if (vendeur.getPdp() != null) {
                vendeur.setPdpBase64(Base64.getEncoder().encodeToString(vendeur.getPdp()));
            }
        }
        modelMap.addAttribute("vendeurs", vendeurs);
        return "listeVendeurs";
    }


 @GetMapping("/login")
    public String login(ModelMap model) {
        return "login"; // Assurez-vous que ce nom correspond à celui de votre fichier de template
    }



 @GetMapping("/profil")
 public String profil(ModelMap model, HttpSession session) {
     Vendeur vendeur = (Vendeur) session.getAttribute("loggedInVendeur");
     if (vendeur != null) {
         String base64Image = Base64.getEncoder().encodeToString(vendeur.getPdp());
         model.addAttribute("vendeur", vendeur);
         model.addAttribute("base64Image", base64Image);
         log.info("Displaying profile for vendeur: {}", vendeur.toString());
         return "espaceVendeur"; // Assurez-vous que ce nom correspond à celui de votre fichier de template
     } else {
         model.addAttribute("error", "Vous devez être connecté pour voir votre profil.");
         return "login"; // Redirige vers le template de connexion
     }
 }
 



    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalide la session
        return "login"; // Redirige vers la page de création de ressource
    }
    




    
    
    @PostMapping("/login")
    public String authenticate(
            @RequestParam String email, 
            @RequestParam String mdp, 
            ModelMap model, 
            HttpSession session) {
        
        // Vérifier si l'utilisateur est un administrateur
        admin admin = adminService.findByUsernameAndPass(email, mdp);
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            model.addAttribute("admin", admin);
            log.info("Admin logged in: {}", admin.toString());
            return "redirect:/admin_home"; // Redirection vers l'espace admin
        }

        // Si ce n'est pas un administrateur, vérifier s'il est un vendeur
        Vendeur vendeur = vendeurService.findByEmailAndMdp(email, mdp);
        if (vendeur != null) {
            session.setAttribute("loggedInVendeur", vendeur);
            model.addAttribute("vendeur", vendeur);
            log.info("Vendeur logged in: {}", vendeur.toString());
            return "redirect:/profil"; // Redirection vers l'espace vendeur
        }

        // Si ni admin ni vendeur ne correspond, afficher un message d'erreur
        model.addAttribute("error", "Vérifiez vos coordonnées.");
        return "login"; // Retour à la page de connexion
    }}

