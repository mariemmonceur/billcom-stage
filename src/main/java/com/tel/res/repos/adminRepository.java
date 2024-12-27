package com.tel.res.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tel.res.entities.admin;

public interface adminRepository extends JpaRepository<admin, Long> {
    admin findByUsernameAndPass(String username, String pass);
}
