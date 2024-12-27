package com.tel.res.service;

import java.util.List;

import com.tel.res.entities.Boutique;


public interface BoutiqueService {
	 public Boutique findById(Long id) ;
	 public List<Boutique> findByVendeur(Long vendeurId);
	 public void save(Boutique boutique);
	 public List<Boutique> getAllBoutiques();
}
