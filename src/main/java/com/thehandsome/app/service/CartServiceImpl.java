package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.CartDAO;
import com.thehandsome.app.dto.CartDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<CartDTO> getCartList(String userId) throws SQLException {
		return cartDAO.getCartList(userId);
	}

	@Override
	public void insertCart(CartDTO cartDTO) throws SQLException {
		try {
			cartDAO.insertCart(cartDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}

	@Override
	public void deleteCart(CartDTO cartDTO) throws SQLException {
		try {
			cartDAO.deleteCart(cartDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}

	@Override
	public void updateCart(CartDTO cartDTO) throws SQLException {
		try {
			cartDAO.updateCart(cartDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}
}
