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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Transactional
public class CustomerController {
    @Autowired
    UserService userService;
    @Autowired
    SessionFactory sessionFactory;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView get() {
        ModelAndView modelAndView = new ModelAndView("Home");
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


    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public ModelAndView saveCustomer(@ModelAttribute Usermodel1 usermodel1) {
        ModelAndView modelAndView = new ModelAndView();

        Boolean found = userService.foundUser(usermodel1);

        if (found) {
            modelAndView.setViewName("redirect:/signup?error=exists");
        } else {
            userService.saveUser(usermodel1);
            modelAndView.setViewName("redirect:/home?success=true");
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
    public ModelAndView logInUser(@ModelAttribute Usermodel1 usermodel1) {
        ModelAndView modelAndView = new ModelAndView(); // Initialize ModelAndView

        String email = usermodel1.getEmail();
        String password = usermodel1.getPassword();
        Session session = sessionFactory.getCurrentSession();

        List<Usermodel1> list = session.createCriteria(Usermodel1.class)
                .add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password))
                .list();

        if (list != null && !list.isEmpty()) {
            Usermodel1 foundUser = list.get(0);
            String role = foundUser.getRole();

            // Check if the role is Admin
            if (role.equalsIgnoreCase("Admin")) {
                String user = userService.loginByEmail(usermodel1);
                if (user == null) {
                    modelAndView.setViewName("LogIn");
                    modelAndView.addObject("message", "User does not exist");
                } else {
                    modelAndView.addObject("user", user);
                    modelAndView.setViewName("AdminGet"); // Redirect to Admin view
                }
            } else {
                modelAndView.setViewName("LogIn");
                modelAndView.addObject("message", "Access denied. Admins only.");
            }
        } else {
            modelAndView.setViewName("LogIn");
            modelAndView.addObject("message", "Invalid email or password");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/LoggedInuserCustomer", method = RequestMethod.POST)
    public ModelAndView logInUserCustomer(@ModelAttribute Usermodel1 usermodel1) {
        ModelAndView modelAndView = new ModelAndView(); // Initialize ModelAndView

        String email = usermodel1.getEmail();
        String password = usermodel1.getPassword();
        Session session = sessionFactory.getCurrentSession();

        List<Usermodel1> list = session.createCriteria(Usermodel1.class)
                .add(Restrictions.eq("email", email))
                .add(Restrictions.eq("password", password))
                .list();

        if (list != null && !list.isEmpty()) {
            Usermodel1 foundUser = list.get(0);
            String role = foundUser.getRole();

            // Check if the role is Admin
            if (role.equalsIgnoreCase("User")) {
                String user = userService.loginByEmail(usermodel1);
                if (user == null) {
                    modelAndView.setViewName("Home");
                    modelAndView.addObject("message", "User does not exist");
                } else {
                    modelAndView.addObject("user", user);
                    modelAndView.setViewName("customerDashBoard"); // Redirect to Admin view
                }
            } else {
                modelAndView.setViewName("Home");
                modelAndView.addObject("message", "Access denied. User only.");
            }
        } else {
            modelAndView.setViewName("Home");
            modelAndView.addObject("message", "Invalid email or password");
        }

        return modelAndView;
    }

}
