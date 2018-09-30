package space.deal.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.adeal.domain.AdealVO;
import space.auction.domain.AuctionVO;
import space.deal.domain.DealVO;
import space.spaceuser.domain.SpaceUserVO;
@Repository
public class DealDAOImpl implements DealDAO{
	@Autowired
	private SqlSession session;
	@Override
	public void registerDeal(DealVO dealVO) throws Exception {
		session.insert("dealMapper.registerDeal", dealVO);
		
	}

	@Override
	public void updateDealSuccess(String id) throws Exception {
		session.update("dealMapper.updateDealSuccess", id);
		
	}

	@Override
	public void plusPointByDeal(DealVO dealVO) throws Exception {
		session.update("dealMapper.plusPointByDeal", dealVO);
		
	}

	@Override
	public void minusPointByDeal(DealVO dealVO) throws Exception {
		session.update("dealMapper.minusPointByDeal", dealVO);
		
	}

	
	@Override
	public void deletePastBid() throws Exception {
		session.delete("dealMapper.deletePastBid");
	}

/*	@Override
	public void plusPointByAuction(AuctionVO auctionVO) throws Exception {
		session.update("dealMapper.plusPointByAuction", auctionVO);
		
	}

	@Override
	public void minusPointByAuction() throws Exception {
		session.update("dealMapper.minusPointByAuction");
		
	}*/

	@Override
	public List<DealVO> getAllDealInfo(DealVO dealVO) throws Exception {
		System.out.println("dealinfo 리턴받는 거 :" + session.selectList("dealMapper.getAllDealInfo", dealVO));
		return session.selectList("dealMapper.getAllDealInfo", dealVO);
	}

	@Override
	public String getDealState(String id) throws Exception {
		
		return session.selectOne("dealMapper.getDealState", id);
	}

	@Override
	public DealVO getDealInfo(int no) throws Exception {
		return session.selectOne("dealMapper.getDealInfo", no);
	}

	@Override
	public void updateDealSstate(DealVO dealVO) throws Exception {
		session.update("dealMapper.updateDealSstate", dealVO);
		
	}

	@Override
	public void updateDealBstate(DealVO dealVO) throws Exception {
		session.update("dealMapper.updateDealBstate",dealVO);
		
		
	}

	@Override
	public void insertFinalBid(String a_no) throws Exception {
		session.insert("dealMapper.insertFinalBid", a_no);
		
	}

	@Override
	public AdealVO getFinalBid(String a_no) throws Exception {
		return session.selectOne("dealMapper.getFinalBid", a_no);
	}

	@Override
	public List<DealVO> getDealInfoByResDate(DealVO dealVO) throws Exception {
		
		return session.selectList("dealMapper.getDealInfoByResDate",dealVO);
	}

	@Override
	public void deleteDeal(int d_no) throws Exception {
		session.delete("dealMapper.deleteDeal", d_no);
		
		
	}
	public int totalCount_getAllDealInfo(DealVO dealVO) {
		System.out.println("count 리턴받는 거  : " +  session.selectOne("dealMapper.totalCount_getAllDealInfo",dealVO));
		return session.selectOne("dealMapper.totalCount_getAllDealInfo",dealVO);
	}
}
