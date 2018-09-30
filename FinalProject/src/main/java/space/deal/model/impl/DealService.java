package space.deal.model.impl;

import java.util.List;

import space.adeal.domain.AdealVO;
import space.deal.domain.DealVO;
import space.spaceuser.domain.SpaceUserVO;

public interface DealService {
	void registerDeal(DealVO dealVO)throws Exception;
	void updateDealSstate(DealVO dealVO)throws Exception;
	void updateDealBstate(DealVO dealVO)throws Exception;
	void updateDealSuccess(String id)throws Exception;
	void plusPointByDeal(DealVO dealVO)throws Exception;
	void minusPointByDeal(DealVO dealVO)throws Exception;
	void insertFinalBid(String a_no)throws Exception;
	AdealVO getFinalBid(String a_no)throws Exception;
	void deletePastBid()throws Exception;
	/*void plusPointByAuction(AuctionVO auctionVO)throws Exception;
	void minusPointByAuction()throws Exception;*/
	ListVO getAllDealInfo(DealVO dealVO,String page)throws Exception;
	String getDealState(String id)throws Exception;
	DealVO getDealInfo(int no)throws Exception;
	List<DealVO> getDealInfoByResDate(DealVO dealVO)throws Exception;
	void deleteDeal(int d_no)throws Exception;
	int totalCount_getAllDealInfo(DealVO dealVO)throws Exception;
	
}
