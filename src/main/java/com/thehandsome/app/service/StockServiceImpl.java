package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.StockDAO;
import com.thehandsome.app.dto.StockDTO;

@Service
public class StockServiceImpl implements StockService {
	@Autowired
	StockDAO stockDAO;
	
	@Override
	public StockDTO getStockInfo(HashMap<String, Object> map) throws SQLException{
		return stockDAO.getStockInfo(map);
	}
	
	@Override
	public StockDTO getStock(int department, int brand, String sizeLabel, String color, int quantity) throws SQLException {
		return stockDAO.getStock(department, brand, sizeLabel, color, quantity);
	}

	@Override
	public void minusStock(int destination, String product_id, String sizeLabel, String color, int quantity)
			throws SQLException {
		stockDAO.minusStock(destination, product_id, sizeLabel, color, quantity);
	}

	@Override
	public void plusStock(int departure, String product_id, String sizeLabel, String color, int quantity, int id)
			throws SQLException {
		stockDAO.plusStock(departure, product_id, sizeLabel, color, quantity, id);
	}
}
