package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.BrandDAO;
import com.thehandsome.app.dao.DepartmentDAO;
import com.thehandsome.app.dao.MemberDAO;
import com.thehandsome.app.dto.BrandDTO;
import com.thehandsome.app.dto.DepartmentDTO;
import com.thehandsome.app.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier(value = "memberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	@Qualifier(value = "brandDAO")
	private BrandDAO brandDAO;
	
	@Autowired
	@Qualifier(value = "departmentDAO")
	private DepartmentDAO departmentDAO;
	
	
	@Override
	public void signup(MemberDTO memberDTO) throws Exception {
		memberDAO.insertMember(memberDTO);
		
	}

	@Override
	public void getMemberById(HashMap<String, Object> map) throws Exception {
		try {
			MemberDTO memberDTO = memberDAO.selectMemberById(map);
			if (memberDTO != null) {
				throw new RuntimeException("이미 사용중인 아이디입니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public void getMemberByPhone(HashMap<String, Object> map) throws Exception {
		try {
			MemberDTO memberDTO = memberDAO.selectMemberByPhone(map);

			if (memberDTO != null) {
				throw new RuntimeException("이미 사용중인 번호입니다.");
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}
		
	}

	@Override
	public List<BrandDTO> getBrandlist() throws Exception {	
		try {
			List<BrandDTO> brandlist = brandDAO.selectAllBrand();
			System.out.println("service");
			System.out.println(brandlist);
			return brandlist;
		} catch (Exception e) {
			log.info(e.getMessage());
			throw e;
		}

	}

	@Override
	public List<DepartmentDTO> getDepartmentlist() throws Exception {
		return departmentDAO.selectAllDepartment();
	}

	@Override
	public MemberDTO signin(MemberDTO memberDTO) throws Exception {
		return memberDAO.selectMemberByIdPassword(memberDTO);
		
	}
	
	@Override
	public MemberDTO getMember(String member_id) throws SQLException {
		return memberDAO.getMember(member_id);
	}
	
	@Override
	public List<MemberDTO> getBuyingMemberList() throws SQLException {
		return memberDAO.getBuyingMemberList();
	}

}
