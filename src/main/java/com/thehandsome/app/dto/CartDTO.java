package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class CartDTO implements Serializable {

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
	
	public String getProduct_id() {
		return product_id;
	}

}
