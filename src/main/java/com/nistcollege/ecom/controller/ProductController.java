package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.ProductModel;
import com.nistcollege.ecom.service.ProductService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    public ModelAndView get() {
        List<ProductModel> list = productService.getDetailProduct();
        ModelAndView modelAndView = new ModelAndView("AdminProduct");
        modelAndView.addObject("productList", list);
        return modelAndView;
    }

    @RequestMapping(value = "/userProduct", method = RequestMethod.GET)
    public ModelAndView getProductUser() {
        List<ProductModel> list = productService.getDetailProduct();
        ModelAndView modelAndView = new ModelAndView("UserProduct");
        modelAndView.addObject("productList", list);
        return modelAndView;
    }



    private static final String UPLOAD_DIRECTORY = "C:\\Users\\Shakti\\Ecommerse\\src\\main\\webapp\\image";

    static {
        File directory = new File(UPLOAD_DIRECTORY);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }
    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> addProduct(HttpServletRequest request, @ModelAttribute ProductModel product) {
        Map<String, Object> response = new HashMap<>();
        MultipartFile file = product.getImageFile();

        if (file.isEmpty()) {
            response.put("status", "error");
            response.put("message", "Please select a file to upload");
            return response;
        }

        try {
            if (!file.getContentType().startsWith("image/")) {
                response.put("status", "error");
                response.put("message", "Please upload a valid image file");
                return response;
            }

            String originalFilename = file.getOriginalFilename();
            String sanitizedFilename = originalFilename.replaceAll("[^a-zA-Z0-9\\.\\-]", "_");
            String path = Paths.get(UPLOAD_DIRECTORY, sanitizedFilename).toString();
            file.transferTo(new File(path));

            product.setImageUrl(sanitizedFilename);

            if (product.getProductId() != null && productService.getProductById(product.getProductId()) != null) {
                // Update existing product
                productService.editProduct(product);
            } else {
                // Save new product
                productService.saveProduct(product);
            }

            List<ProductModel> list = productService.getDetailProduct();
            response.put("status", "success");
            response.put("message", "Product successfully saved");
            response.put("productList", list);

        } catch (IOException e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "Failed to upload file");
        }

        return response;
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
    public ModelAndView deleteById(@RequestParam("productId") Long id) {
        productService.deleteById(id);
        List<ProductModel> list = productService.getDetailProduct();
        ModelAndView modelAndView = new ModelAndView("AdminProduct");
        modelAndView.addObject("productList", list);
        return modelAndView;
    }
    @RequestMapping(value ="/editProduct",method = RequestMethod.GET)
    public ModelAndView getOneObject(@RequestParam("productId") Long Id){
        ProductModel productModel=productService.getProductById(Id);
        List<ProductModel>list=productService.getDetailProduct();
        ModelAndView modelAndView=new ModelAndView("AdminProduct");
        modelAndView.addObject("productModel",productModel);
        modelAndView.addObject("productList",list);
        return modelAndView;

    }


}