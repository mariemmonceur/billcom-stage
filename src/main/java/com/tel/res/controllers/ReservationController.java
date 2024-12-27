package com.tel.res.controllers;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;
import com.tel.res.service.ReservationService;
import com.tel.res.service.RessourceService;
import com.tel.res.service.VendeurService;



@Controller
@RequestMapping("/reservations")
public class ReservationController {

    private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private VendeurService vendeurService;

    @Autowired
    private RessourceService ressourceService;
    

    
    @PostMapping("/reserve")
    public ResponseEntity<Map<String, String>> reserveResource(@RequestParam(required = false) Long vendeurId, @RequestParam(required = false) Long ressourceId) {
        Map<String, String> response = new HashMap<>();

        if (vendeurId == null || ressourceId == null) {
            response.put("message", "Paramètres manquants.");
            return ResponseEntity.badRequest().body(response);
        }

        Optional<Vendeur> vendeurOpt = vendeurService.getVendeurById(vendeurId);
        Optional<Ressource> ressourceOpt = ressourceService.getRessourceById(ressourceId);

        if (vendeurOpt.isEmpty() || ressourceOpt.isEmpty()) {
            response.put("message", "Vendeur ou ressource non trouvé.");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }

        Vendeur vendeur = vendeurOpt.get();
        Ressource ressource = ressourceOpt.get();

        // Mettre à jour la ressource avec le vendeur
        ressource.setVendeur(vendeur);
        ressourceService.saveRessource(ressource); // Assurez-vous d'avoir une méthode pour mettre à jour une ressource

        reservationService.createReservation(vendeur, ressource);

        response.put("message", "Réservation effectuée avec succès.");
        return ResponseEntity.ok(response);
    }


}
