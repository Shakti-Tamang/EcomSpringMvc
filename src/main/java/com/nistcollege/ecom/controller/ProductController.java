package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.CartModel;
import com.nistcollege.ecom.model.ProductModel;
import com.nistcollege.ecom.service.CartService;
import com.nistcollege.ecom.service.ProductService;
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
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    CartService cartService;

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


    private static final String UPLOAD_DIRECTORY = "C:\\Users\\Shakti\\IdeaProjects\\Ecommerse\\src\\main\\webapp\\image";


//    it is made bacause it works first
    static {
        File directory = new File(UPLOAD_DIRECTORY);
        if (!directory.exists()) {
            directory.mkdirs();
        }
    }

    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)

//    string is key and object is v
//    alue to be stored in this case vale is stored ramdomly
//    so teasilae uta value talamathi cha
    public @ResponseBody
    Map<String, Object> addProduct(HttpServletRequest request, @ModelAttribute ProductModel product) {

//        in hashing it dont store value in ascendong uniuw key for all values
        Map<String, Object> response = new HashMap<>();
        MultipartFile file = product.getImageFile();

        if (file.isEmpty()) {
            response.put("status", "error");

//            String is key and object strores values
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

    @RequestMapping(value = "/editProduct", method = RequestMethod.GET)
    public ModelAndView getOneObject(@RequestParam("productId") Long Id) {
        ProductModel productModel = productService.getProductById(Id);
        List<ProductModel> list = productService.getDetailProduct();
        ModelAndView modelAndView = new ModelAndView("AdminProduct");
        modelAndView.addObject("productModel", productModel);
        modelAndView.addObject("productList", list);
        return modelAndView;

    }

    @RequestMapping(value = "/addToCartPannel", method = RequestMethod.GET)
    public ModelAndView goToCart() {

        List<CartModel> cartList = cartService.listOfcart();

        // Return the cart view
        ModelAndView modelAndView = new ModelAndView("Cart");
        modelAndView.addObject("cart", cartList);
        return modelAndView;

    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView getHome() {

        ModelAndView modelAndView = new ModelAndView("Home");
        return modelAndView;
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.GET)
    public ModelAndView addToCart(@RequestParam("productId") Long productId, HttpSession session) {

        // Get the product details
        ProductModel productModel = productService.getProductById(productId);

        // Create a new CartModel and set the product details
        CartModel cartModel = new CartModel();
        cartModel.setBrand(productModel.getBrand());
        cartModel.setCategory(productModel.getCategory());
        cartModel.setName(productModel.getName());
        cartModel.setPrice(productModel.getPrice());
        cartModel.setQuantity(1); // Set initial quantity to 1

        // Save the cart model
        cartService.saveCart(cartModel);

        // Retrieve the list of cart items
        List<CartModel> cartList = cartService.listOfcart();

        // Return the cart view
        ModelAndView modelAndView = new ModelAndView("Cart");
        modelAndView.addObject("cart", cartList);
        return modelAndView;
    }

    @RequestMapping(value = "/deleteCart", method = RequestMethod.GET)
    public ModelAndView getAfterDelete(@RequestParam("id") Long Id) {
        cartService.deleteCart(Id);
        List<CartModel> list = cartService.listOfcart();
        // Return the cart view
        ModelAndView modelAndView = new ModelAndView("Cart");
        modelAndView.addObject("cart", list);
        return modelAndView;
    }

    @RequestMapping(value = "/increaseQuantity", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> increaseQuantity(@RequestParam("id") Long id) {
        System.out.println("Increase quantity request for product id: " + id);
        CartModel cartItem = cartService.getCartById(id);
        Map<String, Object> response = new HashMap<>();
        if (cartItem != null) {
            ProductModel product = productService.getProductByName(cartItem.getName());
            if (cartItem.getQuantity() < product.getQuantity()) {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                cartService.updateCart(cartItem); // Save the updated cart item
                response.put("newQuantity", cartItem.getQuantity());
                System.out.println("New quantity: " + cartItem.getQuantity());
            } else {
                response.put("error", "Maximum quantity reached");
            }
        } else {
            response.put("error", "Cart item not found");
        }

        return response;
    }

    @RequestMapping(value = "/decreaseQuantity", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> decreaseQuantity(@RequestParam("id") Long id) {
        System.out.println("Decrease quantity request for product id: " + id);
        CartModel cartItem = cartService.getCartById(id);
        Map<String, Object> response = new HashMap<>();
        if (cartItem != null) {
            if (cartItem.getQuantity() > 1) {
                cartItem.setQuantity(cartItem.getQuantity() - 1);
                cartService.updateCart(cartItem); // Save the updated cart item
                response.put("newQuantity", cartItem.getQuantity());
                System.out.println("New quantity: " + cartItem.getQuantity());
            } else {
                response.put("error", "Minimum quantity reached");
            }
        } else {
            response.put("error", "Cart item not found");
        }
        return response;
    }

    @RequestMapping(value = "/paye",method = RequestMethod.GET)
    public ModelAndView getPaye(){

        List<CartModel> list = cartService.listOfcart();
        ModelAndView modelAndView=new ModelAndView("Payement");
        modelAndView.addObject("cart", list);


        return modelAndView;

    }




}