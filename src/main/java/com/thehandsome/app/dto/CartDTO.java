package com.thehandsome.app.dto;

import lombok.Data;

@Data
public class CartDTO {
	String userId;
	String productId;
	int quantity;
}
