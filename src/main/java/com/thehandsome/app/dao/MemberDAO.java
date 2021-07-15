package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.MemberDTO;



public interface MemberDAO {
	void signup(MemberDTO memberDTO) throws SQLException;

	MemberDTO selectMemberById(HashMap<String, Object> map) throws SQLException;
	MemberDTO selectMemberByPhone(HashMap<String, Object> map) throws SQLException;
	void insertMember(MemberDTO memberDTO) throws SQLException;
	MemberDTO selectMemberByIdPassword(MemberDTO memberDTO) throws SQLException;
	MemberDTO getMember(@Param("member_id") String member_id) throws SQLException;
	MemberDTO getMemberInfo(String id);
	List<MemberDTO> getBuyingMemberList() throws SQLException;
}
