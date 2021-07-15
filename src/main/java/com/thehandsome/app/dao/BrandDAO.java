package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.BrandDTO;

public interface BrandDAO {
	public List<BrandDTO> selectAllBrand() throws SQLException;
	public int selectBrandIdByName(String brandName) throws SQLException;
	BrandDTO getBrandInfo(@Param("id") String id, @Param("password") String password) throws SQLException;
	BrandDTO getBrandName(@Param("id") String id) throws SQLException;
	List<BrandDTO> getBrandList() throws SQLException;
}
