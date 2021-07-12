package com.thehandsome.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.ProductDAO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductcolorDTO;
import com.thehandsome.app.dto.ProductsizeDTO;

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
	
	@Override
	public List<ProductcolorDTO> getColorList(String product_id) {
		return productDAO.getColorList(product_id);
	}
	
	@Override
	public List<ProductsizeDTO> getSizeList(String product_id) {
		return productDAO.getSizeList(product_id);
	}
}
