package com.nistcollege.ecom.controller;

import com.google.gson.Gson;
import com.nistcollege.ecom.model.ProductModel;
import com.nistcollege.ecom.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class SearchController {
    @Autowired
    ProductService productService;


    @RequestMapping(value = "/search",method = RequestMethod.GET )

    public @ResponseBody String search(@RequestParam("category") String category){
        List<ProductModel>list=null;
    if(category==null || category.isEmpty()){

     list=productService.getDetailProduct();
  }
else{

list=productService.searchByCategory(category);
}
        Gson gson = new Gson();
        return gson.toJson(list);

    }
}
