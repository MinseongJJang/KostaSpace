package space.review.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.good.domain.GoodVO;
import space.review.domain.ReviewVO;
import space.util.PagingBean;
@Service
public class ReviewServiceImpl implements ReviewService{
   @Autowired
   private ReviewDAO reviewDAO;
   
   @Override
   public void addReview(ReviewVO reviewVO) throws Exception {
      System.out.println("reviewService.addReview() 호출");
      reviewDAO.addReview(reviewVO);
   }

   @Override
   public List<ReviewVO> getAllReview() throws Exception {
      System.out.println("reviewService.getAllReview() 호출");
      return reviewDAO.getAllReview();
   }

   @Override
   public void deleteReview(String id) throws Exception {
      System.out.println("reviewService.deleteReview() 호출");
      reviewDAO.deleteReview(id);
   }


   @Override
   public void updateReview(ReviewVO reviewVO) throws Exception {
      System.out.println("reviewService.updateReview() 호출");
      reviewDAO.updateReview(reviewVO);
   }

   @Override
   public ReviewVO getReview(int r_no) throws Exception {
      System.out.println("reviewService.getReview() 호출");
      return reviewDAO.getReview(r_no);
   }

   @Override
   public void registerGood(GoodVO goodVO) throws Exception {
      System.out.println("reviewService.registerGood() 호출");
      reviewDAO.registerGood(goodVO);
   }

   @Override
   public void updateGood(GoodVO goodVO) throws Exception {
      System.out.println("reviewService.updateGood() 호출");
      reviewDAO.updateGood(goodVO);
   }

   @Override
   public void updateNoGood(GoodVO goodVO) throws Exception {
      System.out.println("reviewService.updateNoGood() 호출");
      reviewDAO.updateNoGood(goodVO);
   }

   @Override
   public void updateGoodCount(ReviewVO reviewVO) throws Exception {
      System.out.println("reviewService.updateGoodCount() 호출");
      reviewDAO.updateGoodCount(reviewVO);
   }

   @Override
   public void GoodCountCancle(ReviewVO reviewVO) throws Exception {
      System.out.println("reviewService.GoodCountCancle() 호출");
      reviewDAO.GoodCountCancle(reviewVO);
   }

   @Override
   public ListVO getReviewByPno(ReviewVO reviewVO,String page) throws Exception {
	   if(page==null || page==""){
			page="1";
		}
	    PagingBean bean = new PagingBean(totalCount_getReviewByPno(reviewVO), Integer.parseInt(page));
	    reviewVO.setPb(bean);
	  ListVO vo = new ListVO(reviewDAO.getReviewByPno(reviewVO), reviewVO.getPb());
      return vo;
   }
   
	@Override
	public List<Double> getStarAverage() throws Exception {
		System.out.println("reviewService.getStarAverage() 호출");
		return reviewDAO.getStarAverage();
	}

	@Override
	public List<Integer> getPnoAverage() throws Exception {
		System.out.println("reviewService.getPnoAverage() 호출");
		return reviewDAO.getPnoAverage();
	}

	@Override
	public String checkGoodState(GoodVO goodVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.checkGoodState(goodVO);
	}

	@Override
	public GoodVO getGood(GoodVO goodVO) throws Exception {
		
		return reviewDAO.getGood(goodVO);
	}



	@Override
	public List<GoodVO> getAllGood(GoodVO goodVO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getAllGood(goodVO);
	}

	@Override
	public int totalCount_getReviewByPno(ReviewVO reviewVO) throws Exception {
		
		return reviewDAO.totalCount_getReviewByPno(reviewVO);
	}

	@Override
	public int reviewCount(int p_no) throws Exception {
		
		return reviewDAO.reviewCount(p_no);
	}

}