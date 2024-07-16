package com.nistcollege.ecom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {

    @RequestMapping(value = "/product",method = RequestMethod.GET)
    public ModelAndView get(){
        ModelAndView modelAndView=new ModelAndView("AdminProduct");
        return modelAndView;
    }
}
