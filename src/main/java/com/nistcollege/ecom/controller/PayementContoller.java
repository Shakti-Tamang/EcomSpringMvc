package com.nistcollege.ecom.controller;

import com.nistcollege.ecom.service.KhaltiPaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PayementContoller {

    private final KhaltiPaymentService khaltiPaymentService;

    @RequestMapping(value = "/getPay",method = RequestMethod.GET)
    public ModelAndView getPay(){
        ModelAndView modelAndView=new ModelAndView("Pay");
        return modelAndView;
    }

    //    comstructor:
    @Autowired
    public PayementContoller(KhaltiPaymentService khaltiPaymentService) {
        this.khaltiPaymentService = khaltiPaymentService;
    }

    @RequestMapping(value = "/processPayment", method = RequestMethod.POST)
    @ResponseBody
    public String processPayment(@RequestParam("token") String token, @RequestParam("amount") int amount) {
        khaltiPaymentService.processPayment(token, amount);
        return "Payment processed successfully";
    }


}
