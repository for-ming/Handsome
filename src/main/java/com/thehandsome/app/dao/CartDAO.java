package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.CartDTO;

public interface CartDAO {
	List<CartDTO> getCartList(String userId) throws SQLException;
	void insertCart(CartDTO cartDTO) throws SQLException;
	void deleteCart(CartDTO cartDTO) throws SQLException;
	void updateCart(CartDTO cartDTO) throws SQLException;
	void updateQuantity(CartDTO cartDTO) throws SQLException;
}
