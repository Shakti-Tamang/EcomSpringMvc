package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.CartModel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Transactional
public class CartServiceImpl implements CartService {
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void saveCart(CartModel cartModel) {
        Session session=sessionFactory.getCurrentSession();
        session.save(cartModel);
    }

    @Override
    public List<CartModel> listOfcart() {
        Session session=sessionFactory.getCurrentSession();
      List<CartModel>list=session.createCriteria(CartModel.class).list();
      return list.isEmpty()?new ArrayList<>():list;
    }

    @Override
    public void deleteCart(Long Id) {
        Session session=sessionFactory.getCurrentSession();

        CartModel cartModel=session.get(CartModel.class,Id);

        if(cartModel!=null){
            session.delete(cartModel);
        }
    }

    @Override
    public CartModel getCartById(Long Id) {
        Session session=sessionFactory.getCurrentSession();
        CartModel cartModel=session.get(CartModel.class,Id);
        return cartModel;
    }
}
