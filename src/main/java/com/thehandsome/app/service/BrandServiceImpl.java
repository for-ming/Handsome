package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.BrandDAO;
import com.thehandsome.app.dto.BrandDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BrandServiceImpl implements BrandService{
	@Autowired
	private BrandDAO brandDAO;
	
	@Override
	public List<BrandDTO> getBrandList() throws SQLException {
		return brandDAO.getBrandList();
	}
	
}
