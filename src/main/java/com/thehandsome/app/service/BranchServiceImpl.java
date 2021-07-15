package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.BranchDAO;
import com.thehandsome.app.dto.BranchDTO;

@Service
public class BranchServiceImpl implements BranchService {
	@Autowired
	BranchDAO branchDAO;
	
	@Override
	public BranchDTO getBranch(String department, String brand) throws SQLException {
		return branchDAO.getBranch(department, brand);
	}

	@Override
	public BranchDTO getBranchDTO(String id) throws SQLException {
		return branchDAO.getBranchDTO(id);
	}

	@Override
	public List<BranchDTO> getBranchList() throws SQLException {
		return branchDAO.getBranchList();
	}

}
