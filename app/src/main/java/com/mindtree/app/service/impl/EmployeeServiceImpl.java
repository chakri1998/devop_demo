package com.mindtree.app.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindtree.app.entity.Employee;
import com.mindtree.app.repo.EmployeeRepo;
import com.mindtree.app.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	EmployeeRepo employeeRepo;
	@Override
	public String saveEmployeeFeedback(Employee employee) {
		int i = -1;
		boolean flag = false;
		try {
			Optional<Employee> optionalEmployee = employeeRepo.findById(employee.getmId());
			if(optionalEmployee.get()!=null)
			{
				i = employeeRepo.updateFeedback(employee.getRating(),employee.getmId());
			}
		}
		catch (Exception e) {
			employeeRepo.save(employee);
			flag=true;
		}
		if(i==1)
		{
			return "feedback updated successfully";
		}
		return flag?"feedback Submitted successfully":"failed to record feed"; 
	}

}
