package com.myelinbook.server.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myelinbook.server.common.domain.Code;
import com.myelinbook.server.common.domain.Customer;
import com.myelinbook.server.common.mapper.CodeMapper;
import com.myelinbook.server.customer.mapper.CustomerMapper;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired CustomerMapper customerMapper;
	


	@Override
	public List<Customer> list(Customer customer) {
		return customerMapper.list(customer);
	}

	@Override
	public List<Customer> popList(Customer customer) {
		return customerMapper.popList(customer);
	}

	@Override
	public Customer get(Customer customer) {
		return customerMapper.get(customer);
	}

	@Override
	public int add(Customer customer) {
		return customerMapper.add(customer);
	}

	@Override
	public int mod(Customer customer) {
		return customerMapper.mod(customer);
	}

	@Override
	public int count(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.count(customer);
	}

	@Override
	public int countEmail(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.countEmail(customer);
	}

}
