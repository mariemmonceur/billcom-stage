package com.tel.res.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String username;
    private String pass;
    private String email; // Add this field

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public admin(String username, String pass, String email) {
        super();
        this.username = username;
        this.pass = pass;
        this.email = email;
    }

    public admin() {
        super();
    }

    @Override
    public String toString() {
        return "Admin [id=" + id + ", username=" + username + ", pass=" + pass + ", email=" + email + "]";
    }
}
