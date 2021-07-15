package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class StockDTO implements Serializable{
	private int id;

    private int branch_id;
	private String product_id;
	private String sizelabel;
	private String color;

	private int quantity;;


}
