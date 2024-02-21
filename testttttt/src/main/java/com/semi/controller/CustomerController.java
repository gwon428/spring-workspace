package com.semi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.semi.model.vo.Customer;
import com.semi.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@GetMapping("allCustomer")
	public String allCustomer(Model model) {
		List<Customer> list = service.showAllCustomer();
		model.addAttribute("list", list);
		return "allCustomer";
	}
}
