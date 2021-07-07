package com.thehandsome.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.ProductDAO;
import com.thehandsome.app.dto.ProductDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public ProductDTO getProductInfo(String id) {
		return productDAO.getProductInfo(id);
	}

}
