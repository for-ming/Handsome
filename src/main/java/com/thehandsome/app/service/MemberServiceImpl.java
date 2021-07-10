package com.thehandsome.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.MemberDAO;
import com.thehandsome.app.dto.MemberDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberDTO getMemberInfo(String id) {
		return memberDAO.getMemberInfo(id);
	}
}
