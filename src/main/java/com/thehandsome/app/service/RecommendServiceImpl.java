package com.thehandsome.app.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.HomeController;
import com.thehandsome.app.dao.RecommendDAO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.UserActivityDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RecommendServiceImpl implements RecommendService {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private RecommendDAO recommendDAO;

	public long insertUserActivity(UserActivityDTO userActivityDTO) throws Exception {
		log.info(userActivityDTO.toString());
		long result = recommendDAO.insertUserActivity(userActivityDTO);
		return result;
	}

	public UserActivityDTO getUserActivity(UserActivityDTO userActivityDTO) throws Exception {
		log.info(userActivityDTO.toString());
		UserActivityDTO result = recommendDAO.getUserActivity(userActivityDTO);
		return result;
	}
	
	public long checkUserActivity(UserActivityDTO userActivityDTO) throws Exception {
		log.info(userActivityDTO.toString());
		long result = recommendDAO.checkUserActivity(userActivityDTO);
		return result;
	}

	public UserActivityDTO getMaxUserActivity(String member_id) throws Exception {
		log.info(member_id.toString());
		UserActivityDTO result = recommendDAO.getMaxUserActivity(member_id);
		return result;
	}
	
	public UserActivityDTO getSumUserActivity(String member_id) throws Exception {
		log.info(member_id.toString());
		UserActivityDTO result = recommendDAO.getSumUserActivity(member_id);
		return result;
	}

	public long updateUserActivity(UserActivityDTO userActivityDTO) throws Exception {
		log.info(userActivityDTO.toString());
		long result = recommendDAO.updateUserActivity(userActivityDTO);
		return result;
	}
	
	public ProductDTO getLastMemberActivity(String member_id) throws Exception {
		ProductDTO result = recommendDAO.getLastMemberActivity(member_id);
		return result;
	}
	
	public ProductDTO getProductDetail(String id) throws Exception {
		ProductDTO result = recommendDAO.getProductDetail(id);
		return result;
	}
	
	public List<ProductDTO> getFirstMemberRecommend(int brand_id) throws Exception{
		List<ProductDTO> result = recommendDAO.getFirstMemberRecommend(brand_id);
		return result;
	}
	
	public List<ProductDTO> getNotMemberRecommend() throws Exception {
		List<ProductDTO> result = recommendDAO.getNotMemberRecommend();
		return result;
	}

}
