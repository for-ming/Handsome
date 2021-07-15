package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class SubColorDTO implements Serializable {
	private String maincolor;
	private String color;
}
