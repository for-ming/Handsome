package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.BranchDTO;

public interface BranchService {
	BranchDTO getBranch(String department, String brand) throws SQLException;
	BranchDTO getBranchDTO(String id) throws SQLException;
	List<BranchDTO> getBranchList() throws SQLException;
}
