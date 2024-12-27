package com.tel.res.service;

import com.tel.res.entities.admin;

public interface adminService {
    admin findByUsernameAndPass(String username, String pass);
}
