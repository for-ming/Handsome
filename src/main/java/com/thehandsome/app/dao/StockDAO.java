package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.HashMap;

import com.thehandsome.app.dto.StockDTO;


public interface StockDAO {
	StockDTO getStock(HashMap<String, Object> map) throws SQLException;
}
