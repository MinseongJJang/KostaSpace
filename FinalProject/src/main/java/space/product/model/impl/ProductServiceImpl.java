package space.product.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.hashtag.domain.HashtagVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;
@Service
public class ProductServiceImpl implements ProductService{
   @Autowired
   private ProductDAO productDAO;

   @Override
   public void registerProduct(ProductVO productVO) throws Exception {
      System.out.println("registerProduct Call");
      productDAO.registerProduct(productVO);
      
   }

   @Override
   public ProductVO getProductInfo(int p_no) throws Exception {
      System.out.println("getProductInfo Call");
      return productDAO.getProductInfo(p_no);
   }

   @Override
   public void updateProduct(ProductVO productVO) throws Exception {
      System.out.println("updateProduct Call");
      productDAO.updateProduct(productVO);
      
   }

   @Override
   public void deleteProduct(int no) throws Exception {
      System.out.println("deleteProduct Call");
      productDAO.deleteProduct(no);
      
   }

   @Override
   public List<HashtagVO> searchProductByHashtag(String keyword) throws Exception {
      System.out.println("searchProduct Call");
      return productDAO.searchProductByHashtag(keyword);
   }

   @Override
   public List<ProductVO> searchProductByCondition(ProductVO productVO) throws Exception {
      System.out.println("searchProductByCondition Call");
      return productDAO.searchProductByCondition(productVO);
   }

   @Override
   public void registerHashtag(HashtagVO hastagvo) throws Exception {
      System.out.println("registerHashtag Call");
      productDAO.registerHashtag(hastagvo);
   }

   @Override
   public List<HashtagVO> getHashtag(String name) throws Exception {
      System.out.println("getHashtag Call");
      return productDAO.getHashtag(name);
   }

   @Override
   public List<ProductVO> searchProductByKeyword(String keyword) throws Exception {
      System.out.println("searchProductByKeyword");
      return productDAO.searchProductByKeyword(keyword);
   }

   @Override
   public List<HashtagVO> getHashtagByNo(int p_no) throws Exception {
      System.out.println("getHashtagByNo Call....");
      return productDAO.getHashtagByNo(p_no);
   }

   @Override
   public List<ProductVO> getAllProduct() throws Exception {
      System.out.println("getAllProduct call");
      return productDAO.getAllProduct();
   }

   @Override
   public List<ProductVO> getAllProductById(String id) throws Exception {
      System.out.println("getAllProductById Service call");
      return productDAO.getAllProductById(id);
   }



   @Override
   public List<HashtagVO> getHnoBySpace() throws Exception {
      // TODO Auto-generated method stub
      return productDAO.getHnoBySpace();
   }

   @Override
   public List<HashtagVO> getHnoByTech() throws Exception {
      // TODO Auto-generated method stub
      return productDAO.getHnoByTech();
   }

   @Override
   public void updateStarAverage(ProductVO productVO) throws Exception {
      System.out.println("updateStarAverage Service call");
      productDAO.updateStarAverage(productVO);
      
   }

   @Override
   public void updateGoodCount(int p_no) throws Exception {
      System.out.println("updateGoodCount Service call");
      productDAO.updateGoodCount(p_no);
   }

   @Override
   public void updateReviewCount(int p_no) throws Exception {
      System.out.println("updateReviewCount Service call");
      productDAO.updateReviewCount(p_no);
   }

@Override
public void plusGoodCount(int p_no) throws Exception {
	System.out.println("내아이디로 굿카운트 늘린다.");
	productDAO.plusGoodCount(p_no);
	
}

@Override
public void updateReviewCount(ProductVO productVO) throws Exception {
	productDAO.updateReviewCount(productVO);
	
}

}