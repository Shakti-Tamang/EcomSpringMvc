package com.nistcollege.ecom.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.transaction.Transactional;

@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    SessionFactory sessionFactory;
}
