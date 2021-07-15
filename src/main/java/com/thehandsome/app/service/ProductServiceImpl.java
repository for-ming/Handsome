package com.thehandsome.app.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.thehandsome.app.dao.ProductDAO;
import com.thehandsome.app.dto.SubColorDTO;
import com.thehandsome.app.dto.ProductColorDTO;
import com.thehandsome.app.dto.ProductDTO;
import com.thehandsome.app.dto.ProductsizeDTO;
import com.thehandsome.app.dto.ReviewDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

   @Autowired
   @Qualifier(value = "productDAO")
   private ProductDAO productDAO;

   @Override
   public List<ProductDTO> getProductlistByBrand(int brandid) throws Exception {
      return productDAO.getProductByBrand(brandid);
   }

   @Override
   public List<ProductColorDTO> getProductColorById(String id) throws Exception {
      return productDAO.getProductcolorByID(id);
   }

   @Override
   public List<ProductColorDTO> getProductImageById(String id) throws Exception {
      return productDAO.getProductImageById(id);
   }

   @Override
   public List<Integer> getSubcategoryByGender(String gender) throws Exception {
      return productDAO.getSubcategoryByGender(gender);
   }

   @Override
   public ProductDTO getProductlistByGenderSubcategory(String gender, int subcategoryid) throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("gender", gender);
      map.put("subcategoryid", subcategoryid);
      return productDAO.getProductByGenderandSubcategory(map);
   }

   @Override
   public List<ProductDTO> getProductlistByGenderMaincategory(String gender, int maincategoryId) throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("gender", gender);
      map.put("maincategoryid", maincategoryId);
      return productDAO.getProductlistByGenderMaincategory(map);
   }

   @Override
   public String getMaincategoryName(int maincategoryId) throws Exception {
      return productDAO.getMaincategoryName(maincategoryId);
   }

   @Override
   public List<ProductDTO> getProductlistByGenderMainSubcategory(String gender, int maincategoryId, int subcategoryId)
         throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("gender", gender);
      map.put("maincategoryid", maincategoryId);
      map.put("subcategoryid", subcategoryId);
      return productDAO.getProductlistByGenderMainSubcategory(map);
   }

   @Override
   public String getSubcategoryName(int subcategoryId) throws Exception {
      return productDAO.getSubcategoryName(subcategoryId);
   }

   @Override
   public ProductDTO getProductInfo(String productID) throws SQLException {
      return productDAO.getProductInfo(productID);
   }
   

   @Override
   public List<ProductColorDTO> getColorList(String product_id) throws Exception{
      return productDAO.getColorList(product_id);
   }
   public ProductDTO getProductById(String product_id) throws Exception {
      return productDAO.selectProductById(product_id);
   }

   @Override
   public List<ProductsizeDTO> getProductSizeById(String product_id) throws Exception {
      return productDAO.selectProductSizeById(product_id);
   }

   @Override
   public List<ProductsizeDTO> getSizeList(String product_id) throws Exception {
      return productDAO.getSizeList(product_id);
   }

   @Override
   public ProductDTO getProductDTOAll(String product_id, String color) throws Exception {
      return productDAO.getProductDTOAll(product_id, color);
   }

   public List<ProductDTO> getProductlistByTitle(String product_title) throws Exception {
      return productDAO.getProductlistByTitle(product_title);
   }

   @Override
   public int getProductSelectedById(String product_id) throws Exception {
      return productDAO.getProductSelectedById(product_id);
   }

   @Override
   public void updateProductSelectedById(String product_id, int searched) throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("product_id", product_id);
      map.put("searched", searched);
      productDAO.updateProductSelectedById(map);
      
   }


   @Override
   public List<ReviewDTO> getReviewListByProdutId(String product_id) throws Exception {
      return productDAO.getReviewListByProdutId(product_id);
   }

   @Override
   public List<SubColorDTO> getAllMainColorlist() throws Exception {
      return productDAO.getAllMainColorlist();
   }

   @Override
   public int getCountProductByGender(String gender) throws Exception {
      return productDAO.getCountProductByGender(gender);
   }

   @Override
   public int getCountProductByGenderMaincategory(String gender,int maincategory_id) throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("gender", gender);
      map.put("maincategory_id", maincategory_id);
      return productDAO.getCountProductByGenderMaincategory(map);
   }

   @Override
   public int getCountProductByGenderMainSubcategory(String gender, int maincategoryId, int subcategoryId)
         throws Exception {
      HashMap<String,Object> map = new HashMap<String, Object>();
      map.put("gender", gender);
      map.put("maincategory_id", maincategoryId);
      map.put("subcategory_id", subcategoryId);
      return productDAO.getCountProductByGenderMainSubcategory(map);
   }

   @Override
   public void insertreview(ReviewDTO reviewDTO) throws Exception {
	   productDAO.insertreview(reviewDTO);
   }

   @Override
   public List<SubColorDTO> getAllSubcolor(String color) throws Exception {
	   return productDAO.getAllSubcolor(color);
   }

   @Override
   public ProductDTO getFirstProduct() throws SQLException {
	   return productDAO.getFirstProduct();
   }

   @Override
   public List<ProductDTO> getTotalPrice() throws SQLException {
	   return productDAO.getTotalPrice();
   }
}