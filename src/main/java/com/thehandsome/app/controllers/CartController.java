package com.thehandsome.app.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.app.dto.CartDTO;
import com.thehandsome.app.dto.DepartmentDTO;
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
	
	@PostMapping(value = "/cart/update/q", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String comment_update(@ModelAttribute CartDTO cartDTO, @RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {
		
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
	
	/*
	//AJAX
	@PostMapping(value = "/cart/list", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> cart_list(HttpSession session, @ModelAttribute("cart") CartDTO cartDTO, @ModelAttribute("product") ProductDTO productDTO) throws Exception {
		//session임의
		session.setAttribute("id", "ming");
		String userId = (String) session.getAttribute("id");
		Map<String, Object> result = new HashMap<>();
		List<CartDTO> cartlist = cartService.getCartList(userId);
		List<ProductDTO> productlist = new LinkedList<>();
		for(int i=0; i<cartlist.size(); i++) {
			productlist.add(productService.getProductInfo(cartlist.get(i).getProductId()));
		}
		
		@RequestBody String strjson
		
		JSONObject jObject = new JSONObject(strjson);
		int delete = jObject.getInt("delete_num");
		

		if (cartlist.isEmpty())
			result.put("cartlist", "none");
		else {
			for(String key : result.keySet()){
	            Object value = result.get(key);
	            System.out.println(key+" : "+value);
	        }
			result.put("cartlist", cartlist);
			result.put("productlist", productlist);
		}
		return result;
	}
	
	*/
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

	@PostMapping(value = "/classdetail/{no}/update", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String comment_update(@ModelAttribute CommentDTO commentDTO, @PathVariable("no") long no,
			@RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {

		JSONObject jObject = new JSONObject(strjson);
		String cno = jObject.getString("cno");
		String comment_user = jObject.getString("comment_user");
		String login_user = (String) session.getAttribute("name");
		String content_fix = jObject.getString("content_fix");

		commentDTO.setNo(Long.parseLong(cno));
		commentDTO.setMember_id((String) session.getAttribute("id"));
		commentDTO.setLecture_id(no);
		commentDTO.setContent(content_fix);

		try {
			if (login_user.equals(comment_user) == true) {
				commentService.updateComment(commentDTO);
				return "Success";
			} else
				return "False"; 
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@PostMapping(value = "/classdetail/{no}/delete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String comment_delete(@ModelAttribute CommentDTO commentDTO, @PathVariable("no") long no,
			@RequestBody String strjson, HttpServletRequest request, HttpSession session) throws Exception {

		JSONObject jObject = new JSONObject(strjson);
		String content_no = jObject.getString("cno");
		String content_name = jObject.getString("user_check");
		String me = (String) session.getAttribute("name");

		commentDTO.setNo(Long.parseLong(content_no));
		commentDTO.setMember_id((String) session.getAttribute("id"));

		try {
			if (me.equals(content_name) == true) {
				commentService.deleteComment(commentDTO);
				return "Success";
			} else
				return "False";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	*/
}
