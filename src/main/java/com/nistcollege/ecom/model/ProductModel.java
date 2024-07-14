package com.nistcollege.ecom.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
public class ProductModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long Product_id;

    private String name;


    private String description;


    private BigDecimal price;


    private int quantity;


    private String imageUrl;


    private String category;


    private String brand;


    private LocalDateTime createdAt;


    private LocalDateTime updated;
}
