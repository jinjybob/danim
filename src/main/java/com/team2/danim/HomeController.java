package com.team2.danim;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		
		
		req.setAttribute("contentPage", "index.jsp");
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexGo(HttpServletRequest req) {
		
		return home(req);
	}
	
	
}
