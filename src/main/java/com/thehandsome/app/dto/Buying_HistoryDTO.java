package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class Buying_HistoryDTO implements Serializable{
	private int id;
	private String memberId;
	private String productId;
	private int departmentId;
	private int brandId;
	private String purchaseDate;
	private int quantity;
	private String sizelabel;
	private String color;
	private String recMethod;
	private int stock;
	private int complete;
}
