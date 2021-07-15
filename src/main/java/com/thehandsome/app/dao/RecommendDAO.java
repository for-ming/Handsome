package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.UserActivityDTO;

public interface RecommendDAO {

	long insertUserActivity(UserActivityDTO userActivityDTO) throws SQLException;
	
	UserActivityDTO getUserActivity(UserActivityDTO userActivityDTO) throws SQLException;
	
	long checkUserActivity(UserActivityDTO userActivityDTO) throws SQLException;
	
	UserActivityDTO getMaxUserActivity(String member_id) throws SQLException;
	
	UserActivityDTO getSumUserActivity(String member_id) throws SQLException;
	
	long updateUserActivity(UserActivityDTO userActivityDTO) throws SQLException;
	
	ProductDTO getLastMemberActivity(String member_id) throws SQLException;
	
	// product로 옮겨야할것
	ProductDTO getProductDetail(String id) throws SQLException;
	
	List<ProductDTO> getFirstMemberRecommend(int brand_id) throws SQLException;
	
	List<ProductDTO> getNotMemberRecommend() throws SQLException;
}
