package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class CartDTO {
	String userId;
	String productId;
	int quantity;
	String sizeLabel;
	String color;
	String imagePath;
	String title;
	int price;
	String brandName;
	
}
