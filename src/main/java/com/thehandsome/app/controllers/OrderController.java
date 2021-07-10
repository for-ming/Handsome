package com.thehandsome.app.controllers;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class OrderController {
	@Autowired
	private MemberService memberService;
	
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@GetMapping("/checkout")
	@Transactional
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mav = new ModelAndView("Checkout");

		try {
			//임의 session id 
			session.setAttribute("id", "ming");
			
			String userId = (String) session.getAttribute("id");
			MemberDTO memberDTO = memberService.getMemberInfo(userId);
			
			mav.addObject("memberDTO", memberDTO);
			mav.addObject("url", "/app/checkout");
			mav.setViewName("Checkout");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	@GetMapping("/order")
	@Transactional
	public ModelAndView order(HttpSession session) {
		ModelAndView mav = new ModelAndView("Order");

		boolean isUser = false; 
		try {
			String userId = (String) session.getAttribute("id");
			//HashMap<String, Object> checkmap = new HashMap<String, Object>();
			//checkmap.put("userId", session.getAttribute("id"));
			
			if(session.getAttribute("id") != null) {
				isUser = true;
			}

			//mav.addObject("isUser", isUser);
			//mav.addObject("cartDTO", cartDTO);
			mav.addObject("url", "/app/order");
			mav.setViewName("Order");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
}
