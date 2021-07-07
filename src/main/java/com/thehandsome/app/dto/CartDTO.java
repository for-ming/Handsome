package com.thehandsome.app.dto;

import org.apache.commons.codec.digest.DigestUtils;

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

	public String getProductId() {
		return productId;
	}
}
