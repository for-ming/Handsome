package com.thehandsome.app.dto;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
public class UserActivityDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String member_id;
	private String product_id;
	private Date last_date;
	private int rating;
	private int click_num;
	private int is_like;
	private int stay_time;
	private double p_rating;
	private double p_click_num;
	private double p_stay_time;
	private double preference;
}
