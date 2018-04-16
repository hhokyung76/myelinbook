package com.myelinbook.server.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.myelinbook.server.common.Constants;
import com.myelinbook.server.common.ReturnCode;
import com.myelinbook.server.common.domain.Customer;
import com.myelinbook.server.common.domain.User;
import com.myelinbook.server.common.service.CodeService;
import com.myelinbook.server.customer.controller.model.CustomerList;
import com.myelinbook.server.customer.service.CustomerService;
import com.myelinbook.server.utils.OpenStringUtils;

@Controller
@RequestMapping(value = {"/customer", "/customer"})
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired MessageSource messageSource;
	@Autowired CustomerService customerService;
	
	/**
	 * 고객사 이메일 정보 중복 체크
	 */
	@RequestMapping(value = {"/checkEmailDupl"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String checkEmailDupl(@ModelAttribute Customer customer, Model model, HttpServletResponse response, HttpSession session) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customer: " + customer.toString());
		

		int checkCount = customerService.countEmail(customer);
		returnMap.put("success", "success");
		returnMap.put("checkCount", checkCount);
		logger.info("returnMap: "+returnMap);

//		List<Customer> returnList = customerService.list(customer);
//
//		returnMap.put("success", "success");
//		returnMap.put("list", returnList);

		logger.info(" returnMap : " + returnMap);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	
	/**
	 * 고객정보 리스트 요청
	 */
	@RequestMapping(value = {"/customerList"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String customerList(@ModelAttribute Customer customer, Model model, HttpServletResponse response, HttpSession session) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customer: " + customer.toString());
		

		logger.info("Constants.GRID_PAGE_LIST_SIZE: " + Constants.GRID_PAGE_LIST_SIZE);
		int totalCount = customerService.count(customer);
		//int totalCount = 100;
		customer.setStartIndex(customer.getqCurrPage()*Constants.GRID_PAGE_LIST_SIZE);
		customer.setPageListSize(Constants.GRID_PAGE_LIST_SIZE);
		logger.info("totalCount: " + totalCount);
		double totalPageTemp = (double) totalCount / Constants.GRID_PAGE_LIST_SIZE;
		int totalPage = (int) Math.ceil(totalPageTemp);
		List<Customer> returnList = customerService.list(customer);

		returnMap.put("success", "success");
		returnMap.put("totalCount", totalCount);
		returnMap.put("totalPage", totalPage);
		returnMap.put("pageListSize", Constants.GRID_PAGE_LIST_SIZE);
		returnMap.put("list", returnList);

		logger.info("returnMap: "+returnMap);

//		List<Customer> returnList = customerService.list(customer);
//
//		returnMap.put("success", "success");
//		returnMap.put("list", returnList);

		logger.info(" returnList.size : " + returnList.size());
		logger.info(" returnMap : " + returnMap);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	

	/**
	 * 고객정보 리스트 요청
	 */
	@RequestMapping(value = {"/customerPopList"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String customerPopList(@ModelAttribute Customer customer, Model model, HttpServletResponse response, HttpSession session) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customer: " + customer.toString());
		
		List<Customer> returnList = customerService.popList(customer);

		returnMap.put("success", "success");
		returnMap.put("list", returnList);


		logger.info(" returnList.size : " + returnList.size());
		logger.info(" returnMap : " + returnMap);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	
	/**
	 * 고객정보 리스트 요청
	 */
	@RequestMapping(value = {"/addCustomer"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String addCustomer(@ModelAttribute Customer customer, Model model, HttpServletResponse response, HttpSession session) {
		

		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customer: " + customer);
		customer.setRegId("good");

		if (customer.getUpdateYn().equals("N")) {
			customerService.add(customer);
			returnMap.put("success", "success");
		}else {
			customerService.mod(customer);
			returnMap.put("success", "success");
			
		}
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	

	
	
	/**
	 * 코드그룹 저장처리 
	 * 2018.01.12
	 * author : hokyung.lee
	 */
	@RequestMapping(value = {"/saveCustomer"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String add(@ModelAttribute Customer customer, Model model, HttpServletResponse response, HttpSession session) {

		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customer: " + customer);
		customer.setRegId("good");

		if (customer.getUpdateYn().equals("N")) {
			customerService.add(customer);
			returnMap.put("success", "success");
		}else {
			customerService.mod(customer);
			returnMap.put("success", "success");
			
		}
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}

	

	/**
	 * Group Code 정보 수정 
	 */
	@RequestMapping(value = {"/mod"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String mod(@ModelAttribute Customer customer, Locale locale, Model model, HttpServletResponse response) {
		String success = ReturnCode.RETURN_SUCCESS;

		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록
		
		try {
			customerService.mod(customer);
		} catch (Exception e) {
			logger.error("카테고리 정보 수정 : DB삽입 에러 : {}", e.getMessage());
			success = ReturnCode.RETURN_FAIL;
		}
		
		model.addAttribute("success", success);
		
		if (StringUtils.equals(success, ReturnCode.RETURN_SUCCESS)) {
			logger.info("[{}]  정보 수정 성공.", customer.getCustId());
		}
		
		returnMap.put("success", success);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	/**
	 * 삭제 처리 useYn = 'N'으로 세팅 
	 * 2018.01.09
	 * author : hokyung.lee
	 */						 
	@RequestMapping(value = {"/delCustList"}, method = RequestMethod.POST, produces = "text/html; charset=utf8")
	@ResponseBody
	public String delCustList(@ModelAttribute CustomerList customerList, Model model, HttpServletResponse response, HttpSession session) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>(); // 커스텀 타입 목록

		logger.info("customerList: " + customerList);
		logger.info("customerList.getCustomerList(): " + customerList.getCustomerList());

		for (int ii = 0; ii < customerList.getCustomerList().size(); ii++) {
			Customer customer = customerList.getCustomerList().get(ii);
			customer.setDelId("GOOD");
			customerService.mod(customer);
		}
		returnMap.put("success", "success");
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(returnMap);
		return jsonStr;
	}
	
	
	

}
