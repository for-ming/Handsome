package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.StockDTO;

public interface StockDAO {
	StockDTO getStockInfo(HashMap<String, Object> map) throws SQLException;
	StockDTO getStock(@Param("department") int department, @Param("brand") int brand, @Param("sizeLabel") String sizeLabel, @Param("color") String color, @Param("quantity") int quantity) throws SQLException;
	void minusStock(@Param("destination") int destination, @Param("product_id") String product_id, @Param("sizeLabel") String sizeLabel, @Param("color") String color, @Param("quantity") int quantity) throws SQLException;
	void plusStock(@Param("departure") int departure, @Param("product_id") String product_id, @Param("sizeLabel") String sizeLabel, @Param("color") String color, @Param("quantity") int quantitym, @Param("id") int id) throws SQLException;
}
