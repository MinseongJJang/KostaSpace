package space.bid.model.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.bid.domain.BidVO;
@Repository
public class BidDAOImpl implements BidDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void updateBidCount(BidVO vo) throws Exception {
		System.out.println("bidDAO.updateBidCount() 호출");
		sqlSession.update("bidMapper.updateBidCount",vo);
	}

	@Override
	public String getBidCount(BidVO vo) throws Exception {
		System.out.println("bidDAO.getBidCount() 호출");
		return sqlSession.selectOne("bidMapper.getBidCount", vo);
	}

	@Override
	public BidVO getBidInfo(String userid) throws Exception {
		System.out.println("bidDAO.getBidInfo() 호출");
		return sqlSession.selectOne("bidMapper.getBidInfo", userid);
	}

	@Override
	public void applyBidPoint(BidVO vo) throws Exception {
		System.out.println("bidDAO.applyBidPoint() 호출");
		sqlSession.insert("bidMapper.applyBidPoint",vo);
	}

}
