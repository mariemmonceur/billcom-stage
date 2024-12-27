package com.tel.res.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.res.entities.Boutique;
import com.tel.res.repos.BoutiqueRepository;
@Service
public class BoutiqueServiceImpl implements BoutiqueService{

	 @Autowired
	    private BoutiqueRepository boutiqueRepository;
	 public List<Boutique> findByVendeur(Long vendeurId) {
		    List<Boutique> boutiques = boutiqueRepository.findByVendeurId(vendeurId);
		    System.out.println("Boutiques trouvées par le service : " + boutiques);
		    return boutiques;
		}




	@Override
	public void save(Boutique boutique) {
		 boutiqueRepository.save(boutique);
		
	}

	@Override
	public Boutique findById(Long id) {
		
		return boutiqueRepository.getById(id);
	}




	@Override
	public List<Boutique> getAllBoutiques() {
		 return boutiqueRepository.findAll();
	}

}
