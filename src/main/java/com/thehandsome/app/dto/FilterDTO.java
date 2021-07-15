package com.thehandsome.app.dto;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

@Data
public class FilterDTO implements Serializable {
    private List<String> brandfilter;
    private String colorfilter;
    private String sex;
    private int maincategory_id;
    private int subcategory_id;
}