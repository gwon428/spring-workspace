package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.CustomerDAO;
import com.semi.model.vo.Customer;

@Service
public class CustomerService {

	@Autowired
	private CustomerDAO dao;
	
	public List<Customer> showAllCustomer(){
		return dao.showAllCustomer();
	}
}
