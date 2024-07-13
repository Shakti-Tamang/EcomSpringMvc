package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.model.Usermodel1;
import com.nistcollege.ecom.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    userService.saveUser(usermodel1);
   ModelAndView modelAndView=new ModelAndView("AdminGet");
        modelAndView.addObject("list",modelAndView);
        return modelAndView;
    }
}
