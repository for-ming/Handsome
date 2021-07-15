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

import com.thehandsome.app.service.CartService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class BarcodeController {
	@Autowired
	private CartService cartService;
	
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@GetMapping("/barcode")
	@Transactional
	public ModelAndView barcodeScan(HttpSession session) {
		ModelAndView mav = new ModelAndView("ScanBarcode");

		try {
			mav.addObject("url", "/handsome_main/barcode");
			mav.setViewName("ScanBarcode");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	@GetMapping("/barcode/create")
	@Transactional
	public ModelAndView barcodeCreate(HttpSession session) {
		ModelAndView mav = new ModelAndView("CreateBarcode");

		try {
			mav.addObject("url", "/handsome_main/barcode/create");
			mav.setViewName("CreateBarcode");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
}
