package com.myelinbook.server.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsingSessionTestController
{
	@ResponseBody
	@RequestMapping(path="/session-test", produces="text/plain")
	public String sessionTest(HttpSession session)
	{
		session.setAttribute("test", "hello");
		return (String)session.getAttribute("test");
	}
	
	@ResponseBody
	@RequestMapping(path="/get-session/{id}", produces="text/plain")
	public String getSessionTest(@PathVariable String id, HttpSession session)
	{
		
		return (String)session.getAttribute("user_id");
	}
}