package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.ProductModel;

import java.util.List;

public interface ProductService {
    public void saveProduct(ProductModel productModel);
    public List<ProductModel> getDetailProduct();
    public void deleteById(int id);
}
