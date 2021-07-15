package com.thehandsome.app.controllers;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.app.dto.Buying_HistoryDTO;
import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.service.Buying_HistoryService;
import com.thehandsome.app.service.MemberService;
import com.thehandsome.app.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class MypageController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	Buying_HistoryService buying_HistoryService;
	
	@GetMapping("/mypage")
	@Transactional
	public ModelAndView Mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView("Mypage");

		try {
			String userId = (String) session.getAttribute("id");
			MemberDTO memberDTO = memberService.getMember(userId);
			List<Buying_HistoryDTO> buying_HistoryDTO = buying_HistoryService.getBuying_HistoryList(userId);
			session.setAttribute("orderCount", buying_HistoryDTO.size());
			mav.addObject("url", "/app/mypage");
			mav.addObject("memberDTO", memberDTO);
			mav.setViewName("Mypage");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	

	@GetMapping("/mypage/order")
	@Transactional
	public ModelAndView myOrder(HttpSession session) {
		ModelAndView mav = new ModelAndView("MypageOrder");
		
		try {
			String userId = (String) session.getAttribute("id");
			List<Buying_HistoryDTO> buying_HistoryDTO = buying_HistoryService.getBuying_HistoryList(userId);
			List<ProductDTO> productDTO = new LinkedList<ProductDTO>();
			for(int i=0; i<buying_HistoryDTO.size(); i++) {
				productDTO.add(productService.getProductDTOAll(buying_HistoryDTO.get(i).getProduct_id(), buying_HistoryDTO.get(i).getColor()));
			}
			mav.addObject("buyinglist", buying_HistoryDTO);
			mav.addObject("productlist", productDTO);
			mav.addObject("orderCount", buying_HistoryDTO.size());
			session.setAttribute("orderCount", buying_HistoryDTO.size());
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
