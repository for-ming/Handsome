package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.Buying_HistoryDAO;
import com.thehandsome.app.dto.Buying_HistoryDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Buying_HistoryServiceImpl implements Buying_HistoryService{
	@Autowired
	private Buying_HistoryDAO buying_HistoryDAO;
	
	@Override
	public List<Buying_HistoryDTO> getBuying_HistoryList(String user_id) throws SQLException {
		return buying_HistoryDAO.getBuying_HistoryList(user_id);
	}
	
	@Override
	public void insertBuying_History(Buying_HistoryDTO buying_HistoryDTO) throws SQLException {
		try {
			buying_HistoryDAO.insertBuying_History(buying_HistoryDTO);
		} catch (Exception e) {
			log.info(e.toString());
			throw e;
		}
	}
	
}
