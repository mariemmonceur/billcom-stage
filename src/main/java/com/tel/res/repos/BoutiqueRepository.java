package com.tel.res.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tel.res.entities.Boutique;

@Repository
public interface BoutiqueRepository extends JpaRepository<Boutique, Long> {
    List<Boutique> findByVendeurId(Long vendeurId);
}

