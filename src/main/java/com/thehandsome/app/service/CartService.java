package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.CartDTO;

public interface CartService {
	List<CartDTO> getCartList(String user_id) throws SQLException;
	void insertCart(CartDTO CartDTO) throws SQLException;
	void deleteCart(CartDTO CartDTO) throws SQLException;
	void updateCart(CartDTO CartDTO) throws SQLException;
	void updateQuantity(CartDTO cartDTO) throws SQLException;
}
