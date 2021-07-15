package com.thehandsome.app.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thehandsome.app.HomeController;
import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.dto.ProductColorDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductsizeDTO;
import com.thehandsome.app.dto.ReviewDTO;
import com.thehandsome.app.dto.SubColorDTO;
import com.thehandsome.app.dto.UserActivityDTO;
import com.thehandsome.app.service.BrandService;
import com.thehandsome.app.service.ProductService;
import com.thehandsome.app.service.RecommendService;
import com.thehandsome.app.utils.RecommendProduct;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private RecommendService recommendService;

	@Autowired
	private BrandService brandService;

	RecommendProduct rp = new RecommendProduct();

	@GetMapping("product/{product_id}")
	public String productDetail(@PathVariable String product_id, Model model) throws Exception {

		ProductDTO item = recommendService.getProductDetail(product_id);
		model.addAttribute("item", item);
		return "product/single-product";
	}

	@PostMapping("productdetail/insertUserActivity/{product_id}")
	@ResponseBody
	public void insertUserActivity(@PathVariable String product_id, @ModelAttribute UserActivityDTO userActivityDTO,
			HttpSession session) throws Exception {

		boolean isFirst = false;

		int rating, click_num, stay_time, is_like;
		int max_rating, max_click_num, max_stay_time, max_is_like;
		long res;

		UserActivityDTO getData = null;

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberInfo");

		if (memberDTO == null)
			return;

		userActivityDTO.setMember_id(memberDTO.getId());

		userActivityDTO.setProduct_id(product_id);

		logger.info(userActivityDTO.toString());

		/*
		 * 해당 유저의 해당 상품에 대한 행동 데이터가 이미 있는지 조회
		 */
		long cnt = 0;
		cnt = recommendService.checkUserActivity(userActivityDTO);

		/*
		 * 데이터가 존재하지 않다면 새로 삽입한다.
		 */
		if (cnt == 0) {

			isFirst = true;

			// 만약 평점을 새로 넣는다면
			if (userActivityDTO.getRating() == -1) {
				rating = 0;
				userActivityDTO.setRating(rating);
			} else {
				rating = userActivityDTO.getRating();
			}

			// 만약 찜하기를 새로 넣는다면
			if (userActivityDTO.getIs_like() == -1) {
				is_like = 0;
				userActivityDTO.setIs_like(is_like);
			} else {
				is_like = userActivityDTO.getIs_like();
			}

			click_num = 1;
			userActivityDTO.setClick_num(click_num);

			stay_time = userActivityDTO.getStay_time();

		} else {

			// 해당 행동 데이터가 이미 있다면 가져온다.
			getData = recommendService.getUserActivity(userActivityDTO);

			if (userActivityDTO.getRating() == -1) {
				rating = getData.getRating();
				userActivityDTO.setRating(rating);
			} else
				rating = userActivityDTO.getRating();

			click_num = getData.getClick_num() + 1;
			userActivityDTO.setClick_num(click_num);

			if (userActivityDTO.getStay_time() <= getData.getStay_time()) {
				stay_time = getData.getStay_time();
				userActivityDTO.setStay_time(stay_time);
			} else
				stay_time = userActivityDTO.getStay_time();

			if (getData.getIs_like() == 1) {
				is_like = 0;
				userActivityDTO.setIs_like(is_like);
			} else {
				is_like = 1;
				userActivityDTO.setIs_like(is_like);
			}
		}

		logger.info(userActivityDTO.toString());

		/*
		 * 선호도 계산 알고리즘 적용
		 */

		UserActivityDTO maxUserActivity = null;

		if (isFirst) {

			// 1. 정규화
			double Nrating = rp.Normalization(rating, 5);
			double Nclick_num = rp.Normalization(click_num, click_num);
			double Nstay_time = rp.Normalization(stay_time, stay_time);

			// 2. 행위 비율
			double Prating = rp.Percentage(Nrating, Nclick_num, Nstay_time);
			double Pclick_num = rp.Percentage(Nclick_num, Nrating, Nstay_time);
			double Pstay_time = rp.Percentage(Nstay_time, Nclick_num, Nrating);

			userActivityDTO.setP_rating(Prating);
			userActivityDTO.setP_click_num(Pclick_num);
			userActivityDTO.setP_stay_time(Pstay_time);

			// 3. 가중치 계산
			double Wrating = rp.Weight(Prating, 1);
			double Wclick_num = rp.Weight(Pclick_num, 1);
			double Wstay_time = rp.Weight(Pstay_time, 1);
			double Wis_like = rp.Weight(is_like, 1);

			// 4. 선호도 계산
			double preference = rp.Preference(rating, Wrating, click_num, Wclick_num, stay_time, Wstay_time, is_like,
					Wis_like);
			userActivityDTO.setPreference(preference);
			
		} else {
			maxUserActivity = recommendService.getMaxUserActivity(userActivityDTO.getMember_id());

			// 1. 정규화
			double Nrating = rp.Normalization(rating, 5);

			double Nclick_num = rp.Normalization(click_num, maxUserActivity.getClick_num());
			double Nstay_time = rp.Normalization(stay_time, maxUserActivity.getStay_time());

			// 2. 행위 비율
			double Prating = rp.Percentage(Nrating, Nclick_num, Nstay_time);
			double Pclick_num = rp.Percentage(Nclick_num, Nrating, Nstay_time);
			double Pstay_time = rp.Percentage(Nstay_time, Nclick_num, Nrating);

			userActivityDTO.setP_rating(Prating);
			userActivityDTO.setP_click_num(Pclick_num);
			userActivityDTO.setP_stay_time(Pstay_time);

			UserActivityDTO sumUserActivity = recommendService.getSumUserActivity(userActivityDTO.getMember_id());

			// 3. 가중치 계산
			double Wrating = rp.Weight(sumUserActivity.getP_rating(), sumUserActivity.getIs_like() + 1);
			double Wclick_num = rp.Weight(sumUserActivity.getP_click_num(), sumUserActivity.getIs_like() + 1);
			double Wstay_time = rp.Weight(sumUserActivity.getP_stay_time(), sumUserActivity.getIs_like() + 1);
			double Wis_like = rp.Weight(is_like, sumUserActivity.getIs_like() + 1);

			// 4. 선호도 계산
			double preference = rp.Preference(rating, Wrating, click_num, Wclick_num, stay_time, Wstay_time, is_like,
					Wis_like);
			userActivityDTO.setPreference(preference);
		}

		if (cnt == 0)
			res = recommendService.insertUserActivity(userActivityDTO);
		else
			res = recommendService.updateUserActivity(userActivityDTO);
	}

	@GetMapping("/brand/{brandName}")
	public String brandproduct(@PathVariable(required = false) String brandName, Model model) {
		try {
			int brandid = brandService.getBrandIdByName(brandName);
			System.out.println("brandname: " + brandName);
			List<ProductDTO> productlist = productService.getProductlistByBrand(brandid);
			model.addAttribute("productlist", productlist);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();
			for (ProductDTO product : productlist) {
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				productcolorlist.put(product.getId(), eachproductcolorlist);
			}
			model.addAttribute("productcolorlist", productcolorlist);

			model.addAttribute("brandname", brandName);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "productlist/brand";
	}

	@GetMapping("/category/{gender}")
	public String genderproduct(@PathVariable String gender, Model model) {
		try {
			String sex = gender;
			model.addAttribute("sex", sex);
			List<Integer> subcategorylist = productService.getSubcategoryByGender(gender);
			List<ProductDTO> productlist = new ArrayList<ProductDTO>();
			for (int subcategoryid : subcategorylist) {
				ProductDTO product = productService.getProductlistByGenderSubcategory(gender, subcategoryid);
				productlist.add(product);
			}
			model.addAttribute("productlist", productlist);
			System.out.println("productlist : " + productlist);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();
			for (ProductDTO product : productlist) {
				System.out.println("product : " + product);
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				productcolorlist.put(product.getId(), eachproductcolorlist);
			}
			model.addAttribute("productcolorlist", productcolorlist);

			System.out.println("productcolorlist : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);
			if (gender.equals("w")) {
				gender = "여성";
			} else {
				gender = "남성";
			}
			model.addAttribute("gender", gender);

			List<SubColorDTO> maincolorlist = productService.getAllMainColorlist();
			model.addAttribute("maincolorlist", maincolorlist);

			int total_product = productService.getCountProductByGender(sex);
			model.addAttribute("total_product", total_product);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "productlist/category";
	}

	@GetMapping("/category/{gender}/{maincategoryId}")
	public String maincategoryproduct(@PathVariable(required = false) String gender,
			@PathVariable(required = false) int maincategoryId, Model model) {
		try {
			String sex = gender;
			model.addAttribute("sex", sex);
			List<ProductDTO> productlist = productService.getProductlistByGenderMaincategory(gender, maincategoryId);

			model.addAttribute("productlist", productlist);
			System.out.println("productlist : " + productlist);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();
			for (ProductDTO product : productlist) {
				System.out.println("product : " + product);
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				productcolorlist.put(product.getId(), eachproductcolorlist);
			}
			model.addAttribute("productcolorlist", productcolorlist);

			System.out.println("productcolorlist : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);
			if (gender.equals("w")) {
				gender = "여성";
			} else {
				gender = "남성";
			}
			model.addAttribute("gender", gender);
			String maincategory = productService.getMaincategoryName(maincategoryId);
			model.addAttribute("maincategory", maincategory);

			List<SubColorDTO> maincolorlist = productService.getAllMainColorlist();
			model.addAttribute("maincolorlist", maincolorlist);

			int total_product = productService.getCountProductByGenderMaincategory(sex, maincategoryId);
			model.addAttribute("total_product", total_product);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "productlist/category";
	}

	@GetMapping("category/{gender}/{maincategoryId}/{subcategoryId}")
	public String subcategoryproduct(@PathVariable(required = false) String gender,
			@PathVariable(required = false) int maincategoryId, @PathVariable(required = false) int subcategoryId,
			Model model) {
		try {
			String sex = gender;
			model.addAttribute("sex", sex);
			List<ProductDTO> productlist = productService.getProductlistByGenderMainSubcategory(gender, maincategoryId,
					subcategoryId);

			model.addAttribute("productlist", productlist);
			System.out.println("productlist : " + productlist);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();
			for (ProductDTO product : productlist) {
				System.out.println("product : " + product);
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				productcolorlist.put(product.getId(), eachproductcolorlist);
			}
			model.addAttribute("productcolorlist", productcolorlist);

			System.out.println("productcolorlist : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);
			if (gender.equals("w")) {
				gender = "여성";
			} else {
				gender = "남성";
			}
			model.addAttribute("gender", gender);
			String maincategory = productService.getMaincategoryName(maincategoryId);
			model.addAttribute("maincategory", maincategory);

			String subcategory = productService.getSubcategoryName(subcategoryId);
			model.addAttribute("subcategory", subcategory);

			List<SubColorDTO> maincolorlist = productService.getAllMainColorlist();
			model.addAttribute("maincolorlist", maincolorlist);

			int total_product = productService.getCountProductByGenderMainSubcategory(sex, maincategoryId,
					subcategoryId);
			model.addAttribute("total_product", total_product);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "productlist/category";
	}

	@GetMapping(value = "/productdetail/{product_id}")
	public String getproductdetail(@PathVariable(required = false) String product_id, Model model) {
		try {
			ProductDTO productDTO = productService.getProductById(product_id);
			System.out.println("디테일 : " + productDTO);
			model.addAttribute("productDTO", productDTO);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();

			List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(productDTO.getId());
			productcolorlist.put(productDTO.getId(), eachproductcolorlist);

			model.addAttribute("productcolorlist", productcolorlist);
			System.out.println("컬러 : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);

			List<ProductsizeDTO> productsizetlist = productService.getProductSizeById(product_id);
			model.addAttribute("productsizelist", productsizetlist);
			System.out.println("사이즈 : " + productsizetlist);

			List<ReviewDTO> reviewlist = productService.getReviewListByProdutId(product_id);
			model.addAttribute("reviewlist", reviewlist);

			int count_review = reviewlist.size();
			model.addAttribute("count_review", count_review);

			int average_review;
			int total_review = 0;

			if (count_review != 0) {
				for (ReviewDTO review : reviewlist) {
					total_review += review.getRating();
				}
				average_review = total_review / count_review;
			} else {
				average_review = 0;
			}

			model.addAttribute("average_review", average_review);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product/product";
	}

	@PostMapping(value = "product/review")
	@ResponseBody
	public String insertreview(@ModelAttribute ReviewDTO reviewDTO) {
		System.out.println(reviewDTO);
		try {
			productService.insertreview(reviewDTO);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "failed";
	}

	@PostMapping(value = "product/search")
	public String searchproduct(@RequestParam("product_title") String product_title, Model model) {
		System.out.println(product_title);
		try {
			model.addAttribute("keyword", product_title);

			List<ProductDTO> productlist = productService.getProductlistByTitle(product_title);
			model.addAttribute("productlist", productlist);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();
			for (ProductDTO product : productlist) {
				System.out.println("product : " + product);
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				productcolorlist.put(product.getId(), eachproductcolorlist);
			}
			model.addAttribute("productcolorlist", productcolorlist);

			System.out.println("productcolorlist : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "search/search";
	}

	@GetMapping(value = "/selectedproduct/{product_id}")
	public String selectedproduct(@PathVariable(required = false) String product_id, Model model) {
		try {

			int searched = productService.getProductSelectedById(product_id);
			productService.updateProductSelectedById(product_id, searched + 1);

			ProductDTO productDTO = productService.getProductById(product_id);
			System.out.println("디테일 : " + productDTO);
			model.addAttribute("productDTO", productDTO);

			Map<String, List<ProductColorDTO>> productcolorlist = new HashMap<String, List<ProductColorDTO>>();

			List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(productDTO.getId());
			productcolorlist.put(productDTO.getId(), eachproductcolorlist);

			model.addAttribute("productcolorlist", productcolorlist);
			System.out.println("컬러 : " + productcolorlist);

			Map<Integer, String> brandlistmap = new HashMap<Integer, String>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(brand.getId(), brand.getName());
			}
			model.addAttribute("brandlistmap", brandlistmap);

			List<ProductsizeDTO> productsizetlist = productService.getProductSizeById(product_id);
			model.addAttribute("productsizelist", productsizetlist);
			System.out.println("사이즈 : " + productsizetlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "product/product";
	}

	@PostMapping(value = "/product/filtergendermain", produces = "application/json; charset = utf-8")
	@ResponseBody
	public Map<String, Map<String, Object>> filteraction(@RequestBody String strjson) {
		JSONObject jObject = new JSONObject(strjson);
		String brandfilter = jObject.get("brandfilter").toString();
		int maincategory_id = Integer.parseInt(jObject.get("maincategory_id").toString());
		String sex = jObject.get("sex").toString();
		String color = jObject.get("colorfilter").toString();
		System.out.println(sex);
		System.out.println(color);
		System.out.println(maincategory_id);
		List<ProductDTO> productlist = null;

		Map<String, Map<String, Object>> map = new HashMap<String, Map<String, Object>>();
		try {
			productlist = productService.getProductlistByGenderMaincategory(sex, maincategory_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for (int i = 0; i < productlist.size(); i++) {
			String brand_id = Integer.valueOf(productlist.get(i).getBrand_id()).toString();
			System.out.println("brandfilter되나 :" + brand_id);
			if (brandfilter.contains(brand_id)) {

			} else {
				productlist.remove(i);
			}
		}

		try {
			List<SubColorDTO> subcolorlist = productService.getAllSubcolor(color);
			Map<String, Object> productlistmap = new HashMap<String, Object>();
			for (ProductDTO product : productlist) {
				productlistmap.put(product.getId(), product);
			}
			Map<String, Object> productcolorlist = new HashMap<String, Object>();
			for (ProductDTO product : productlist) {
				boolean exist = false;
				System.out.println("product : " + product);
				List<ProductColorDTO> eachproductcolorlist = productService.getProductColorById(product.getId());
				for (ProductColorDTO productcolorDTO : eachproductcolorlist) {
					for (SubColorDTO subcolorDTO : subcolorlist) {
						if (subcolorDTO.getColor().equals(productcolorDTO.getColor())) {
							exist = true;
							break;
						}

					}
					if (exist)
						break;
				}
				if (!exist) {
					productlistmap.remove(product.getId());
				} else {
					productcolorlist.put(product.getId(), eachproductcolorlist);
				}

			}
			System.out.println(productlistmap);
			System.out.println(productcolorlist);

			map.put("productlistmap", productlistmap);
			map.put("productcolorlist", productcolorlist);

			Map<String, Object> brandlistmap = new HashMap<String, Object>();
			List<BrandDTO> brandlist = brandService.getBrandlist();
			for (BrandDTO brand : brandlist) {
				brandlistmap.put(Integer.valueOf(brand.getId()).toString(), brand.getName());
			}
			map.put("brandlistmap", brandlistmap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;

	}

}