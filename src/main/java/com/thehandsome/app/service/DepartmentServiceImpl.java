package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.DepartmentDAO;
import com.thehandsome.app.dto.DepartmentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired
	private DepartmentDAO storeDAO;
	
	@Override
	public List<DepartmentDTO> getDepartmentList() throws SQLException {
		return storeDAO.getDepartmentList();
	}
}
