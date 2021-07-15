package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.MemberDTO;


public interface MemberService {
	public void signup(MemberDTO memberDTO) throws Exception;

	public void getMemberById(HashMap<String, Object> map) throws Exception;

	public void getMemberByPhone(HashMap<String, Object> map) throws Exception;

	public List<BrandDTO> getBrandlist() throws Exception;

	public List<DepartmentDTO> getDepartmentlist() throws Exception;

	public MemberDTO signin(MemberDTO memberDTO) throws Exception;
	
	MemberDTO getMember(String member_id) throws SQLException;
	
	List<MemberDTO> getBuyingMemberList() throws SQLException;
}
