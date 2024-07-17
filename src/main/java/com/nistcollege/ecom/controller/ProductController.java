package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.ProductModel;
import com.nistcollege.ecom.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView get() {
        ModelAndView modelAndView = new ModelAndView("AdminProduct");
        return modelAndView;
    }

    private static final String UPLOAD_DIRECTORY = "C:\\Users\\Shakti\\Pictures\\Saved Pictures\\uploads\\images";

    static {
        File directory = new File(UPLOAD_DIRECTORY);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(@ModelAttribute ProductModel product,
                                   @RequestParam("imageUrl") MultipartFile file) {
        ModelAndView modelAndView = new ModelAndView("AdminProduct");

        if (file.isEmpty()) {
            modelAndView.addObject("message", "Please select a file to upload");
            return modelAndView;
        }

        try {
            // Validate file type
            if (!file.getContentType().startsWith("image/")) {
                modelAndView.addObject("message", "Please upload a valid image file");
                return modelAndView;
            }

            // Sanitize and save the file
            String originalFilename = file.getOriginalFilename();
            String sanitizedFilename = originalFilename.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
            String path = Paths.get(UPLOAD_DIRECTORY, sanitizedFilename).toString();

            file.transferTo(new File(path));

            // Set the image URL
            product.setImageUrl("/uploads/images/" + sanitizedFilename);
            product.setCreatedAt(LocalDateTime.now());
            product.setUpdated(LocalDateTime.now());

            // Save product to the database
            productService.saveProduct(product);

        } catch (IOException e) {
            e.printStackTrace();
            modelAndView.addObject("message", "Failed to upload file");
            return modelAndView;
        }

        modelAndView.addObject("message", "Product successfully saved");
        return modelAndView;
    }
}