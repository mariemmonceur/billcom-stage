package com.tel.res.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tel.res.entities.admin;
import com.tel.res.repos.adminRepository;

@Service
public class adminServiceImpl implements adminService {

    @Autowired
    private adminRepository ar;

    @Override
    public admin findByUsernameAndPass(String username, String pass) {
        return ar.findByUsernameAndPass(username, pass);
    }
}
