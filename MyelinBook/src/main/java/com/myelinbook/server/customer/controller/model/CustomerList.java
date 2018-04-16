package com.myelinbook.server.customer.controller.model;

import java.io.Serializable;
import java.util.List;

import com.myelinbook.server.common.domain.Customer;

public class CustomerList implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 630080138079165408L;
	
	
	private List<Customer>  customerList;
	
	
	public List<Customer> getCustomerList() {
		return customerList;
	}
	public void setCustomerList(List<Customer> customerList) {
		this.customerList = customerList;
	}
	
	

	
	
}
