package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class Buying_HistoryDTO implements Serializable {
	private int id;
	private String member_id;
	private String product_id;
	private int department_id;
	private int brand_id;
	private String purchase_date;
	private int quantity;
	private String sizelabel;
	private String color;
	private String rec_method;
	private int stock;
	private int complete;
}
