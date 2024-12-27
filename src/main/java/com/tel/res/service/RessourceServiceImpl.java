package com.tel.res.service;

import java.util.Date;
import java.util.List;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.res.entities.Ressource;
import com.tel.res.repos.RessourceRepository;
@Service
public class RessourceServiceImpl implements RessourceService{

	@Autowired
	RessourceRepository RR;
	
	@Override
	public Ressource saveRessource(Ressource s) {
		
		 if (s.getCreateDate() == null) {
	            s.setCreateDate(new Date());
	        }
	        return RR.save(s);
	}

	@Override
	public Ressource updateRessource(Ressource s) {
		
		return RR.save(s);
	}

	@Override
	public void deteteRessource(Ressource s) {
		RR.delete(s);
		
	}

	@Override
	public void deteteRessourceByID(Long s) {
		RR.deleteById(s);		
	}

	@Override
	public Ressource getRessource(Long id) {
		
		return RR.findById(id).get();
	}

	@Override
	public List<Ressource> getAllRessources() {
		
		return RR.findAll();
	}
	
	
	@Override
	public boolean existBySim(String sim) {
		return RR.existsBySim(sim);
	}

	@Override
	public void saveResources(List<Ressource> resources) {
		for (Ressource resource : resources) {
            if (!RR.existsBySim(resource.getSim())) {
                RR.save(resource);
            }
        }
		
	}

	@Override
	public List<Ressource> getRessourcesByDate(Date startDate, Date endDate) {
		 return RR.findByCreateDateBetween(startDate, endDate);
		
	}

	@Override
	public long countRessources() {
		 return RR.count();
	}
	

	@Override
	  public Map<String, Long> getResourceCountsByDate() {
        List<Ressource> resources = RR.findAll();
        return resources.stream()
            .collect(Collectors.groupingBy(
                res -> new SimpleDateFormat("yyyy-MM-dd").format(res.getCreateDate()), 
                Collectors.counting()));
    }

	@Override
	public List<Ressource> searchRessources(String query) {
	    return RR.findBySimContaining(query); // Search by sim only
	}

	@Override
	public List<Ressource> findBySim(String sim) {
	    return RR.findBySim(sim); // Find by sim only
	}

	@Override
	public List<Ressource> findByRange(String startRange, String endRange) {
	    return RR.findBySimBetween(startRange, endRange); // Search range by sim
	}

	@Override
	public Optional<Ressource> getRessourceById(Long id) {
		  return RR.findById(id);
	}

	

}
