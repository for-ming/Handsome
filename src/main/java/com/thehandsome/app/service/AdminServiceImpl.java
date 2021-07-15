package com.thehandsome.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.AdminDAO;
import com.thehandsome.app.dto.AdminDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	@Qualifier(value = "adminDAO")
	private AdminDAO adminDAO;

	

	@Override
	public AdminDTO signin(AdminDTO adminDTO) throws Exception {
		return adminDAO.selectMemberByIdPassword(adminDTO);
		
	}

}
