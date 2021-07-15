package com.thehandsome.app.controllers;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.app.dto.BranchDTO;
import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.Buying_HistoryDTO;
import com.thehandsome.app.dto.CartDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.Import_And_ExportDTO;
import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.dto.StockDTO;
import com.thehandsome.app.service.BranchService;
import com.thehandsome.app.service.BrandService;
import com.thehandsome.app.service.Buying_HistoryService;
import com.thehandsome.app.service.CartService;
import com.thehandsome.app.service.DepartmentService;
import com.thehandsome.app.service.Import_And_ExportService;
import com.thehandsome.app.service.MemberService;
import com.thehandsome.app.service.StockService;
import com.thehandsome.app.utils.DateFormatClass;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/")
public class OrderController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private StockService stockService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private Buying_HistoryService buying_HistoryService;
	
	@Autowired
	private Import_And_ExportService import_And_ExportService;
	
	private static Logger logger = LoggerFactory.getLogger(CartController.class);
	
	private static List<CartDTO> check_cart = new LinkedList<CartDTO>();
	
	
	@GetMapping("/checkout")
	@Transactional
	public ModelAndView checkout(HttpSession session) {
		ModelAndView mav = new ModelAndView("Checkout");

		try {
			String userId = (String) session.getAttribute("id");
			MemberDTO memberDTO = memberService.getMember(userId);
			List<CartDTO> cartDTO = cartService.getCartList(userId);
			List<DepartmentDTO> departmentDTO = departmentService.getDepartmentList();
			
			mav.addObject("memberDTO", memberDTO);
			mav.addObject("cartDTO", cartDTO);
			mav.addObject("departmentDTO", departmentDTO);
			mav.addObject("url", "/app/checkout");
			mav.setViewName("Checkout");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	
	@GetMapping("/checkout/{check}")
	@Transactional
	public ModelAndView checkout_checked(@PathVariable String check, HttpSession session) {
		ModelAndView mav = new ModelAndView("Checkout");

		try {
			String userId = (String) session.getAttribute("id");
			MemberDTO memberDTO = memberService.getMember(userId);
			List<CartDTO> cartDTO = cartService.getCartList(userId);
			List<DepartmentDTO> departmentDTO = departmentService.getDepartmentList();
			if(check == null) {
				mav.addObject("memberDTO", memberDTO);
				mav.addObject("cartDTO", cartDTO);
				mav.addObject("departmentDTO", departmentDTO);
				mav.addObject("url", "/app/checkout");
				mav.setViewName("Checkout");
			}
			else {
				mav.addObject("memberDTO", memberDTO);
				mav.addObject("cartDTO", check_cart);
				mav.addObject("departmentDTO", departmentDTO);
				mav.addObject("url", "/app/checkout");
				mav.setViewName("Checkout");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	@PostMapping(value = "/checkout", produces = "application/json; charset=UTF-8")
	@Transactional
	public String checkout_post(@RequestBody String strjson, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("Checkout");

		try {
			String userId = (String) session.getAttribute("id");
			List<CartDTO> cartDTO = cartService.getCartList(userId);
			
			JSONObject jObject = new JSONObject(strjson);
			String str = jObject.get("product").toString();
			
			for(int i=0; i<cartDTO.size(); i++) {
				if(str.contains(cartDTO.get(i).getProduct_id())) {
				}
				else cartDTO.remove(i);
			}
			
			check_cart = cartDTO;
			
			return "Success";
			
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
			return "Error";
		}
	}
	
	@GetMapping("/order")
	@Transactional
	public ModelAndView order(HttpSession session) {
		ModelAndView mav = new ModelAndView("Order");
		String now = DateFormatClass.strDateNow();
		try {
			mav.addObject("url", "/app/order");
			mav.addObject("order_date", now);
			mav.setViewName("Order");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("msg", e.getMessage());
			mav.addObject("url", "../");
		}
		return mav;
	}
	
	@PostMapping(value = "/order", produces = "application/json; charset=UTF-8")
	@Transactional
	public String order_action(@RequestBody String strjson, HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("id");
		String now = DateFormatClass.strDateNow();

		JSONObject jObject = new JSONObject(strjson);
		String str = jObject.get("product").toString();
		String rec_method = jObject.getString("method");
		int department = jObject.getInt("department");
		
		System.out.println(jObject);
		
		try {
			List<CartDTO> cartDTO = cartService.getCartList(userId);
			List<BrandDTO> brandDTO = brandService.getBrandList();
			for(int i=0; i<cartDTO.size(); i++) {
				if(str.contains(cartDTO.get(i).getProduct_id())) {
					Buying_HistoryDTO buying_HistoryDTO = new Buying_HistoryDTO();
					StockDTO stockDTO = new StockDTO();
					if(rec_method.equals("pickup")) {
						// 지점에서 픽업 시
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("product_id", cartDTO.get(i).getProduct_id());
						map.put("department_id", department);
						stockDTO = stockService.getStockInfo(map);
						System.out.println("stock"+stockDTO + "" +  cartDTO.get(i).getQuantity());
						buying_HistoryDTO.setDepartment_id(department);
						if(stockDTO.getQuantity() >= cartDTO.get(i).getQuantity()) {
							buying_HistoryDTO.setStock(1);
						}
						else
							buying_HistoryDTO.setStock(0);
					}
					else {
						// 배송 요청 시
						buying_HistoryDTO.setDepartment_id(17);
						buying_HistoryDTO.setStock(1);
					}
						buying_HistoryDTO.setMember_id(userId);
						buying_HistoryDTO.setProduct_id(cartDTO.get(i).getProduct_id());
						
						for(int j=0; j<brandDTO.size(); j++) {
							if(brandDTO.get(j).getName().equals(cartDTO.get(i).getBrand_name())) {
								buying_HistoryDTO.setBrand_id(brandDTO.get(j).getId());
								break;
							}
						}
					buying_HistoryDTO.setPurchase_date(now);
					buying_HistoryDTO.setQuantity(cartDTO.get(i).getQuantity());
					buying_HistoryDTO.setSizelabel(cartDTO.get(i).getSizelabel());
					buying_HistoryDTO.setColor(cartDTO.get(i).getColor());
					buying_HistoryDTO.setRec_method(rec_method);
					buying_HistoryDTO.setComplete(0);
					System.out.println("Insert 구매내역" + buying_HistoryDTO);
					
					buying_HistoryService.insertBuying_History(buying_HistoryDTO);
					cartService.deleteCart(cartDTO.get(i));
					
				}
				else cartDTO.remove(i);
			}
			
			List<BranchDTO> branchDTO = branchService.getBranchList();
			List<Buying_HistoryDTO> buyinglist = buying_HistoryService.getBuying_HistoryList(userId);
			for(int i=0; i<buyinglist.size(); i++) {
				for(int k=0; k<cartDTO.size(); k++) {
				if(buyinglist.get(i).getStock() == 0 && buyinglist.get(i).getProduct_id().equals(cartDTO.get(k).getProduct_id())) {
					Import_And_ExportDTO import_And_ExportDTO = new Import_And_ExportDTO();
					import_And_ExportDTO.setBuying_history_id(buyinglist.get(i).getId());
					for(int j=0; j<branchDTO.size(); j++) {
						if(branchDTO.get(j).getBrand_id() == buyinglist.get(i).getBrand_id() && branchDTO.get(j).getDepartment_id() == department) {
							import_And_ExportDTO.setDeparture(branchDTO.get(j).getId());
						}
					}
					import_And_ExportDTO.setDestination(0);
					import_And_ExportDTO.setState("발송요청");
					import_And_ExportService.insertImport_And_Export(import_And_ExportDTO);
				}
				}
			}
			
			return "Success";
		} catch (Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
}
