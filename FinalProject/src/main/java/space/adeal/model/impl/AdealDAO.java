package space.adeal.model.impl;

import java.util.List;

import space.adeal.domain.AdealVO;
import space.auction.domain.AuctionVO;

public interface AdealDAO {
	public void getFinalBid()throws Exception;
	public void deletePastBid()throws Exception;
	public void plusPointByAuction(AuctionVO auctionVO)throws Exception;
	public void minusPointByAuction()throws Exception;
	List<AdealVO> getAdealList()throws Exception;
}
