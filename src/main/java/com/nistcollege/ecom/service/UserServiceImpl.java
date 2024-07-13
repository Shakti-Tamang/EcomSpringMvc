package com.nistcollege.ecom.service;

import com.nistcollege.ecom.model.Usermodel1;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
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

    @Override
    public boolean foundUser(Usermodel1 usermodel1) {
boolean found;
Session session=sessionFactory.getCurrentSession();
        // Create the criteria and check for existence
        String email = usermodel1.getEmail();
        List<Usermodel1> list = session.createCriteria(Usermodel1.class)
                .add(Restrictions.eq("email", email))
                .list();

        if(list.isEmpty()){
            found=false;
        }
        else{
            found=true;
        }
        return found;
    }
    public String loginByEmail(Usermodel1 usermodel1) {
        Session session = sessionFactory.getCurrentSession();
        String email = usermodel1.getEmail();
        String password = usermodel1.getPassword();
        String name = null;

        List<Usermodel1> list = session.createCriteria(Usermodel1.class)
                .add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password))
                .list();

        if (list != null && !list.isEmpty()) {
            // Since we added the password restriction, we can assume the first result matches both email and password
            Usermodel1 foundUser = list.get(0);
            name = foundUser.getUsername();
        }

        return name;
    }


}
