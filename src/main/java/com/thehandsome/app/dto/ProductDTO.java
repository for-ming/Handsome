package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class ProductDTO {
	private String id;
	private int brandId;
	private String sex;
	private String title;
	private int price;
	private int maincategoryId;
	private int subcategoryId;
	private String shortDetail;
	private String longDetail;
}
