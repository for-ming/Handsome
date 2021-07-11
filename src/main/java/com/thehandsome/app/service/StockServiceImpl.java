package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.StockDAO;
import com.thehandsome.app.dto.StockDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StockServiceImpl implements StockService{
	@Autowired
	private StockDAO stockDAO;
	
	@Override
	public StockDTO getStock(HashMap<String, Object> map) throws SQLException{
		return stockDAO.getStock(map);
	}
}
