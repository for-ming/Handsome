package com.thehandsome.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MoveController {
	
	@GetMapping("/cart")
	public ModelAndView login() throws Exception {
		return new ModelAndView("cart");
	}
}
