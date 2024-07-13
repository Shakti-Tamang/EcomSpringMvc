package com.nistcollege.ecom.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@Entity
public class Usermodel1 {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int user_id;
    String role,username,email,password,confirmPassword;


}
