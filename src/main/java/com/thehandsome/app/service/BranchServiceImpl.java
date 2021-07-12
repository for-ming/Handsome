package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.BranchDAO;
import com.thehandsome.app.dto.BranchDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BranchServiceImpl implements BranchService{
	@Autowired
	private BranchDAO branchDAO;
	
	@Override
	public List<BranchDTO> getBranchList() throws SQLException {
		return branchDAO.getBranchList();
	}
}
