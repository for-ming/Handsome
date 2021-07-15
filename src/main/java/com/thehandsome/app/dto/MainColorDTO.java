package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class MainColorDTO implements Serializable {
	private int id;
	private String color;
}
