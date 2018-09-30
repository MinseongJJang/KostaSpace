package space.product.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.hashtag.domain.HashtagVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;

@Repository
public class ProductDAOImpl implements ProductDAO  {
   
   @Autowired
   private SqlSession session;
   
   @Override
   public void registerProduct(ProductVO productVO) throws Exception {
      System.out.println("registerProduct Call....");
      session.insert("productMapper.registerProduct", productVO);
   }
   
   @Override
   public ProductVO getProductInfo(int p_no) throws Exception {
      System.out.println("getProductInfo Call....");
      return session.selectOne("productMapper.getProductInfo", p_no);
   }

   @Override
   public void updateProduct(ProductVO productVO) throws Exception {
      System.out.println("updateProduct Call....");
      session.update("productMapper.updateProduct", productVO);
   }

   @Override
   public void deleteProduct(int no) throws Exception {
      System.out.println("deleteProduct Call....");
      session.update("productMapper.deleteProduct",no);
   }

   @Override
   public List<HashtagVO> searchProductByHashtag(String keyword) throws Exception {
      System.out.println("searchProduct Call....");
      return session.selectList("productMapper.searchProductByHashtag",keyword);
   }
   @Override
   public List<ProductVO> searchProductByKeyword(String keyword) throws Exception {
      System.out.println("searchProduct Call....");
      return session.selectList("productMapper.searchProductByKeyword",keyword);
   }


   @Override
   public List<ProductVO> searchProductByCondition(ProductVO productVO) throws Exception {
      System.out.println("searchProductByCondition Call....");
      return session.selectList("productMapper.searchProductByCondition",productVO);
   }

   @Override
   public List<HashtagVO> getHashtag(String name) throws Exception {
      System.out.println("getHashtag Call....");
      return session.selectList("productMapper.getHashtag", name);
      
   }

   @Override
   public void registerHashtag(HashtagVO hashtagVO) throws Exception {
      System.out.println("registerHashtag Call....");
      session.insert("productMapper.registerHashtag",hashtagVO);
      
   }

   @Override
   public List<HashtagVO> getHashtagByNo(int p_no) throws Exception {
      System.out.println("getHashtagByNo Call....");
      return session.selectList("productMapper.getHashtagByNo",p_no);
   }

   @Override
   public List<ProductVO> getAllProduct() throws Exception {
      System.out.println("getAllProduct Call....");
      return session.selectList("productMapper.getAllProduct");
   }

   @Override
   public List<ProductVO> getAllProductById(String id) throws Exception {
      System.out.println("getAllProductById DAO Call....");
      return session.selectList("productMapper.getAllProductById", id);
   }

   

   @Override
   public List<HashtagVO> getHnoBySpace() throws Exception {
      // TODO Auto-generated method stub
      return session.selectList("productMapper.getHnoBySpace");
   }

   @Override
   public List<HashtagVO> getHnoByTech() throws Exception {
      
      return session.selectList("productMapper.getHnoByTech");
   }

   @Override
   public void updateStarAverage(ProductVO productVO) throws Exception {
      System.out.println("updateStarAverage DAO Call....");
      session.update("productMapper.updateStarAverage", productVO);
      
   }

   @Override
   public void updateGoodCount(int p_no) throws Exception {
      System.out.println("updateGoodCount DAO Call....");
      session.update("productMapper.updateGoodCount", p_no);
      
   }

   @Override
   public void updateReviewCount(int p_no) throws Exception {
      System.out.println("updateGoodCount DAO Call....");
      session.update("productMapper.updateGoodCount", p_no);
      
   }

@Override
public void plusGoodCount(int p_no) throws Exception {
	session.update("productMapper.plusGoodCount", p_no);
	
}

@Override
public void updateReviewCount(ProductVO productVO) throws Exception {
	session.update("productMapper.updateReviewCount", productVO);
	
}

}