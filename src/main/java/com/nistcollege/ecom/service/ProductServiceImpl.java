package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.ProductModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;

@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void saveProduct(ProductModel productModel) {
        Session session=sessionFactory.getCurrentSession();
        session.save(productModel);
    }
}
