package com.thehandsome.app.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.thehandsome.app.dto.CartDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.ProductcolorDTO;
import com.thehandsome.app.dto.ProductsizeDTO;
import com.thehandsome.app.service.CartService;
import com.thehandsome.app.service.DepartmentService;
import com.thehandsome.app.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private ProductService productService;
	
	private static Logger logger = LoggerFactory.getLogger(CartController.class);

	@GetMapping("/cart")
	@Transactional
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView("Cart");

		boolean isUser = false; 
		try {
			//임의 session id 
			session.setAttribute("id", "ming");
			
			String userId = (String) session.getAttribute("id");
			List<CartDTO> cartDTO = cartService.getCartList(userId);
			List<DepartmentDTO> departmentDTO = departmentService.getDepartmentList();
			total_cart(session);
			
			if(session.getAttribute("id") != null) {
				isUser = true;
			}
			
			mav.addObject("isUser", isUser);
			mav.addObject("cartDTO", cartDTO);
			mav.addObject("departmentDTO", departmentDTO);
			mav.addObject("url", "/app/cart");
			mav.setViewName("Cart");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	public void total_cart(HttpSession session) throws Exception{
		String userId = (String) session.getAttribute("id");
		List<CartDTO> cartDTO = cartService.getCartList(userId);
		session.setAttribute("totalCart", cartDTO.size());
	}
	
	@PostMapping(value = "/cart/update", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> cart_update(@ModelAttribute CartDTO cartDTO, @RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		JSONObject jObject = new JSONObject(strjson);
		String user = jObject.getString("user");
		String product_id = jObject.getString("product_id");
		
		List<ProductcolorDTO> colorDTO = productService.getColorList(product_id);
		List<ProductsizeDTO> sizeDTO = productService.getSizeList(product_id);
		result.put("colorlist", colorDTO);
		result.put("sizelist", sizeDTO);
		
		return result;
	}
	
	@PostMapping(value = "/cart/update/{product_id}")
	public RedirectView cart_update_option(@PathVariable("product_id") String product_id, @ModelAttribute CartDTO cartDTO, @RequestParam(value="color") String color, @RequestParam(value="size") String size, HttpServletRequest request, HttpSession session) throws Exception {

		String sizelabel = size;
		
		cartDTO.setUserId((String) session.getAttribute("id"));
		cartDTO.setProductId(product_id);
		cartDTO.setColor(color);
		cartDTO.setSizeLabel(sizelabel);

		try {
			cartService.updateCart(cartDTO);
			return new RedirectView("/app/cart");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping(value = "/cart/update/q", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String cart_update_quantity(@ModelAttribute CartDTO cartDTO, @RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {
		
		JSONObject jObject = new JSONObject(strjson);
		String user = jObject.getString("user");
		String product_id = jObject.getString("product_id");
		String quantity = jObject.getString("quantity");
		
		cartDTO.setUserId((String) session.getAttribute("id"));
		cartDTO.setProductId(product_id);
		cartDTO.setQuantity(Integer.parseInt(quantity));
		
		try {
			cartService.updateQuantity(cartDTO);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@PostMapping(value = "/cart/delete", produces = "application/json; charset=UTF-8")
	public RedirectView cart_delete(@ModelAttribute CartDTO cartDTO, @RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {

		JSONObject jObject = new JSONObject(strjson);
		String user = jObject.getString("user");
		String product_id = jObject.getString("product_id");

		cartDTO.setUserId(user);
		cartDTO.setProductId(product_id);

		try {
			cartService.deleteCart(cartDTO);
			return new RedirectView("/app/cart");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/*
	@PostMapping(value = "/classdetail/{no}/insert", produces = "application/json; charset=UTF-8")
	public @ResponseBody String comment_insert(@PathVariable("no") long no, @RequestBody String strjson,
			HttpServletRequest request, HttpSession session) throws Exception {

		JSONObject jObject = new JSONObject(strjson);
		String content = jObject.getString("content_textVal");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ID", session.getAttribute("id"));
		List<LectureDTO> data = memberService.checkMemberLecture(map);
		if (data.size() == 0) {
			return "False";
		}
		CommentDTO comments = new CommentDTO();
		comments.setContent(content);
		comments.setLecture_id(no);
		comments.setMember_id((String) session.getAttribute("id"));
		comments.setName((String) session.getAttribute("name"));
		comments.setRegdate(DateFormatClass.strDateNow());
		try {
			for (LectureDTO dto : data) {
				long lecture_id = dto.getId();
				if (lecture_id == no) { 
					commentService.insertComment(comments);
					return "Success";
				}
			}
			return "False";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
*/

	
}
