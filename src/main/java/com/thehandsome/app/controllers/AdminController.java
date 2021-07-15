package com.thehandsome.app.controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.thehandsome.app.dto.AdminDTO;
import com.thehandsome.app.dto.BranchDTO;
import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.Buying_HistoryDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.Import_And_ExportDTO;
import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductColorDTO;
import com.thehandsome.app.dto.StockDTO;
import com.thehandsome.app.service.AdminService;
import com.thehandsome.app.service.BranchService;
import com.thehandsome.app.service.BrandService;
import com.thehandsome.app.service.Buying_HistoryService;
import com.thehandsome.app.service.DepartmentService;
import com.thehandsome.app.service.Import_And_ExportService;
import com.thehandsome.app.service.MemberService;
import com.thehandsome.app.service.ProductColorService;
import com.thehandsome.app.service.ProductService;
import com.thehandsome.app.service.StockService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private Buying_HistoryService buying_historyService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductColorService productColorService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Import_And_ExportService import_And_ExportService;
	@Autowired
	private BranchService branchService;
	@Autowired
	private StockService stockService;
	@Autowired
	private ProductService productSerivce;
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping(value="adminSignin")
	public String signinview(Model model, HttpSession session) {
		session.removeAttribute("adminID");
		return "adminSignin";
	}
	
	@PostMapping(value="adminSigninAction")
	public ModelAndView signinAction(@ModelAttribute("adminDTO") AdminDTO adminDTO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			AdminDTO admin = adminService.signin(adminDTO);
			if (admin == null) {
				System.out.println("Login Failed!");
				return new ModelAndView("adminSignin");
			}
			
			session.setAttribute("adminID", admin.getId());
			session.setAttribute("password", admin.getPassword());
			mav.addObject("adminID", admin.getId());
			mav.addObject("password", admin.getPassword());
			mav.setViewName("admin");
			System.out.println("Login Successed!");
			return mav;
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("adminSignin");
		} 
	}
	
	@GetMapping(value = "admin")
	public ModelAndView admin(HttpSession session) throws Exception {
		String adminID = (String)session.getAttribute("adminID");
		if (adminID == null) {
			System.out.println("Admin Session Expired!");
			return new ModelAndView("adminSignin");
		} else {
			return new ModelAndView("admin");
		}
	}
	
	@GetMapping(value = "admin/{product_id}")
	public ModelAndView adminRequest(@PathVariable(value="product_id") String product_id) throws Exception {
		return new ModelAndView("adminRequest");
	}
	
	@GetMapping(value = "admin/product")
	public ModelAndView product() throws Exception {
		return new ModelAndView("product");
	}
	
	@GetMapping(value = "admin/support")
	public ModelAndView support(HttpServletRequest request, HttpSession session) throws Exception {
		return new ModelAndView("support");
	}
	
	@GetMapping(value = "admin/analytics")
	public ModelAndView analytics() throws Exception {
		return new ModelAndView("analytics");
	}
	
	@GetMapping(value = "getDepartmentInfo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public DepartmentDTO getDepartmentInfo(HttpServletRequest request, HttpSession session) throws Exception {
		DepartmentDTO department;
		String adminID = request.getParameter("adminID");
		String password = request.getParameter("password");
		System.out.println("adminID : " + adminID);
		System.out.println("password : " + password);
		
		department = departmentService.getDepartmentInfo(adminID, password);
		System.out.println("Department : " + department.getName());

		return department;
	}
	
	@GetMapping(value = "getBrandInfo", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public BrandDTO getBrandInfo(HttpServletRequest request, HttpSession session) throws Exception {
		BrandDTO brand;
		String adminID = request.getParameter("adminID");
		String password = request.getParameter("password");
		
		brand = brandService.getBrandInfo(adminID, password);
		System.out.println("Brand : " + brand.getName());

		return brand;
	}
	
	@GetMapping(value = "getProductList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public List<Object> getProductList(HttpServletRequest request, HttpSession session) throws Exception {
		String department = request.getParameter("department");
		String brand = request.getParameter("brand");
		String order = request.getParameter("order");
		
		System.out.println("order : " + order);
		
		// JsonObject
		List<Object> jsonSendor = new ArrayList<Object>();
		
		// department와 brand로 현재 Branch를 조회
		BranchDTO branch;
		branch = branchService.getBranch(department, brand);
		System.out.println("Branch : " + branch.getId());
		
		// 출발지나 도착지 중 한 곳에 현재 Branch가 있다면, BuyingHistoryId를 조회
		List<Import_And_ExportDTO> import_And_ExportList = new ArrayList<Import_And_ExportDTO>();
		if (order == null) {
			import_And_ExportList = import_And_ExportService.getStateList(branch.getId());
		} else {
			import_And_ExportList = import_And_ExportService.getStateWithOrder(branch.getId(), order);
		}
		
		for (int i = 0; i < import_And_ExportList.size(); i++) {
			System.out.println("BuyingHistory : " + import_And_ExportList.get(i).getBuying_history_id());
		}
		
		// 조회한 BuyingHistoryId로 BuyingHistory를 조회
		List<Buying_HistoryDTO> buying_historyList = new ArrayList<Buying_HistoryDTO>();
		for (int i = 0; i < import_And_ExportList.size(); i++) {
			Buying_HistoryDTO buying_history;
			buying_history = buying_historyService.getProduct(import_And_ExportList.get(i).getBuying_history_id());
			buying_historyList.add(buying_history);
		}
		
		// Find near location
		for (int i = 0; i < import_And_ExportList.size(); i++) {
			if (import_And_ExportList.get(i).getDestination() == 0) {
				BranchDTO nowBranch = branchService.getBranchDTO(Integer.toString(import_And_ExportList.get(i).getDeparture()));
				List<DepartmentDTO> departmentList = new ArrayList<DepartmentDTO>();
				departmentList = departmentService.getDepartmentList();
				int nowIdx = nowBranch.getDepartment_id();
				int nowBrand = nowBranch.getBrand_id();
				double nowLocation = departmentList.get(nowIdx - 1).getLatitude() * departmentList.get(nowIdx - 1).getLongitude() / 2;
				
//				System.out.println("nowIdx : " + nowIdx);
//				System.out.println("nowLocation : " + nowLocation);
				
				
				Map<Double, Integer> locationList = new HashMap<Double, Integer>();
				
				for (int j = 0; j < departmentList.size(); j++) {
					double location = departmentList.get(j).getLatitude() * departmentList.get(j).getLongitude() / 2;
					if (location >= nowLocation) {
						locationList.put(location - nowLocation, j + 1);
					} else {
						locationList.put(nowLocation - location, j + 1);
					}
				}
				
				List<Double> keySet = new ArrayList<Double>(locationList.keySet());
				
				System.out.println("==Key 값 기준으로 오름차순 정렬==");
		        List<Double> keys = new ArrayList<>(locationList.keySet());
		        Collections.sort(keys);
		        for (Double key : keys) {
		            System.out.println(String.format("Key : %s, Value : %s", key, locationList.get(key)));
		            System.out.println(locationList.get(key) + ", " + nowBrand + ", " + buying_historyList.get(i).getSizelabel() + ", " + buying_historyList.get(i).getColor() + ", " + buying_historyList.get(i).getQuantity());
		            if (key != 0.0) {
		            	StockDTO stockDTO = stockService.getStock(locationList.get(key), 
		            											  nowBrand, 
		            											  buying_historyList.get(i).getSizelabel(), 
		            											  buying_historyList.get(i).getColor(),
		            											  buying_historyList.get(i).getQuantity());
		            	if (stockDTO != null) {
		            		System.out.println("!해당 지점에 재고 있음!");
		            		BranchDTO getBranch = branchService.getBranch(Integer.toString(locationList.get(key)), Integer.toString(nowBrand));
		            		import_And_ExportService.updateDest(import_And_ExportList.get(i).getBuying_history_id(), getBranch.getId());
		            		break;
		            	}
		            }
		        }
			}
		}
		
		// sex, mainCategory, subCategory, 상품명
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		
		// imagePath
		List<ProductColorDTO> productColorList = new ArrayList<ProductColorDTO>();
		
		// 고객이름
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		for (int i = 0; i < buying_historyList.size(); i++) {
			ProductDTO product = productService.getProductInfo(buying_historyList.get(i).getProduct_id());
			productList.add(product);
			
			ProductColorDTO productColor = productColorService.getProductColor(buying_historyList.get(i).getProduct_id(), buying_historyList.get(i).getColor());
			productColorList.add(productColor);
			
			MemberDTO member = memberService.getMember(buying_historyList.get(i).getMember_id());
			memberList.add(member);
		}
		
		String[] branchStateList = new String[buying_historyList.size()];
		String[] targetList = new String[buying_historyList.size()];
		for (int i = 0; i < buying_historyList.size(); i++) {
			BranchDTO tempBranch;
			DepartmentDTO tempDepartment;
			BrandDTO tempBrand;
			
			if (import_And_ExportList.get(i).getState().equals("발송요청")) {
				branchStateList[i] = "발송요청";
				targetList[i] = memberList.get(i).getName();
			} else if (import_And_ExportList.get(i).getState().equals("입고요청")) {
				BranchDTO branchId = branchService.getBranch(department, brand);
				if (import_And_ExportList.get(i).getDestination() == branchId.getId()) {
					tempBranch = branchService.getBranchDTO(Integer.toString(import_And_ExportList.get(i).getDestination()));
					tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
					tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
					branchStateList[i] = "출고요청";
					targetList[i] = tempDepartment.getName() + " " + tempBrand.getName();
				} else {
					tempBranch = branchService.getBranchDTO(Integer.toString(import_And_ExportList.get(i).getDeparture()));
					tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
					tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
					branchStateList[i] = "입고요청";
					targetList[i] = memberList.get(i).getName();
				}
			} else if (import_And_ExportList.get(i).getState().equals("입고완료")) {
				BranchDTO branchId = branchService.getBranch(department, brand);
				if (import_And_ExportList.get(i).getDestination() == branchId.getId()) {
					tempBranch = branchService.getBranchDTO(Integer.toString(import_And_ExportList.get(i).getDestination()));
					tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
					tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
					branchStateList[i] = "출고완료";
					targetList[i] = tempDepartment.getName() + " " + tempBrand.getName();
				} else {
					tempBranch = branchService.getBranchDTO(Integer.toString(import_And_ExportList.get(i).getDeparture()));
					tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
					tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
					branchStateList[i] = "입고완료";
					targetList[i] = memberList.get(i).getName();
				}
			}
		}
		
		for (int i = 0; i < buying_historyList.size(); i++) {
			Map<String, String> json = new HashMap<String, String>();
			json.put("product_id", Integer.toString(buying_historyList.get(i).getId()));
			json.put("color", productColorList.get(i).getColor());
			json.put("size", buying_historyList.get(i).getSizelabel());
			json.put("sex", productList.get(i).getSex());
			json.put("mainCategory", Integer.toString(productList.get(i).getMaincategory_id()));
			json.put("subCategory", Integer.toString(productList.get(i).getSubcategory_id()));
			json.put("imagePath", productColorList.get(i).getImagePath());
			json.put("title", productList.get(i).getTitle());
			json.put("purchaseDate", buying_historyList.get(i).getPurchase_date());
			json.put("name", targetList[i]);
			json.put("state", branchStateList[i]);
			
			jsonSendor.add(json);
		}
		
		for (int i = 0; i < jsonSendor.size(); i++) {
			System.out.println(jsonSendor.get(i));
		}
		
		return jsonSendor;
	}
	
	@GetMapping(value = "getProduct", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public List<Object> getProduct(HttpServletRequest request, HttpSession session) throws Exception {
		String product_id = request.getParameter("product_id");
		String department = request.getParameter("department");
		String brand = request.getParameter("brand");
		
		System.out.println("product_id : " + product_id);
		System.out.println("department : " + department);
		System.out.println("brand : " + brand);
		
		// JsonObject
		List<Object> jsonSendor = new ArrayList<Object>();
		
		// BuyingHistoryId로 BuyingHistory를 조회
		Buying_HistoryDTO buying_history;
		buying_history = buying_historyService.getProduct(Integer.parseInt(product_id));

		// sex, mainCategory, subCategory, 상품명
		ProductDTO product = productService.getProductInfo(buying_history.getProduct_id());
		
		// imagePath
		ProductColorDTO productColor = productColorService.getProductColor(buying_history.getProduct_id(), buying_history.getColor());
		
		// 고객이름
		MemberDTO member = memberService.getMember(buying_history.getMember_id());
		
		Import_And_ExportDTO import_And_Export = import_And_ExportService.getState(Integer.parseInt(product_id));

		String branchState = "";
		String target = "";
		BranchDTO tempBranch;
		DepartmentDTO tempDepartment;
		BrandDTO tempBrand;
		
		if (import_And_Export.getState().equals("발송요청")) {
			branchState = "발송요청";
			target = member.getName() + " 고객님";
		} else if (import_And_Export.getState().equals("입고요청")) {
			BranchDTO branchId = branchService.getBranch(department, brand);
			System.out.println("branchID : " + branchId.getId());
			if (import_And_Export.getDestination() == branchId.getId()) {
				tempBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDestination()));
				tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
				tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
				branchState = "출고요청";
				target = tempDepartment.getName() + " " + tempBrand.getName();
				} else {
				tempBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDeparture()));
				tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
				tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
				branchState = "입고요청";
				target = tempDepartment.getName() + " " + tempBrand.getName();
				}
			} else if (import_And_Export.getState().equals("입고완료")) {
				BranchDTO branchId = branchService.getBranch(department, brand);
			System.out.println("branchID : " + branchId.getId());
			if (import_And_Export.getDestination() == branchId.getId()) {
				tempBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDestination()));
				tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
				tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
				branchState = "출고완료";
				target = tempDepartment.getName() + " " + tempBrand.getName();
			} else {
				tempBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDeparture()));
				tempDepartment = departmentService.getDepartmentName(Integer.toString(tempBranch.getDepartment_id()));
				tempBrand = brandService.getBrandName(Integer.toString(tempBranch.getBrand_id()));
				branchState = "입고완료";
				target = tempDepartment.getName() + " " + tempBrand.getName();
			}
		}

		BranchDTO departureBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDeparture()));
		BranchDTO destinationBranch = branchService.getBranchDTO(Integer.toString(import_And_Export.getDestination()));
		DepartmentDTO departureDepartment, destinationDepartment;
		departureDepartment = departmentService.getDepartmentName(Integer.toString(departureBranch.getDepartment_id()));
		destinationDepartment = departmentService.getDepartmentName(Integer.toString(destinationBranch.getDepartment_id()));

		Map<String, String> json = new HashMap<String, String>();
		json.put("product_id", Integer.toString(buying_history.getId()));
		json.put("color", productColor.getColor());
		json.put("size", buying_history.getSizelabel());
		json.put("sex", product.getSex());
		json.put("mainCategory", Integer.toString(product.getMaincategory_id()));
		json.put("subCategory", Integer.toString(product.getSubcategory_id()));
		json.put("imagePath", productColor.getImagePath());
		json.put("title", product.getTitle());
		json.put("purchaseDate", buying_history.getPurchase_date());
		json.put("name", target);
		json.put("state", branchState);
		json.put("departure", departureDepartment.getName());
		json.put("destination", destinationDepartment.getName());
		
		jsonSendor.add(json);
		
		for (int i = 0; i < jsonSendor.size(); i++) {
			System.out.println(jsonSendor.get(i));
		}
		
		return jsonSendor;
	}
	
	@GetMapping(value = "handleRequest", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public ModelAndView handleRequest(HttpServletRequest request, HttpSession session) throws Exception {
		String product_id = request.getParameter("product_id");
		String order = request.getParameter("order");
		Buying_HistoryDTO buying_HistoryDTO = buying_historyService.getProduct(Integer.parseInt(product_id));
		Import_And_ExportDTO import_And_ExportDTO = import_And_ExportService.getInfo(buying_HistoryDTO.getId());
		
		if (order.equals("발송요청")) {
			order = "입고요청";
			import_And_ExportService.updateStockState(Integer.parseInt(product_id), order);
		} else if (order.equals("출고요청")) {
			order = "입고완료";
			import_And_ExportService.updateStockState(Integer.parseInt(product_id), order);
			
			stockService.minusStock(import_And_ExportDTO.getDestination(),
									buying_HistoryDTO.getProduct_id(),
									buying_HistoryDTO.getSizelabel(), 
									buying_HistoryDTO.getColor(), 
									buying_HistoryDTO.getQuantity());
			stockService.plusStock(import_And_ExportDTO.getDeparture(), 
								   buying_HistoryDTO.getProduct_id(),
								   buying_HistoryDTO.getSizelabel(),
								   buying_HistoryDTO.getColor(), 
								   buying_HistoryDTO.getQuantity(),
								   buying_HistoryDTO.getId());
			buying_historyService.updateStock(Integer.parseInt(product_id));
		}

		return new ModelAndView("admin");
	}
	
	@PostMapping(value = "mail")
	public RedirectView mail(HttpServletRequest request, HttpSession session) throws Exception {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = "전화번호 : " + request.getParameter("phone");
		String comment = "본문 : " + request.getParameter("comment");
		String text = phone + "\n" + comment;
		
		String from = email;
		String to = "bandits0726@gmail.com";
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");
			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(name);
			mailHelper.setText(text);
			
			mailSender.send(mail);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return new RedirectView("admin/support");
	}
	
	@GetMapping(value = "miniAnalytics", produces = "application/json; charset=UTF-8")
	@ResponseBody
	@Transactional
	public Map<String, String> miniAnalytics(HttpServletRequest request, HttpSession session) throws Exception {
		Map<String, String> list = new HashMap<String, String>();
		ProductDTO productDTO = productSerivce.getFirstProduct();
		List<ProductDTO> productDTOList = productService.getTotalPrice();
		List<MemberDTO> memberDTOList = memberService.getBuyingMemberList();
		
		if (productDTO == null || productDTOList == null || memberDTOList == null) {
			return list;
		}
		
		String title = productDTO.getTitle();
		String count = Integer.toString(productDTOList.size());
		int totalPrice = 0;
		int age = 0;
		
		for (int i = 0; i < productDTOList.size(); i++) {
			totalPrice += productDTOList.get(i).getPrice();
		}
		
		for (int i = 0; i < memberDTOList.size(); i++) {
			age += memberDTOList.get(i).getAge();
		}
		age /= memberDTOList.size();
		
		System.out.println("Title : " + title);
		System.out.println("Count : " + count);
		System.out.println("Total Price : " + totalPrice);
		System.out.println("Average Age : " + age);
		
		list.put("title", title);
		list.put("count", count);
		list.put("price", Integer.toString(totalPrice));
		list.put("age", Integer.toString(age));
		
		return list;
	}
}
