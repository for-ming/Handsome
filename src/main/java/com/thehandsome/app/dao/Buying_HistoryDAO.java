package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.Buying_HistoryDTO;


public interface Buying_HistoryDAO {
	List<Buying_HistoryDTO> getBuying_HistoryList(String user_id) throws SQLException;
	void insertBuying_History(Buying_HistoryDTO buying_HistoryDTO) throws SQLException;
}
