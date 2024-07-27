package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.ProductModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.query.Query; // This is the correct import for Hibernate Query

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Transactional
public class ProductServiceImpl implements ProductService{
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void saveProduct(ProductModel productModel) {
        Session session=sessionFactory.getCurrentSession();
        session.save(productModel);
    }

    @Override
    public List<ProductModel> getDetailProduct() {
        Session session=sessionFactory.getCurrentSession();
        List<ProductModel>list=session.createCriteria(ProductModel.class).list();
        return list.isEmpty()?new ArrayList<>():list;
    }

    @Override
    public void deleteById(Long id) {
Session session=sessionFactory.getCurrentSession();
ProductModel productModel=session.get(ProductModel.class,id);
if(productModel!=null){
    session.delete(productModel);
}
    }

    @Override
    public ProductModel getProductById(Long Id) {
    Session session=sessionFactory.getCurrentSession();
    ProductModel productModel=session.get(ProductModel.class,Id);
        return productModel;
    }


    @Override
    public ProductModel getProductByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query<ProductModel> query = session.createQuery("FROM ProductModel WHERE name = :name", ProductModel.class);
        query.setParameter("name", name);
        return query.uniqueResultOptional().orElse(null);
    }


    @Override
    public void editProduct(ProductModel productModel) {
    Session session=sessionFactory.getCurrentSession();
    ProductModel productModel1=session.get(ProductModel.class,productModel.getProductId());

    if(productModel1!=null){
        productModel1.setImageUrl(productModel.getImageUrl());
        productModel1.setBrand(productModel.getBrand());
        productModel1.setCategory(productModel.getCategory());
        productModel1.setDescription(productModel.getDescription());
        productModel1.setName(productModel.getName());
        productModel1.setPrice(productModel.getPrice());
        productModel1.setQuantity(productModel.getQuantity());
        session.save(productModel1);
    }
    }
}
