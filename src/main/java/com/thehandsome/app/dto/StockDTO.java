package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class StockDTO {
    private int id;
    private int branchId;
	private String productId;
	private String sizelabel;
	private String color;
	private int quantity;
}
