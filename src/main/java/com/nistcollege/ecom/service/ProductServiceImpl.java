package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.ProductModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Transactional
public class ProductServiceImpl implements ProductService {
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
    public void deleteById(int id) {
Session session=sessionFactory.getCurrentSession();
ProductModel productModel=session.get(ProductModel.class,id);
if(productModel!=null){
    session.delete(productModel);
}
    }
}
