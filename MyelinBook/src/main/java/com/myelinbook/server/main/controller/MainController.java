package com.myelinbook.server.main.controller;

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
@RequestMapping(value = {"", "/"})
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MessageSource messageSource;

	/**
	 * 로그인 화면
	 */
	@RequestMapping(value = {"/index2"}, method = RequestMethod.GET, produces = "text/html; charset=utf8")
	@ResponseBody
	public String login(Locale locale, Model model, HttpServletResponse response) {
		return "user/login";
	}
	
	/**
	 * 로그인 화면
	 */
	@RequestMapping(value = {"/index"}, method = RequestMethod.GET, produces = "text/html; charset=utf8")
	@ResponseBody
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/main");
		return modelAndView;
	}
	
	

}
