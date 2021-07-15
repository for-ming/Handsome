package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.DepartmentDTO;

public interface DepartmentDAO {
	public List<DepartmentDTO> selectAllDepartment() throws SQLException;
	DepartmentDTO getDepartmentInfo(@Param("id") String id, @Param("password") String password) throws SQLException;
	DepartmentDTO getDepartmentName(@Param("id") String id) throws SQLException;
	List<DepartmentDTO> getDepartmentList() throws SQLException;
}
