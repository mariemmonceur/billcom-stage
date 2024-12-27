package com.tel.res.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.ReservationStatus;
@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
	   boolean existsByRessourceIdAndVendeurId(Long ressourceId, Long vendeurId);
	   List<Reservation> findByVendeurId(Long vendeurId);
	   List<Reservation> findByStatus(ReservationStatus status);
	   List<Reservation> findAllByStatus(ReservationStatus status);

}
