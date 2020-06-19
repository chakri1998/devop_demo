package com.mindtree.app.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mindtree.app.entity.Employee;
import com.mindtree.app.service.EmployeeService;


@Controller
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	

	@RequestMapping("/")
	public String newCustomerForm(Map<String, Object> model) {
	    Employee employee = new Employee();
	    model.put("employee",employee);
	    return "index";
	}

	@RequestMapping(value = "save-employee-feedback",method = RequestMethod.POST)
	public String saveCustomer(@ModelAttribute("employee") Employee employee) {
	 String response = employeeService.saveEmployeeFeedback(employee);
	  return "redirect:/thanku";
	}
	
	  @RequestMapping("/thanku")
	  public String viewThankYouPage() 
	  {
		  return "thank";
	  
	  }
		 
}
