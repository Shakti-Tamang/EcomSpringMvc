package com.nistcollege.ecom.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
@Data
@Entity
public class ProductModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long productId;

    private String name;
    private String description;
    private BigDecimal price;
    private String imageUrl;
    private String category;
    private String brand;
    private int quantity; // Add this field
    private LocalDateTime createdAt;
    private LocalDateTime updated;

    @Transient
    private MultipartFile imageFile; // Holds the uploaded file during request
}