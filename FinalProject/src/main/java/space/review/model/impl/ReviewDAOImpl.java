package space.review.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.good.domain.GoodVO;
import space.review.domain.ReviewVO;
@Repository
public class ReviewDAOImpl implements ReviewDAO{
   @Autowired
   private SqlSession session;
   
   @Override // review 등록
   public void addReview(ReviewVO reviewVO) throws Exception {
      System.out.println("addReview Call...");
      System.out.println(session.insert("reviewMapper.addReview",reviewVO)+"row insert ok!");
      
   }

   @Override // 전체 리뷰qnffjdhrl
   public List<ReviewVO> getAllReview() throws Exception {
      System.out.println("getAllReview Call..");
      return session.selectList("reviewMapper.getAllReview");
   }

   @Override
   public void deleteReview(String id) throws Exception {
      System.out.println("deleteReview Call..");
      System.out.println(session.delete("reviewMapper.deleteReview", id));
      
   }

   @Override
   public void updateReview(ReviewVO reviewVO) throws Exception {
      System.out.println("updateReview Call");
      System.out.println(session.update("reviewMapper.updateReview", reviewVO)+"row update ok");
   }

   @Override
   public ReviewVO getReview(int r_no) throws Exception {
      System.out.println("getReview Call..");
      return session.selectOne("reviewMapper.getReview", r_no);
   }

   @Override
   public void registerGood(GoodVO goodVO) throws Exception {
      System.out.println("registerGood call");
      System.out.println(session.insert("goodMapper.registerGood", goodVO));
      
   }

   @Override
   public void updateGood(GoodVO goodVO) throws Exception {
      System.out.println("updateGood call");
      System.out.println(session.update("goodMapper.updateGood", goodVO));
   }

   @Override
   public void updateNoGood(GoodVO goodVO) throws Exception {
      System.out.println("updateGood call");
      System.out.println(session.update("goodMapper.updateNoGood", goodVO));
   }

   @Override
   public void updateGoodCount(ReviewVO reviewVO) throws Exception {
      System.out.println("updateGoodCount Call");
      System.out.println(session.update("reviewMapper.updateGoodCount", reviewVO));
      
   }

   @Override
   public void GoodCountCancle(ReviewVO reviewVO) throws Exception {
       System.out.println("goodCountCancle Call");
      System.out.println(session.update("reviewMapper.goodCountCancle", reviewVO));
      
   }

   @Override
   public List<ReviewVO> getReviewByPno(ReviewVO reviewVO) throws Exception {
      System.out.println("해당 상품넘버의 리뷰다가져오는거야 : " + session.selectList("reviewMapper.getReviewByPno", reviewVO));
	  return session.selectList("reviewMapper.getReviewByPno", reviewVO);
   }
   
	@Override
	public List<Double> getStarAverage() throws Exception {
		System.out.println("getStarAverage DAO Call");
		return session.selectList("reviewMapper.getStarAverage");
	}

	@Override
	public List<Integer> getPnoAverage() throws Exception {
		System.out.println("getPnoAverage DAO Call");
		return session.selectList("reviewMapper.getPnoAverage");
	}

	@Override
	public String checkGoodState(GoodVO goodVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("goodMapper.checkGoodState", goodVO);
	}

	

	@Override
	public GoodVO getGood(GoodVO goodVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("goodMapper.getGood",goodVO);
	}

	@Override
	public List<GoodVO> getAllGood(GoodVO goodVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("goodMapper.getAllGood",goodVO);
	}

	

	@Override
	public int totalCount_getReviewByPno(ReviewVO reviewVO) throws Exception {
		System.out.println(reviewVO.getP_no());
		System.out.println("리뷰 카운터 가져오는거야 : " + session.selectOne("reviewMapper.totalCount_getReviewByPno", reviewVO));
		return session.selectOne("reviewMapper.totalCount_getReviewByPno", reviewVO);
	}

	@Override
	public int reviewCount(int p_no) throws Exception {
		
		return session.selectOne("reviewMapper.reviewCount", p_no);
	}

}