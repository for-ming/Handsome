package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class DepartmentDTO {
	private long id;
	private String name;
	private String address;
	private double latitude;
	private double longitude;
}
