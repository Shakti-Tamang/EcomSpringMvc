package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.ProductModel;

import java.util.List;

public interface ProductService {
    public void saveProduct(ProductModel productModel);
    public List<ProductModel> getDetailProduct();
    public void deleteById(Long id);
    public ProductModel getProductById(Long Id);
    public ProductModel getProductByName(String name);
    public void editProduct(ProductModel productModel);
    public List<ProductModel>searchByCategory(String product);
}
