package com.thehandsome.app.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.ProductColorDTO;

public interface ProductColorDAO {
	ProductColorDTO getProductColor(@Param("product_id") String product_id, @Param("color") String color) throws SQLException;
}
