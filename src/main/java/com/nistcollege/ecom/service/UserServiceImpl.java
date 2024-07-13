package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.Usermodel1;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
public class UserServiceImpl implements UserService{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void saveUser(Usermodel1 usermodel1) {
        Session session=sessionFactory.getCurrentSession();
        session.save(usermodel1);
    }

    @Override
    public List<Usermodel1> list() {
        Session session=sessionFactory.getCurrentSession();
        List<Usermodel1>list=session.createCriteria(Usermodel1.class).list();
        return list;
    }
}
