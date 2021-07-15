package com.thehandsome.app.service;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.ProductColorDTO;

public interface ProductColorService {
	ProductColorDTO getProductColor(@Param("product_id") String product_id, @Param("color") String color) throws SQLException;
}
