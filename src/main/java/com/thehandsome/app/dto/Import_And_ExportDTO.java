package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class Import_And_ExportDTO implements Serializable {
	private int buying_History_Id;
	private int departure;
	private int destination;
	private String state;
}
