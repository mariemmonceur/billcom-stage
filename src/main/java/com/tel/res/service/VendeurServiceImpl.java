package com.tel.res.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.res.entities.Ressource;
import com.tel.res.entities.Vendeur;
import com.tel.res.repos.VendeurRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
	public class VendeurServiceImpl implements VendeurService{
	    @Autowired
	    private VendeurRepository vendeurRepository;

		@Override
		public Vendeur save(Vendeur vendeur) {
			 return vendeurRepository.save(vendeur);
		}

		@Override
		public List<Vendeur> getAllVendeurs() {
			
				return vendeurRepository.findAll();
		
	
		}

		@Override
		public Vendeur findByEmailAndMdp(String email, String mdp) {
			 return vendeurRepository.findByEmailAndMdp(email, mdp);
			
		}

		@Override
		public Optional<Vendeur> getVendeurById(Long id) {
			  return vendeurRepository.findById(id);
		
		}

		@Override
		public List<Vendeur> getVendeursByDate(Date startDate, Date endDate) {
			 return vendeurRepository.findByCreateDateBetween(startDate, endDate);
		}
	 
	   
	}



