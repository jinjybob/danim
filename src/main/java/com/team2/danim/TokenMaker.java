package com.team2.danim;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class TokenMaker {

	public static void make(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
		String token = sdf.format(d);
		req.setAttribute("token", token);
		req.getSession().setAttribute("token", token);
		System.out.println(token);
		
		
	}
	
	
	public static void make2(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
		String token2 = sdf.format(d);
		req.setAttribute("token2", token2);
		req.getSession().setAttribute("token2", token2);
		System.out.println(token2);
		
		
	}
	public static void make3(HttpServletRequest req) {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss:SS");
		String token2 = sdf.format(d);
		req.setAttribute("token2", token2);
		req.getSession().setAttribute("token2", token2);
		System.out.println(token2);
		
		
	}
	

		
}
