package com.thehandsome.app.service;

import java.util.List;

import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductcolorDTO;
import com.thehandsome.app.dto.ProductsizeDTO;

public interface ProductService {
	ProductDTO getProductInfo(String id);
	List<ProductcolorDTO> getColorList(String productId);
	List<ProductsizeDTO> getSizeList(String productId);
}
