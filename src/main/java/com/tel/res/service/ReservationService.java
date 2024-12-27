package com.tel.res.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;

public interface ReservationService {

	public Reservation createReservation(Vendeur vendeur, Ressource ressource);
	public boolean isResourceReservedBySeller(Long ressourceId, Long vendeurId);
	 public List<Reservation> getReservationsByVendeurId(Long vendeurId) ;
	    List<Reservation> getReservationsByVendeur(Long vendeurId);
		 public List<Reservation> findAllReservations();
		 public Reservation findById(Long id) ;
		 public void save(Reservation reservation);
		 public List<Reservation> findReservationsByStatus(ReservationStatus status);
		 public List<Ressource> findReservedResourcesWithStatus(ReservationStatus status);
		 public void deleteReservationById(Long reservationId) ;

}
