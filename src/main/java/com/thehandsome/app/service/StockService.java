package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.thehandsome.app.dto.StockDTO;

public interface StockService {
	StockDTO getStock(int department, int brand, String sizeLabel, String color, int quantity) throws SQLException;
	StockDTO getStockInfo(HashMap<String, Object> map) throws SQLException;
	void minusStock(int destination, String product_id, String sizeLabel, String color, int quantity) throws SQLException;
	void plusStock(int departure, String product_id, String sizeLabel, String color, int quantity, int id) throws SQLException;
}
