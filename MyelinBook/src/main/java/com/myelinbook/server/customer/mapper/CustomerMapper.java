package com.myelinbook.server.customer.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myelinbook.server.common.domain.Customer;
import com.myelinbook.server.common.domain.User;

@Mapper
public interface CustomerMapper {

	/**
	 * 개수조회
	 */
	public int count(Customer customer);

	/**
	 * 목록조회 팝업용
	 */
	public List<Customer> popList(Customer customer);
	
	/**
	 * 목록조회
	 */
	public List<Customer> list(Customer customer);
	
	/**
	 * 상세조회
	 */
	public Customer get(Customer customer);
	
	/**
	 * 추가
	 */
	public int add(Customer customer);
	
	/**
	 * 수정
	 */
	public int mod(Customer customer);

	/**
	 * 이메일체크 수
	 */
	public int countEmail(Customer customer);
		
}
