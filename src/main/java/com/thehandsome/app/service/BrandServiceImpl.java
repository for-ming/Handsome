package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.BrandDAO;
import com.thehandsome.app.dto.BrandDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	@Qualifier(value = "brandDAO")
	private BrandDAO brandDAO;

	@Override
	public int getBrandIdByName(String brandName) throws Exception {
		return brandDAO.selectBrandIdByName(brandName);
	}

	@Override
	public List<BrandDTO> getBrandlist() throws Exception {
		return brandDAO.selectAllBrand();
	}


	@Override
	public BrandDTO getBrandInfo(String id, String password) throws SQLException {
		return brandDAO.getBrandInfo(id, password);
	}

	@Override
	public BrandDTO getBrandName(String id) throws SQLException {
		return brandDAO.getBrandName(id);
	}

	@Override
	public List<BrandDTO> getBrandList() throws SQLException {
		return brandDAO.getBrandList();
	}
	
}
