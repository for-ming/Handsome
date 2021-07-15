package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductDTO implements Serializable {

	private String id;
	private int brand_id;
	private String brandname;
	private String sex;
	private String title;
	private int price;
	private String imagepath;
	private int maincategory_id;
	private int subcategory_id;
	private String shortdetail;
	private String longdetail;
	private int selected;
	private int searched;
}
