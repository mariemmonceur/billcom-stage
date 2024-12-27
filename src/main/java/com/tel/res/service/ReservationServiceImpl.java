package com.tel.res.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;
import com.tel.res.repos.ReservationRepository;

import jakarta.persistence.EntityNotFoundException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ReservationServiceImpl implements ReservationService {

    private static final Logger logger = LoggerFactory.getLogger(ReservationServiceImpl.class);

    @Autowired
    private ReservationRepository reservationRepository;

    @Override
    public Reservation createReservation(Vendeur vendeur, Ressource ressource) {
        Reservation reservation = new Reservation(vendeur, ressource, new Date(), ReservationStatus.IN_PROGRESS);
        return reservationRepository.save(reservation);
    }

    @Override
    public boolean isResourceReservedBySeller(Long ressourceId, Long vendeurId) {
        return reservationRepository.existsByRessourceIdAndVendeurId(ressourceId, vendeurId);
    }

    @Override
    public List<Reservation> getReservationsByVendeurId(Long vendeurId) {
        List<Reservation> reservations = reservationRepository.findByVendeurId(vendeurId);
        logger.info("Reservations for vendeur {}: {}", vendeurId, reservations);
        return reservations;
    }

    @Override
    public List<Reservation> getReservationsByVendeur(Long vendeurId) {
        return reservationRepository.findByVendeurId(vendeurId);
    }

	@Override
	public List<Reservation> findAllReservations() {
		 return reservationRepository.findAll();
	}

	@Override
	public Reservation findById(Long id) {
		Optional<Reservation> reservation = reservationRepository.findById(id);
        return reservation.orElse(null);
	}

	@Override
	public void save(Reservation reservation) {
		 reservationRepository.save(reservation);
		
	}

	@Override
	public List<Reservation> findReservationsByStatus(ReservationStatus status) {
		 return reservationRepository.findByStatus(status);
	}

	@Override
	public List<Ressource> findReservedResourcesWithStatus(ReservationStatus status) {
		// This method should return a list of resources with the given reservation status
	    return reservationRepository.findAllByStatus(status)
	                                .stream()
	                                .map(Reservation::getRessource)
	                                .distinct()
	                                .collect(Collectors.toList());
	}

	public void deleteReservationById(Long reservationId) {
	    Optional<Reservation> reservation = reservationRepository.findById(reservationId);
	    if (reservation.isPresent()) {
	        reservationRepository.deleteById(reservationId);
	    } else {
	        throw new EntityNotFoundException("Réservation non trouvée avec l'ID : " + reservationId);
	    }
	}



	

}
