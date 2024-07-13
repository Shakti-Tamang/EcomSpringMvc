package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.Usermodel1;

import java.util.List;

public interface UserService {
    public void saveUser(Usermodel1 usermodel1);
    public List<Usermodel1>list();

    public boolean foundUser(Usermodel1 usermodel1);
    public String loginByEmail(Usermodel1 usermodel1);
}
