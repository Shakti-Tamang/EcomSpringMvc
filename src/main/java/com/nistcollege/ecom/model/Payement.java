package com.nistcollege.ecom.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
@Data
public class Payement {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int payement_id;

    private double amount;
    private String token;

}
