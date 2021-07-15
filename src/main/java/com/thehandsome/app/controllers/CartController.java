package com.thehandsome.app.controllers;

import java.util.HashMap;
import java.util.LinkedList;
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
import com.thehandsome.app.dto.ProductColorDTO;
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
			
			if(session.getAttribute("id") != null) {
				isUser = true;
			}
				String userId = (String) session.getAttribute("id");
				List<CartDTO> cartDTO = cartService.getCartList(userId);
				total_cart(session);
			
			mav.addObject("isUser", isUser);
			mav.addObject("cartDTO", cartDTO);
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
		String product_id = jObject.getString("product_id");
		
		List<ProductColorDTO> colorDTO = productService.getColorList(product_id);
		List<ProductsizeDTO> sizeDTO = productService.getSizeList(product_id);
		result.put("colorlist", colorDTO);
		result.put("sizelist", sizeDTO);
		
		return result;
	}
	
	@PostMapping(value = "/cart/update/{product_id}")
	public RedirectView cart_update_option(@PathVariable("product_id") String product_id, @ModelAttribute CartDTO cartDTO, @RequestParam(value="color") String color, @RequestParam(value="size") String size, HttpServletRequest request, HttpSession session) throws Exception {

		String sizelabel = size;
		
		cartDTO.setUser_id((String) session.getAttribute("id"));
		cartDTO.setProduct_id(product_id);
		cartDTO.setColor(color);
		cartDTO.setSizelabel(sizelabel);

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
		
		cartDTO.setUser_id((String) session.getAttribute("id"));
		cartDTO.setProduct_id(product_id);
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

		cartDTO.setUser_id(user);
		cartDTO.setProduct_id(product_id);

		try {
			cartService.deleteCart(cartDTO);
			return new RedirectView("/app/cart");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@GetMapping(value = "/cart/insert/{pid}/{color}/{size}")
	@ResponseBody
	public String cart_insert(@PathVariable("pid") String pid, @PathVariable("color") String color,  @PathVariable("size") String size,
			 HttpServletRequest request, HttpSession session) throws Exception {

		String userId = (String) session.getAttribute("id");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUser_id(userId);
		cartDTO.setProduct_id(pid);
		cartDTO.setQuantity(1);
		cartDTO.setColor(color);
		cartDTO.setSizelabel(size);
		
		total_cart(session);
		
		try {
			cartService.insertCart(cartDTO);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	@GetMapping(value = "/cart/insert/{pid}/{color}/{size}/{quantity}")
	@ResponseBody
	public String cart_insert_q(@PathVariable("pid") String pid, @PathVariable("color") String color,  @PathVariable("size") String size,
			@PathVariable("quantity") int quantity, HttpServletRequest request, HttpSession session) throws Exception {

		String userId = (String) session.getAttribute("id");
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUser_id(userId);
		cartDTO.setProduct_id(pid);
		cartDTO.setQuantity(quantity);
		cartDTO.setColor(color);
		cartDTO.setSizelabel(size);
		total_cart(session);
		
		try {
			cartService.insertCart(cartDTO);
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
}
