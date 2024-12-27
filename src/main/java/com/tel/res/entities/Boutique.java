package com.tel.res.entities;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Boutique {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String delegation;  // The location of the store

    //un vendeur peut avoir plusieurs boutiques mais le contraire est faux 
    @ManyToOne
    @JoinColumn(name = "vendeur_id", nullable = false)
    private Vendeur vendeur;

    @OneToMany(mappedBy = "boutique", cascade = CascadeType.ALL)  // Linked resources
    private List<Ressource> ressources = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDelegation() {
		return delegation;
	}

	public void setDelegation(String delegation) {
		this.delegation = delegation;
	}

	public Vendeur getVendeur() {
		return vendeur;
	}

	public void setVendeur(Vendeur vendeur) {
		this.vendeur = vendeur;
	}

	public List<Ressource> getRessources() {
		return ressources;
	}

	public void setRessources(List<Ressource> ressources) {
		this.ressources = ressources;
	}

	public Boutique(String name, String delegation, Vendeur vendeur, List<Ressource> ressources) {
		super();
		this.name = name;
		this.delegation = delegation;
		this.vendeur = vendeur;
		this.ressources = ressources;
	}
	public Boutique(Long id, String name, Vendeur vendeur) {
	    this.id = id;
	    this.name = name;
	    this.delegation = ""; // Valeur par défaut ou null
	    this.vendeur = vendeur;
	    this.ressources = new ArrayList<>(); // Valeur par défaut ou null
	}

	public Boutique() {
		super();
		// TODO Auto-generated constructor stub
	}

   
}

