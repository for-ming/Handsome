package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.BrandDTO;

public interface BrandService {
	List<BrandDTO> getBrandList() throws SQLException;
}
