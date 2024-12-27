package com.tel.res.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;

public interface VendeurService {
	public Vendeur save(Vendeur vendeur);
	public List<Vendeur> getAllVendeurs();
	public Vendeur findByEmailAndMdp(String email, String mdp);
	 Optional<Vendeur> getVendeurById(Long id);
	 public List<Vendeur> getVendeursByDate(Date startDate, Date endDate);
}

