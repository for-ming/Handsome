package com.thehandsome.app.dto;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String password;
	private String name;
	private String gender;
	private String address;
	private String phone;
	private String birth;
	private int age;
	private int prefer_brand_id;
	private int prefer_department_id;

	
    public void setPassword(String password) {
        this.password = DigestUtils.sha512Hex(password);
    }
 
}