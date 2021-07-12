package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.BranchDTO;

public interface BranchService {
	List<BranchDTO> getBranchList() throws SQLException;
}
