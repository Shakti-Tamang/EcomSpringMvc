package com.nistcollege.ecom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Properties;

@Service
public class KhaltiPaymentService {

    private final String khaltiApiUrl;
    private final String khaltiSecretKey;

    @Autowired
    public KhaltiPaymentService(Properties khaltiConfig) {
        this.khaltiApiUrl = khaltiConfig.getProperty("khalti.api.url");
        this.khaltiSecretKey = khaltiConfig.getProperty("khalti.secret.key");
    }

    public String getKhaltiApiUrl() {
        return khaltiApiUrl;
    }

    public String getKhaltiSecretKey() {
        return khaltiSecretKey;
    }

    // Method to handle Khalti payment processing
    public void processPayment(String token, int amount) {
        // Implement Khalti payment processing logic here using khaltiApiUrl and khaltiSecretKey
    }
}