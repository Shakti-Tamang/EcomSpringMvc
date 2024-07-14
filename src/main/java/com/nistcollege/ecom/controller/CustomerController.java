package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.Usermodel1;
import com.nistcollege.ecom.service.UserService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.transaction.Transactional;
import java.util.List;

@Controller
@Transactional
public class CustomerController {
    @Autowired
    UserService userService;
    @Autowired
    SessionFactory sessionFactory;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView get() {
        ModelAndView modelAndView = new ModelAndView("SingUp");
        return modelAndView;
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView getSignUp() {
        ModelAndView modelAndView = new ModelAndView("SingUp");
        return modelAndView;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Usermodel1 usermodel1) {
        ModelAndView modelAndView = null;
        Boolean found = userService.foundUser(usermodel1);

        if (found == true) {
            modelAndView = new ModelAndView("SingUp");
            modelAndView.addObject("message", "User already exists. Please try again with a different email.");

        }
        if (found == false) {
            userService.saveUser(usermodel1);
            modelAndView = new ModelAndView("LogIn");
        }


        return modelAndView;
    }

    @RequestMapping(value = "/adminDetail", method = RequestMethod.GET)
    public ModelAndView getAdmin() {
        List<Usermodel1> getUser = userService.list();
        ModelAndView modelAndView = new ModelAndView("AdminGet");
        modelAndView.addObject("list", getUser);
        return modelAndView;

    }

    @RequestMapping(value = "/logIn", method = RequestMethod.GET)
    public ModelAndView getLogin() {
        ModelAndView modelAndView = new ModelAndView("LogIn");
        return modelAndView;
    }

    @RequestMapping(value = "/LoggedInuser", method = RequestMethod.POST)
    public ModelAndView logInUser(Usermodel1 usermodel1) {
        ModelAndView modelAndView = new ModelAndView();
        String email = usermodel1.getEmail();
        String password = usermodel1.getPassword();
        Session session = sessionFactory.getCurrentSession();

        List<Usermodel1> list = session.createCriteria(Usermodel1.class)
                .add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password))
                .list();

        if (list != null && !list.isEmpty()) {
            Usermodel1 foundUser = list.get(0);
            String role = foundUser.getRole(); // Ensure this method exists
            String user = userService.loginByEmail(usermodel1);
            if (user == null) {
                modelAndView.setViewName("LogIn");
                modelAndView.addObject("message", "User does not exist");
            } else {
                modelAndView.addObject("user", user);
                if (role.equalsIgnoreCase("User")) {
                    modelAndView.setViewName("customerDashBoard");
                } else if (role.equalsIgnoreCase("Admin")) {
                    modelAndView.setViewName("AdminGet");
                }
            }
        } else {
            modelAndView.setViewName("LogIn");
            modelAndView.addObject("message", "Invalid email or password");
        }

        return modelAndView;
    }
}