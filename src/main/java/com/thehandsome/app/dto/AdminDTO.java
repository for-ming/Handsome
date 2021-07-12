package com.thehandsome.app.dto;

import java.io.Serializable;

import org.apache.commons.codec.digest.DigestUtils;

import lombok.Data;

@Data
public class AdminDTO implements Serializable {
    private String id;
    private String password;
    private String branch_id;
    
    public void setPassword(String password) {
        this.password = DigestUtils.sha512Hex(password);
    }
}