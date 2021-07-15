package com.thehandsome.app.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.ProductColorDAO;
import com.thehandsome.app.dto.ProductColorDTO;

@Service
public class ProductColorServiceImpl implements ProductColorService {
	@Autowired
	ProductColorDAO productColor;
	
	@Override
	public ProductColorDTO getProductColor(String product_id, String color) throws SQLException {
		return productColor.getProductColor(product_id, color);
	}

}
