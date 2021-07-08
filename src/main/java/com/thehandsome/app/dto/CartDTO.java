package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class CartDTO {
	private String userId;
	private String productId;
	private int quantity;
	private String sizeLabel;
	private String color;
	private String imagePath;
	private String brandName;
	private String title;
	private String price;
	private String sex;
	private int mainCategoryId;
	private int subCategoryId;
	
	public String getProductId() {
		return productId;
	}
}
