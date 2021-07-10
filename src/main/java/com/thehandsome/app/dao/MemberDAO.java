package com.thehandsome.app.dao;

import com.thehandsome.app.dto.MemberDTO;

public interface MemberDAO {
	MemberDTO getMemberInfo(String id);
}
