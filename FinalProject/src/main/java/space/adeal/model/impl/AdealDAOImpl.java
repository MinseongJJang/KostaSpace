package space.adeal.model.impl;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.adeal.domain.AdealVO;
import space.auction.domain.AuctionVO;
@Repository
public class AdealDAOImpl implements AdealDAO{
	@Autowired
	private SqlSession session;
	@Override
	public void getFinalBid() throws Exception {
		System.out.println("getFinalBid Call..");
		System.out.println(session.selectOne("dealMapper.getFinalBid"));
		
	}

	@Override
	public void deletePastBid() throws Exception {
		System.out.println("deletePastBid Call....");
		System.out.println(session.delete("dealMapper.deletePastBid")+"delete Ok");
		
	}

	@Override
	public void plusPointByAuction(AuctionVO auctionVO) throws Exception {
		System.out.println("plusPointByAuction Call...");
		System.out.println(session.update("dealMapper.plusPointByAuction",auctionVO)+"row update ok");
		
	}

	@Override
	public void minusPointByAuction() throws Exception {
		System.out.println("minusPointByAuction Call");
		System.out.println(session.update("dealMapper.minusPointByAuction")+"row update OK");
		
	}

	@Override
	public List<AdealVO> getAdealList() throws Exception {
		System.out.println("getAdealList call");
		return session.selectList("dealMapper.getAdealList");
	}

	

	
}
