package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.Usermodel1;
import com.nistcollege.ecom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    UserService userService;
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public ModelAndView get(){
        ModelAndView modelAndView=new ModelAndView("SingUp");
        return modelAndView;
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public ModelAndView save(@ModelAttribute Usermodel1 usermodel1){
        ModelAndView modelAndView=null;
        Boolean found=userService.foundUser(usermodel1);

        if(found==true){
            modelAndView=new ModelAndView("SingUp");
            modelAndView.addObject("message", "User already exists. Please try again with a different email.");

        }
        if(found==false){
            userService.saveUser(usermodel1);
            modelAndView=new ModelAndView("LogIn");
        }


        return modelAndView;
    }
    @RequestMapping(value = "/adminDetail",method = RequestMethod.GET)
    public ModelAndView getAdmin(){
        List<Usermodel1>getUser=userService.list();
        ModelAndView modelAndView=new ModelAndView("AdminGet");
        modelAndView.addObject("list",getUser);
        return modelAndView;

    }

    @RequestMapping(value = "/logIn",method = RequestMethod.GET)
    public ModelAndView getLogin(){
        ModelAndView modelAndView=new ModelAndView("LogIn");
        return modelAndView;
    }
    @RequestMapping(value = "/LoggedInuser",method = RequestMethod.POST)
    public ModelAndView logInUser(Usermodel1 usermodel1){
        ModelAndView modelAndView=null;
        String user=userService.loginByEmail(usermodel1);
        if(user==null){
            modelAndView=new ModelAndView("LogIn");
            modelAndView.addObject("message","User doesnot exist");

        }
        else{
            modelAndView=new ModelAndView("customerDashBoard");
            modelAndView.addObject("user",user);

        }
  return modelAndView;
    }
}
