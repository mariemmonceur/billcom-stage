package com.tel.res.repos;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tel.res.entities.Ressource;

public interface RessourceRepository extends JpaRepository<Ressource, Long> {
	List<Ressource> findByCreateDateBetween(Date startDate, Date endDate);
	 boolean existsBySim(String sim);
	 
	 List<Ressource> findBySimContaining(String sim);

	    List<Ressource> findBySim(String sim);

	    @Query("SELECT r FROM Ressource r WHERE r.sim BETWEEN :startRange AND :endRange")
	    List<Ressource> findBySimBetween(@Param("startRange") String startRange, @Param("endRange") String endRange);}
