package com.thehandsome.app.dao;

import java.util.List;

import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductcolorDTO;
import com.thehandsome.app.dto.ProductsizeDTO;

public interface ProductDAO {
	ProductDTO getProductInfo(String id);
	List<ProductcolorDTO> getColorList(String product_id);
	List<ProductsizeDTO> getSizeList(String product_id);
}
