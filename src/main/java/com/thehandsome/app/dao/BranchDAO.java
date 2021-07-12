package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.BranchDTO;


public interface BranchDAO {
	List<BranchDTO> getBranchList() throws SQLException;
}
