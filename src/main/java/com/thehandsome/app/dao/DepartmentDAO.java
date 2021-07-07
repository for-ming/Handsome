package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.DepartmentDTO;

public interface DepartmentDAO {
	List<DepartmentDTO> getDepartmentList() throws SQLException;
}
