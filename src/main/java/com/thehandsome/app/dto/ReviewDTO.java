package com.thehandsome.app.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class ReviewDTO implements Serializable {
    private int id;
    private String member_id;
    private String product_id;
    private int rating;
    private String comments;
}