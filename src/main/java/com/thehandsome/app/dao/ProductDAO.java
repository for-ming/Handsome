package com.thehandsome.app.dao;

import com.thehandsome.app.dto.ProductDTO;

public interface ProductDAO {
	ProductDTO getProductInfo(String id);
}
