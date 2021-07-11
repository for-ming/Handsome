package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.BrandDTO;


public interface BrandDAO {
	List<BrandDTO> getBrandList() throws SQLException;
}
