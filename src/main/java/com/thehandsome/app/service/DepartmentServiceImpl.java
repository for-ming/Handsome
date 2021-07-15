package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.DepartmentDAO;
import com.thehandsome.app.dto.DepartmentDTO;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDAO departmentDAO;

	@Override
	public DepartmentDTO getDepartmentInfo(String id, String password) throws SQLException {
		return departmentDAO.getDepartmentInfo(id, password);
	}

	@Override
	public DepartmentDTO getDepartmentName(String id) throws SQLException {
		return departmentDAO.getDepartmentName(id);
	}

	@Override
	public List<DepartmentDTO> getDepartmentList() throws SQLException {
		return departmentDAO.getDepartmentList();
	}

}
