package com.tel.res.controllers;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
import com.tel.res.entities.admin;
import com.tel.res.repos.adminRepository;
import com.tel.res.service.ReservationService;
import com.tel.res.service.RessourceService;

import jakarta.servlet.http.HttpSession;

@Controller
public class adminController {

    private static final Logger log = LoggerFactory.getLogger(adminController.class);
    private final adminRepository ar;
    private final RessourceService ressourceService;

    @Autowired
    private ReservationService reservationService;

    
    @Autowired
    public adminController(adminRepository ar, RessourceService ressourceService) {
        this.ar = ar;
        this.ressourceService = ressourceService;
    }


    
    @GetMapping("/admin/acceptReservation")
    public String acceptReservation(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Reservation reservation = reservationService.findById(id);
        if (reservation != null) {
            reservation.setStatus(ReservationStatus.CONFIRMED);
            reservationService.save(reservation);
            redirectAttributes.addFlashAttribute("message", "La réservation a été confirmée.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Réservation introuvable.");
        }
        return "redirect:/reservation_admin"; // Correction de la redirection
    }

    @GetMapping("/admin/refuseReservation")
    public String refuseReservation(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        Reservation reservation = reservationService.findById(id);
        if (reservation != null) {
            reservation.setStatus(ReservationStatus.CANCELLED);
            reservationService.save(reservation);
            redirectAttributes.addFlashAttribute("message", "La réservation a été annulée.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Réservation introuvable.");
        }
        return "redirect:/reservation_admin"; // Correction de la redirection
    }

    @GetMapping("/login_admin")
    public String login(ModelMap model) {
        return "login_admin"; // Ensure this name matches your template file
    }
    
    

    @PostMapping("/login_admin")
    public String authenticate(@RequestParam String username, @RequestParam String pass, ModelMap model, HttpSession session) {
        admin admin = ar.findByUsernameAndPass(username, pass);
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            model.addAttribute("admin", admin);
            log.info("Admin logged in: {}", admin.toString());
            return "redirect:/admin_home"; // Redirect to the admin homepage
        } else {
            model.addAttribute("error", "Vérifiez vos coordonnées.");
            return "login_admin"; // Redirects back to the login template
        }
    }
    @GetMapping("/reservation_admin")
    public String viewReservations(Model model) {
        List<Reservation> reservations = reservationService.findReservationsByStatus(ReservationStatus.IN_PROGRESS);
        model.addAttribute("reservations", reservations);
        return "reservation_admin";
    }

    
    @GetMapping("/admin_home")
    public String adminHome(ModelMap model, HttpSession session) {
        admin loggedInAdmin = (admin) session.getAttribute("loggedInAdmin");
        if (loggedInAdmin != null) {
            model.addAttribute("admin", loggedInAdmin);
            long totalRessources = ressourceService.countRessources();
            model.addAttribute("totalRessources", totalRessources);
            log.info("Total Ressources: {}", totalRessources);

            return "admin_home"; // Name of the template for the admin homepage
        } else {
            return "redirect:/login_admin"; // Redirect to login if not authenticated
        }
    }

    @GetMapping("/admin_logout")
    public String adminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/login_admin"; // Assurez-vous que "/login_admin" est une URL valide
    }
}
