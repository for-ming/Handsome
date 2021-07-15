package com.thehandsome.app.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.CartDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.service.CartService;
import com.thehandsome.app.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CartService cartService;

	@GetMapping(value = "/signup")
	public String signupview(Model model) {
		List<BrandDTO> brandlist = null;
		List<DepartmentDTO> departmentlist = null;
		try {

			brandlist = memberService.getBrandlist();
			departmentlist = memberService.getDepartmentlist();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(brandlist);
		model.addAttribute("brandlist", brandlist);
		model.addAttribute("departmentlist", departmentlist);

		return "member/signup";
	}

	@PostMapping(value = "/signupAction")
	public String signup(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model) {
		try {
			memberService.signup(memberDTO);
			System.out.println(memberDTO);
			return "redirect:/member/signin";
		} catch (Exception e) {

			e.printStackTrace();
			return "redirect:/member/signup";
		}
	}

	@PostMapping(value = "/check/idcheck")
	@ResponseBody
	public String idcheck(@RequestParam(required = true) String id) {
		if (id.equals("")) {
			return "exist";
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ID", id);
			memberService.getMemberById(map);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("1");
			return "exist";
		}
		return "possible";

	}

	@PostMapping(value = "/check/phonecheck")
	@ResponseBody
	public String phonechek(@RequestParam(required = true) String phone) {
		System.out.println("phonecheckcontroller");
		if (phone.equals("")) {
			return "exist";
		}
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("PHONE", phone);
			memberService.getMemberByPhone(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("1");
			return "exist";
		}
		return "possible";
	}

	@GetMapping(value = "/signin")
	public String signinview(Model model) {

		return "member/signin";
	}

	@PostMapping(value = "/signinAction")
	public String signinAction(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model, HttpSession session) {
		try {
			System.out.println("loginaction");
			System.out.println(memberDTO);
			
			MemberDTO member = memberService.signin(memberDTO);
			
			System.out.println(member);
			session.setAttribute("memberInfo", member);
			session.setAttribute("id", member.getId());
			total_cart(session);

			return "redirect:/";


		} catch (Exception e) {

			e.printStackTrace();
			return "redirect:/member/signin";
		}
	}
	
	@GetMapping(value = "/signout")
	public String signout(Model model, HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("memberInfo");
		
		return "member/signin";
	}

	public void total_cart(HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("id");
		List<CartDTO> cartDTO = cartService.getCartList(userId);
		session.setAttribute("totalCart", cartDTO.size());
		System.out.println(cartDTO.size());
	}
}
