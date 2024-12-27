package com.tel.res.repos;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.tel.res.entities.Vendeur;

@Repository
public interface VendeurRepository extends JpaRepository< Vendeur, Long> {
	 Vendeur findByEmailAndMdp(String email, String mdp);
	  List<Vendeur> findByCreateDateBetween(Date startDate, Date endDate);
}
