package space.product.model.impl;

import java.util.List;

import space.hashtag.domain.HashtagVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;

public interface ProductDAO {
   public void registerProduct(ProductVO productVO)throws Exception;
   public ProductVO getProductInfo(int p_no)throws Exception;
   public void updateProduct(ProductVO productVO)throws Exception;
   public void deleteProduct(int no)throws Exception;
   public List<HashtagVO> searchProductByHashtag(String keyword)throws Exception;
   public List<ProductVO> searchProductByKeyword(String keyword)throws Exception;
   public List<ProductVO> searchProductByCondition(ProductVO productVO)throws Exception;
   public void registerHashtag(HashtagVO hastagvo)throws Exception;
   public List<HashtagVO> getHashtag(String name)throws Exception;
   public List<HashtagVO> getHashtagByNo(int p_no)throws Exception;
   public List<ProductVO> getAllProduct()throws Exception;
   public List<ProductVO> getAllProductById(String id)throws Exception;
   public List<HashtagVO> getHnoBySpace()throws Exception;
   public List<HashtagVO> getHnoByTech()throws Exception;
   public void updateStarAverage(ProductVO productVO)throws Exception;
   public void updateGoodCount(int p_no)throws Exception;
   public void updateReviewCount(int p_no)throws Exception;
   public void plusGoodCount(int p_no)throws Exception;
   public void updateReviewCount(ProductVO productVO)throws Exception;
}