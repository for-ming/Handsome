package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.Buying_HistoryDTO;

public interface Buying_HistoryService {
	Buying_HistoryDTO getProduct(int id) throws SQLException;
	void updateStock(int id) throws SQLException;
	List<Buying_HistoryDTO> getBuying_HistoryList(String user_id) throws SQLException;
	void insertBuying_History(Buying_HistoryDTO buying_HistoryDTO) throws SQLException;
}
