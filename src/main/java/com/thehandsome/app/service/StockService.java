package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.thehandsome.app.dto.StockDTO;

public interface StockService {
	StockDTO getStock(HashMap<String, Object> map) throws SQLException;
}
