package com.tel.res.entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;

@Entity
@Table(name = "vend")
public class Vendeur {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
    private Long id; 
    private String nom;
    private String prenom;
    private long telephone; // Utiliser un type primitif si vous ne gérez pas de valeur null
    @Column(unique = true)
    private String email;
    private String mdp;
    private String adresse;
    private String city;
    private String state;
    @Lob
    @Column(name = "pdp", length = Integer.MAX_VALUE, nullable = true)
    private byte[] pdp;
    @Transient
    private String pdpBase64;
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_date", nullable = true)
    private Date createDate;

    private String categorie; // Utiliser un nom plus descriptif pour la catégorie

	public Vendeur() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vendeur(String nom, String prenom, long telephone, String email, String mdp, String adresse, String city,
			String state, byte[] pdp, Date createDate, String categorie) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.email = email;
		this.mdp = mdp;
		this.adresse = adresse;
		this.city = city;
		this.state = state;
		this.pdp = pdp;
		this.createDate = createDate;
		this.categorie = categorie;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getPdpBase64() {
	    return pdpBase64;
	}

	public void setPdpBase64(String pdpBase64) {
	    this.pdpBase64 = pdpBase64;
	}
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public long getTelephone() {
		return telephone;
	}

	public void setTelephone(long telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public byte[] getPdp() {
		return pdp;
	}

	public void setPdp(byte[] pdp) {
		this.pdp = pdp;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}

}
