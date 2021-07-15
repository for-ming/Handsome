package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.BranchDTO;

public interface BranchDAO {
	BranchDTO getBranch(@Param("department") String department, @Param("brand") String brand) throws SQLException;
	BranchDTO getBranchDTO(@Param("id") String id) throws SQLException;
	List<BranchDTO> getBranchList() throws SQLException;
}
