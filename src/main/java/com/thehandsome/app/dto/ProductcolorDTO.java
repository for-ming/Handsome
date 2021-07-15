package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductColorDTO {
	private String product_id;
	private String color;
	private String imagePath;
}
