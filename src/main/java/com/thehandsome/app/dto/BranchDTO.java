package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class BranchDTO implements Serializable {
	private int id;
	private int department_id;
	private int brand_id;
    

}
