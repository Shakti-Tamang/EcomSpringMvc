package com.nistcollege.ecom.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Service
public class KhaltiPaymentService {

    private final String khaltiApiUrl;
    private final String khaltipublicKey;

    @Autowired
    public KhaltiPaymentService(Properties khaltiConfig) {
        this.khaltiApiUrl = khaltiConfig.getProperty("khalti.api.url");
        this.khaltipublicKey = khaltiConfig.getProperty("khalti.public.Key");
    }

    public String getKhaltiApiUrl() {
        return khaltiApiUrl;
    }

    public String getKhaltiSecretKey() {
        return khaltipublicKey;
    }




    // Method to handle Khalti payment processing
    public void processPayment(String token, int amount) {
        // Initialize RestTemplate  delaing with externalpi so http RestTemplete needed
//        RestTemplate is used specifically for making HTTP requests to external services
//        (like the Khalti API) from within your Spring application. It’s a way to send a request to
//        another server over HTTP, receive a response, and then use that response within your
//        application.
        RestTemplate restTemplate = new RestTemplate();

        // Set up headers with authorization key
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Key " + khaltipublicKey);

        // Create JSON payload
        Map<String, Object> payload = new HashMap<>();
        payload.put("token", token);
        payload.put("amount", amount);

        // Wrap payload and headers into an HttpEntity
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);

        // Send POST request to Khalti API
        ResponseEntity<String> response = restTemplate.postForEntity(khaltiApiUrl, request, String.class);

        // Check if response was successful
        if (response.getStatusCode().is2xxSuccessful()) {
            System.out.println("Payment processed successfully.");
        } else {
            System.out.println("Payment failed: " + response.getBody());
        }
    }

}