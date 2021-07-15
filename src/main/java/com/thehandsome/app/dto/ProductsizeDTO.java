package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductsizeDTO implements Serializable{
	private String product_id;
	private String sizelabel;

}
