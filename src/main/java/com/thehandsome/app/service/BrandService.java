package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.BrandDTO;

public interface BrandService {

	public int getBrandIdByName(String brandName) throws Exception;

	public List<BrandDTO> getBrandlist() throws Exception;
	BrandDTO getBrandInfo(String id, String password) throws SQLException;
	BrandDTO getBrandName(String id) throws SQLException;
	List<BrandDTO> getBrandList() throws SQLException;
}
