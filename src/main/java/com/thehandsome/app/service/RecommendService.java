package com.thehandsome.app.service;

import java.util.List;

import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.UserActivityDTO;

public interface RecommendService {
	
	long insertUserActivity(UserActivityDTO userActivityDTO) throws Exception;
	
	UserActivityDTO getUserActivity(UserActivityDTO userActivityDTO) throws Exception;
	
	long checkUserActivity(UserActivityDTO userActivityDTO) throws Exception;
	
	UserActivityDTO getMaxUserActivity(String member_id) throws Exception;
	
	UserActivityDTO getSumUserActivity(String member_id) throws Exception;
	
	long updateUserActivity(UserActivityDTO userActivityDTO) throws Exception;
	
	ProductDTO getLastMemberActivity(String member_id) throws Exception;

	ProductDTO getProductDetail(String id) throws Exception;
	
	List<ProductDTO> getFirstMemberRecommend(int brand_id) throws Exception;
	
	List<ProductDTO> getNotMemberRecommend() throws Exception;
}