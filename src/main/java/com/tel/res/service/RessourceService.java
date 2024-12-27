package com.tel.res.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.tel.res.entities.Reservation;
import com.tel.res.entities.Ressource;


public interface RessourceService {
	
	public Ressource saveRessource(Ressource s);
	public Ressource updateRessource(Ressource s);
	public void deteteRessource(Ressource s);
	public void deteteRessourceByID(Long s);
	public Ressource getRessource(Long id);
	public List<Ressource> getAllRessources();
	public boolean existBySim(String sim);
	public void saveResources(List<Ressource> resources);
	 public List<Ressource> getRessourcesByDate(Date startDate, Date endDate);
	 public Map<String, Long> getResourceCountsByDate();
	 public long countRessources() ;
	 List<Ressource> searchRessources(String query);
	    List<Ressource> findBySim(String sim); // Method to find by MSISDN
	    public Optional<Ressource> getRessourceById(Long id);
	    List<Ressource> findByRange(String startRange, String endRange);
}
