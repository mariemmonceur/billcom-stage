package com.tel.res.entities;

import java.util.Date;
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
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class Ressource {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String msisdn;
    private String sim;
    
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "create_date", nullable = false)
    private Date createDate;
      
    @ManyToOne
    @JoinColumn(name = "boutique_id")  // Clé étrangère vers Boutique
    private Boutique boutique;  // Relation avec la boutique
    
    @OneToMany(mappedBy = "ressource", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Reservation> reservations;

    
    public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}
	

	public Boutique getBoutique() {
		return boutique;
	}

	public void setBoutique(Boutique boutique) {
		this.boutique = boutique;
	}

	@ManyToOne
    @JoinColumn(name = "vendeur_id")
    private Vendeur vendeur; // Ajout du champ vendeur

    public Ressource() {
        super();
    }

    public Ressource(String sim, String msisdn, Date date) {
        this.sim = sim;
        this.msisdn = msisdn;
        this.createDate = date;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMsisdn() {
        return msisdn;
    }

    public void setMsisdn(String msisdn) {
        this.msisdn = msisdn;
    }

    public String getSim() {
        return sim;
    }

    public void setSim(String sim) {
        this.sim = sim;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Vendeur getVendeur() {
        return vendeur;
    }

    public void setVendeur(Vendeur vendeur) {
        this.vendeur = vendeur;
    }

    @Override
    public String toString() {
        return "Ressource [id=" + id + ", msisdn=" + msisdn + ", sim=" + sim + "]";
    } 
}
