package com.example.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Category;
import com.example.model.Employee;
import com.example.model.ItemStcok;
import com.example.repository.EmployeeRepository;
import com.example.repository.ItemStcokRepository;


@Service
public class EmployeeServiceImp implements EmployeeService {

	
	@Resource
	private EmployeeRepository repository;

	@Override
	public ArrayList<Employee> findEmpsByDept(String dept) {
		ArrayList<Employee> empList = repository.findEmpsByDept(dept);
		return empList;
	}

	@Override
	public ArrayList<Employee> findAllEmp() {
		return (ArrayList<Employee>) repository.findAll();
	}


}
