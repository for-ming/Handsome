package com.thehandsome.app.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class MypageController {

	@GetMapping("/mypage/order")
	@Transactional
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mav = new ModelAndView("MypageOrder");

		try {
			String userId = (String) session.getAttribute("id");

			mav.addObject("url", "/app/mypage/order");
			mav.setViewName("MypageOrder");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
}
