package com.tel.res.entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class Reservation {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Vendeur getVendeur() {
		return vendeur;
	}

	public void setVendeur(Vendeur vendeur) {
		this.vendeur = vendeur;
	}

	public Ressource getRessource() {
		return ressource;
	}

	public void setRessource(Ressource ressource) {
		this.ressource = ressource;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public ReservationStatus getStatus() {
		return status;
	}

	public void setStatus(ReservationStatus status) {
		this.status = status;
	}

		@ManyToOne
	    @JoinColumn(name = "vendeur_id", nullable = false)
	    private Vendeur vendeur;

	    @ManyToOne
	    @JoinColumn(name = "ressource_id", nullable = false)
	    private Ressource ressource;

	    @Temporal(TemporalType.TIMESTAMP)
	    @Column(name = "reservation_date", nullable = false)
	    private Date reservationDate;

	    @Enumerated(EnumType.STRING)
	    @Column(name = "status", nullable = false)
	    private ReservationStatus status;
	    
	    
	    public Reservation() {
	        super();
	    }

	    public Reservation(Vendeur vendeur, Ressource ressource, Date reservationDate, ReservationStatus status) {
	        this.vendeur = vendeur;
	        this.ressource = ressource;
	        this.reservationDate = reservationDate;
	        this.status = status;
	    }

}
