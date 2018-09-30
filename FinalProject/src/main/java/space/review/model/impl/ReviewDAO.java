package space.review.model.impl;

import java.util.List;

import space.good.domain.GoodVO;
import space.review.domain.ReviewVO;

public interface ReviewDAO {
   public void addReview(ReviewVO reviewVO)throws Exception;
   public List<ReviewVO> getAllReview() throws Exception;
   public void deleteReview(String id)throws Exception;
   public void updateReview(ReviewVO reviewVO)throws Exception;
   public ReviewVO getReview(int r_no)throws Exception;
   public void registerGood(GoodVO goodVO)throws Exception;
   public void updateGood(GoodVO goodVO)throws Exception;
   public void updateNoGood(GoodVO goodVO)throws Exception;
   public void updateGoodCount(ReviewVO reviewVO)throws Exception;
   public void GoodCountCancle(ReviewVO reviewVO)throws Exception;
   public List<ReviewVO> getReviewByPno(ReviewVO reviewVO)throws Exception;
   public List<Double> getStarAverage()throws Exception;
   public List<Integer> getPnoAverage()throws Exception;
   public String checkGoodState(GoodVO goodVO)throws Exception;
   public GoodVO getGood(GoodVO goodVO)throws Exception;
   public List<GoodVO> getAllGood(GoodVO goodVO)throws Exception;
   public int totalCount_getReviewByPno(ReviewVO reviewVO)throws Exception;
   public int reviewCount(int p_no)throws Exception;
}