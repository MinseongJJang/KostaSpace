package space.auction.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.auction.domain.AuctionTempVO;
import space.util.ListTempVO;
import space.util.PagingBean;
@Repository
public class AuctionTempDAOImpl implements AuctionTempDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void applyAuctionTemp(AuctionTempVO vo) throws Exception {
		System.out.println("AuctionTempDAO.applyAuctionTemp() 호출");
		System.out.println(sqlSession.insert("auctionMapper.applyAuctionTemp",vo));
	}

	@Override
	public String selectByNoForDateTemp(int a_no) throws Exception {
		System.out.println("AuctionTempDAO.selectByNoForDate() 호출");
		return sqlSession.selectOne("auctionMapper.selectByNoForDateTemp", a_no);
	}

	@Override
	public List<AuctionTempVO> getAllAuctionTemp(PagingBean pagingbean) throws Exception {
		System.out.println("AuctionTempDAO.getAllAuctionTemp() 호출");
		return sqlSession.selectList("auctionMapper.getAllAuctionTemp", pagingbean);
	}

	@Override
	public void deleteAuctionTemp(int a_no) throws Exception {
		System.out.println("AuctionTempDAO.deleteAuctionTemp() 호출");
		System.out.println(sqlSession.delete("auctionMapper.deleteAuctionTemp", a_no));
	}

	@Override
	public AuctionTempVO getAuctiontemp(int a_no) throws Exception {
		System.out.println("AuctionTempDAO.getAuctiontemp() 호출");
		return sqlSession.selectOne("auctionMapper.getAuctiontemp", a_no);
	}

	@Override
	public int totalCountTemp() throws Exception {
		System.out.println("AuctionTempDAO.totalCountTemp() 호출");
		return sqlSession.selectOne("auctionMapper.totalCountTemp");
	}
/*
	@Override
	public List<AuctionTempVO> getMyApplyAuctionTempList(String id) throws Exception {
		System.out.println("AuctionTempDAO.getMyApplyAuctionTempList() 호출");
		return sqlSession.selectList("auctionMapper.getMyApplyAuctionTempList", id);
	}
	*/
	// 7월 13일 21시 13분부터 페이징처리 시작
	@Override
	public List<AuctionTempVO> getMyApplyAuctionTempList(AuctionTempVO auctionTempVO) throws Exception {
		System.out.println("AuctionTempDAO.getMyApplyAuctionTempList() 호출");
		return sqlSession.selectList("auctionMapper.getMyApplyAuctionTempList", auctionTempVO);
	}
	
	public void updateAuctionTemp(AuctionTempVO auctionTempVO) throws Exception {
		System.out.println("AuctionTempDAO.updateAuctionTemp() 호출");
		System.out.println(sqlSession.update("auctionMapper.updateAuctionTemp", auctionTempVO));
	}

	@Override
	public void deleteAllAuctionTemp() throws Exception {
		sqlSession.delete("auctionMapper.deleteAllAuctionTemp");
		
	}
	// 7월 13일 21시 13분부터 페이징처리 시작
	@Override
	public int totalCountMyApplyAuctionTemp(String id) throws Exception {
		System.out.println("AuctionTempDAO.totalCountMyApplyAuctionTemp() 호출");
		return sqlSession.selectOne("auctionMapper.totalCountMyApplyAuctionTemp", id);
	}
	
}
