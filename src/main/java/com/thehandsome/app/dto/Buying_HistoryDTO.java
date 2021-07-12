package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class Buying_HistoryDTO implements Serializable{
	private int id;
	private String member_Id;
	private String product_Id;
	private int department_Id;
	private int brand_Id;
	private String purchase_Date;
	private int quantity;
	private String sizelabel;
	private String color;
	private String rec_Method;
	private int stock;
	private int complete;
}
