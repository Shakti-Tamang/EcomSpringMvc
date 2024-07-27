package com.nistcollege.ecom.model;

import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Data
@Entity
public class CartModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
   private String name;

    private BigDecimal price;
    private String category;
    private String brand;
    private int quantity=1;


}
