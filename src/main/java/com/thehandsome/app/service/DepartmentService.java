package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.DepartmentDTO;

public interface DepartmentService {
	DepartmentDTO getDepartmentInfo(String id, String password) throws SQLException; 
	DepartmentDTO getDepartmentName(String id) throws SQLException;
	List<DepartmentDTO> getDepartmentList() throws SQLException;
}
