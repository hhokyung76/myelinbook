package com.myelinbook.server.customer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.myelinbook.server.common.Constants;
import com.myelinbook.server.common.ReturnCode;
import com.myelinbook.server.common.domain.Code;
import com.myelinbook.server.common.domain.User;
import com.myelinbook.server.common.service.CodeService;

@Controller
@RequestMapping("/customermenu")
public class CustomerMainController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerMainController.class);
	
	@Autowired MessageSource messageSource;
	@Autowired CodeService codeService;

	/**
	 * customer 화면
	 */
	@RequestMapping(value = {"/customer"}, method = RequestMethod.GET, produces = "text/html; charset=utf8")
	public String customer(Locale locale, Model model, HttpServletResponse response) {

		List<Code> codeList = new ArrayList<Code>();
		Code code = new Code();
		
		try {
			code.setCodeGroupId(Constants.EMAIL_ADDRESS_CD);
			codeList = codeService.getList(code);
		} catch (Exception e) {
			logger.error("코드 조회 오류 : {}", e.getMessage());
		}
		
		model.addAttribute("codeList", codeList);
		
		return "customer/customer";
	}


}
