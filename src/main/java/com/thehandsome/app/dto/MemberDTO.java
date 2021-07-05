package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class MemberDTO {
	String id;
	String password;
	String name;
	String gender;
	String address;
	String phone;
	String registNum; // 테이블에는 regist_num으로 되어있음
	String preferBrand;
	String preferDepartment;
	
}
