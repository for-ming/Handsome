package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.List;

import com.thehandsome.app.dto.SubColorDTO;
import com.thehandsome.app.dto.ProductColorDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductsizeDTO;
import com.thehandsome.app.dto.ReviewDTO;
public interface ProductService {

   public List<ProductDTO> getProductlistByBrand(int brandid) throws Exception;

   public List<ProductColorDTO> getProductColorById(String id) throws Exception;

   public List<ProductColorDTO> getProductImageById(String id) throws Exception;

   public List<Integer> getSubcategoryByGender(String gender) throws Exception;

   public ProductDTO getProductlistByGenderSubcategory(String gender, int subcategoryid) throws Exception;

   public List<ProductDTO> getProductlistByGenderMaincategory(String gender, int maincategoryId) throws Exception;

   public String getMaincategoryName(int maincategoryId) throws Exception;

   public List<ProductDTO> getProductlistByGenderMainSubcategory(String gender, int maincategoryId, int subcategoryId) throws Exception;

   public String getSubcategoryName(int subcategoryId) throws Exception;

   ProductDTO getProductInfo(String productID) throws SQLException;
   
   List<ProductColorDTO> getColorList(String product_id) throws Exception;
   
   List<ProductsizeDTO> getSizeList(String product_id) throws Exception;

   public ProductDTO getProductById(String product_id) throws Exception;

   public List<ProductsizeDTO> getProductSizeById(String product_id) throws Exception;

   ProductDTO getProductDTOAll(String product_id, String color) throws Exception;

   public List<ProductDTO> getProductlistByTitle(String product_title) throws Exception;

   public int getProductSelectedById(String product_id) throws Exception;

   public void updateProductSelectedById(String product_id, int searched) throws Exception;

   public List<ReviewDTO> getReviewListByProdutId(String product_id) throws Exception;

   public List<SubColorDTO> getAllMainColorlist() throws Exception;

   public int getCountProductByGender(String gender) throws Exception;

   public int getCountProductByGenderMaincategory(String sex,int maincategory_id) throws Exception;

   public int getCountProductByGenderMainSubcategory(String gender, int maincategoryId, int subcategoryId) throws Exception;

   public void insertreview(ReviewDTO reviewDTO) throws Exception;

   public List<SubColorDTO> getAllSubcolor(String color) throws Exception;

   public ProductDTO getFirstProduct() throws SQLException;
   
   public List<ProductDTO> getTotalPrice() throws SQLException;
}