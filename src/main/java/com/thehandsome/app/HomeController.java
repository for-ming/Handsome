package com.thehandsome.app;

import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.thehandsome.app.dto.MemberDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.service.RecommendService;
import com.thehandsome.app.utils.RecommendProduct;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RecommendService recommendService;

	RecommendProduct rp = new RecommendProduct();

	@GetMapping("/")
	public String main(Model model, HttpSession session) throws Exception {

		// 해당 유저의 recommend테이블에서 추천 목록을 가져온다.
		// 추천 목록 -> 상품id를 통해 상품 정보를 가져온다.
		// 상품 정보를 model로 뿌린다.

		List<ProductDTO> recommendList = new LinkedList<>();

		// 세션 가져온다.
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");

		// 로그인하지 않은 유저에겐 가장 인기있는(검색이 많이 되거나 선호도가 높은) 상품을 추천
		if (memberInfo == null) {

			recommendList = recommendService.getNotMemberRecommend();

		} else {

			// 세션 id를 기반으로 해당 유저의 최근 조회한 상품을 가져온다.
			ProductDTO last_product = recommendService.getLastMemberActivity(memberInfo.getId());

			// 만약 처음 가입한 유저라 사용자 데이터가 없다면 관심 브랜드에 상품을 랜덤으로 보여줌(성별 필터링)
			if (last_product == null) {

				recommendList = recommendService.getFirstMemberRecommend(memberInfo.getPrefer_brand_id());

			} else {
				System.out.println("최근 상품   " + last_product.toString());

				// 추천
				List<String> list = rp.recommend(last_product.getId());

				Deque<ProductDTO> recommendList1 = new LinkedList<>();
				Deque<ProductDTO> recommendList2 = new LinkedList<>();
				Deque<ProductDTO> recommendList3 = new LinkedList<>();
				Deque<ProductDTO> recommendList4 = new LinkedList<>();

				// 추천 상품 필터링
				/*
				 * 0. 이미 구매한 상품 필터링 1. 성별에 맞게 필터링 2. 최근 조회한 상품의 옷 분류가 앞으로(가디건이면 가디건) 3. 최근 조회한
				 * 상품의 브랜드를 앞으로
				 */

				for (String id : list) {

					System.out.print(id + " ");

					ProductDTO item = recommendService.getProductDetail(id);

					if (item.getSex().equals(last_product.getSex())) {
						if (item.getMaincategory_id() == last_product.getMaincategory_id()) {
							if (item.getSubcategory_id() == last_product.getSubcategory_id()) {
								if (item.getBrand_id() == last_product.getBrand_id()) {
									recommendList1.offerLast(item);
									continue;
								} else {
									recommendList2.offerLast(item);
									continue;
								}
							} else {
								recommendList3.offerLast(item);
								continue;
							}

						} else {
							recommendList4.offerLast(item);
							continue;
						}
					}
				}

				for (ProductDTO item : recommendList1)
					System.out.println("1군   " + item.toString());

				for (ProductDTO item : recommendList2)
					System.out.println("2군   " + item.toString());

				for (ProductDTO item : recommendList3)
					System.out.println("3군   " + item.toString());

				for (ProductDTO item : recommendList4)
					System.out.println("4군   " + item.toString());

				// 합쳐서 10개로 줄여주자.
				recommendList1.addAll(recommendList2);
				recommendList1.addAll(recommendList3);
				recommendList1.addAll(recommendList4);

				for (int i = 0; i < 10; i++)
					recommendList.add(recommendList1.pollFirst());

				System.out.println("사이즈 " + recommendList.toString());
			}

		}

		model.addAttribute("recommendList", recommendList);

		return "main";
	}

	@GetMapping("/recommend")
	public String recommend(Model model, HttpSession session) throws Exception {

		// 해당 유저의 recommend테이블에서 추천 목록을 가져온다.
		// 추천 목록 -> 상품id를 통해 상품 정보를 가져온다.
		// 상품 정보를 model로 뿌린다.

		List<ProductDTO> recommendList = new LinkedList<>();
		
		int i = 0;

		// 세션 가져온다.
		MemberDTO memberInfo = (MemberDTO) session.getAttribute("memberInfo");

		// 로그인하지 않은 유저에겐 가장 인기있는(검색이 많이 되거나 선호도가 높은) 상품을 추천
		if (memberInfo == null) {

			logger.info("비회원" + ++i);
			recommendList = recommendService.getNotMemberRecommend();

		} else {

			// 세션 id를 기반으로 해당 유저의 최근 조회한 상품을 가져온다.
			ProductDTO last_product = recommendService.getLastMemberActivity(memberInfo.getId());

			// 만약 처음 가입한 유저라 사용자 데이터가 없다면 관심 브랜드에 상품을 랜덤으로 보여줌(성별 필터링)
			if (last_product == null) {

				logger.info("처음 가입한 회원");
				recommendList = recommendService.getFirstMemberRecommend(memberInfo.getPrefer_brand_id());

			} else {

				System.out.println("최근 상품 " + last_product.toString());

				// 추천
				List<String> list = rp.recommend(last_product.getId());

				Deque<ProductDTO> recommendList1 = new LinkedList<>();
				Deque<ProductDTO> recommendList2 = new LinkedList<>();
				Deque<ProductDTO> recommendList3 = new LinkedList<>();
				Deque<ProductDTO> recommendList4 = new LinkedList<>();

				// 추천 상품 필터링
				/*
				 * 0. 이미 구매한 상품 필터링 1. 성별에 맞게 필터링 2. 최근 조회한 상품의 옷 분류가 앞으로(가디건이면 가디건) 3. 최근 조회한
				 * 상품의 브랜드를 앞으로
				 */

				for (String id : list) {

					System.out.print(id + " ");

					ProductDTO item = recommendService.getProductDetail(id);

					if (item.getSex().equals(last_product.getSex())) {
						if (item.getMaincategory_id() == last_product.getMaincategory_id()) {
							if (item.getSubcategory_id() == last_product.getSubcategory_id()) {
								if (item.getBrand_id() == last_product.getBrand_id()) {
									recommendList1.offerLast(item);
									continue;
								} else {
									recommendList2.offerLast(item);
									continue;
								}
							} else {
								recommendList3.offerLast(item);
								continue;
							}

						} else {
							recommendList4.offerLast(item);
							continue;
						}
					}
				}

				for (ProductDTO item : recommendList1)
					System.out.println("1군   " + item.toString());

				for (ProductDTO item : recommendList2)
					System.out.println("2군   " + item.toString());

				for (ProductDTO item : recommendList3)
					System.out.println("3군   " + item.toString());

				for (ProductDTO item : recommendList4)
					System.out.println("4군   " + item.toString());

				// 합쳐서 10개로 줄여주자.
				recommendList1.addAll(recommendList2);
				recommendList1.addAll(recommendList3);
				recommendList1.addAll(recommendList4);

				recommendList.addAll(recommendList1);

			}
		}

		System.out.println("에반데 " + recommendList.size());

		model.addAttribute("recommendList", recommendList);

		return "productlist/recommend";
	}
}
