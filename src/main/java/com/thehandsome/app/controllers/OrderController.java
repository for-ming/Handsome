package com.thehandsome.app.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.app.dto.CartDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class OrderController {

	@GetMapping("/checkout")
	@Transactional
	public ModelAndView order(HttpSession session) {
		ModelAndView mav = new ModelAndView("Checkout");

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
			//mav.addObject("url", "/app/cart");
			mav.setViewName("Checkout");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
}
