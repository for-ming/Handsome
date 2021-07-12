package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class CartDTO {
	private String user_id;
	private String product_id;
	private int quantity;
	private String sizelabel;
	private String color;
	private String imagePath;
	private String brand_name;
	private String title;
	private String price;
	private String sex;
	private int mainCategory_id;
	private int subCategory_id;
	
	public String getProductId() {
		return product_id;
	}
}
