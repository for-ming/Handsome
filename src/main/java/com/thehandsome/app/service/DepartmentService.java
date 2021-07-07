package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.thehandsome.app.dto.DepartmentDTO;

@Service
public interface DepartmentService {
	List<DepartmentDTO> getDepartmentList() throws SQLException;
}
