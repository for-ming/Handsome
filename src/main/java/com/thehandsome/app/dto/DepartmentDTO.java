package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class DepartmentDTO implements Serializable{
	private long id;
	private String name;
	private String address;
	private double latitude;
	private double longitude;
}
