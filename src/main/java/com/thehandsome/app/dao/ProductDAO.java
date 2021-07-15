package com.thehandsome.app.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.thehandsome.app.dto.SubColorDTO;
import com.thehandsome.app.dto.ProductColorDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductsizeDTO;
import com.thehandsome.app.dto.ReviewDTO;



public interface ProductDAO {

   List<ProductDTO> getProductByBrand(int brandid) throws SQLException;
   List<ProductColorDTO> getProductcolorByID(String productid) throws SQLException;
   List<ProductColorDTO> getProductImageById(String productid) throws SQLException;
   List<Integer> getSubcategoryByGender(String gender) throws SQLException;
   ProductDTO getProductByGenderandSubcategory(HashMap<String,Object> map) throws SQLException;
   List<ProductDTO> getProductlistByGenderMaincategory(HashMap<String, Object> map) throws SQLException;
   String getMaincategoryName(int maincategoryId) throws SQLException;
   List<ProductDTO> getProductlistByGenderMainSubcategory(HashMap<String, Object> map) throws SQLException;
   String getSubcategoryName(int subcategoryId) throws SQLException;
   ProductDTO getProductInfo(@Param("productID") String productID) throws SQLException;
   List<ProductsizeDTO> getSizeList(String product_id) throws Exception;
   List<ProductColorDTO> getColorList(String product_id) throws Exception;
   ProductDTO selectProductById(String product_id) throws SQLException;
   List<ProductsizeDTO> selectProductSizeById(String product_id) throws SQLException;
   ProductDTO getProductDTOAll(@Param("product_id") String product_id, @Param("color") String color) throws SQLException;
   List<ProductDTO> getProductlistByTitle(String product_title) throws SQLException;
   void insertProductSelectedById(String product_id) throws SQLException;
   int getProductSelectedById(String product_id) throws SQLException;
   void updateProductSelectedById(HashMap<String,Object> map) throws SQLException;
   List<ReviewDTO> getReviewListByProdutId(String product_id) throws SQLException;
   List<SubColorDTO> getAllMainColorlist() throws SQLException;
   int getCountProductByGender(String gender) throws SQLException;
   int getCountProductByGenderMaincategory(HashMap<String,Object> map) throws SQLException;
   int getCountProductByGenderMainSubcategory(HashMap<String, Object> map) throws SQLException;
   void insertreview(ReviewDTO reviewDTO) throws SQLException;
   List<SubColorDTO> getAllSubcolor(String maincolor) throws SQLException;
   public ProductDTO getFirstProduct() throws SQLException;
   public List<ProductDTO> getTotalPrice() throws SQLException;

}