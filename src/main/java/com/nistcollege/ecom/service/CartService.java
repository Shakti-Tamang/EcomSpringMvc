package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.CartModel;

import java.util.List;

public interface CartService {
    public void saveCart(CartModel cartModel);
    public List<CartModel>listOfcart();
    public void deleteCart(Long Id);
    public CartModel getCartById(Long Id);


}
