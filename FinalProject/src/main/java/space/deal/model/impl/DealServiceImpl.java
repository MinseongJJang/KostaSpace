package space.deal.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.adeal.domain.AdealVO;
import space.auction.domain.AuctionVO;
import space.deal.domain.DealVO;
import space.spaceuser.domain.SpaceUserVO;
import space.util.PagingBean;
@Service
public class DealServiceImpl implements DealService{
	@Autowired
	private DealDAO dealDAO;
	
	@Override
	public void registerDeal(DealVO dealVO) throws Exception {
		dealDAO.registerDeal(dealVO);
	}


	@Override
	public void updateDealSuccess(String id) throws Exception {
		dealDAO.updateDealSuccess(id);
		
	}

	@Override
	public void plusPointByDeal(DealVO dealVO) throws Exception {
		dealDAO.plusPointByDeal(dealVO);
		
	}

	@Override
	public void minusPointByDeal(DealVO dealVO) throws Exception {
		dealDAO.minusPointByDeal(dealVO);
		
	}



	@Override
	public void deletePastBid() throws Exception {
		dealDAO.deletePastBid();
		
	}

/*	@Override
	public void plusPointByAuction(AuctionVO auctionVO) throws Exception {
		dealDAO.plusPointByAuction(auctionVO);
		
	}

	@Override
	public void minusPointByAuction() throws Exception {
		dealDAO.minusPointByAuction();
		
	}*/
	@Override
	public ListVO getAllDealInfo(DealVO dealVO,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
	    PagingBean bean = new PagingBean(totalCount_getAllDealInfo(dealVO), Integer.parseInt(page));
	    dealVO.setPb(bean);
	    ListVO vo = new ListVO(dealDAO.getAllDealInfo(dealVO), dealVO.getPb());
	    System.out.println("vo 찍는건데 어자피 안나올거같다 : " + vo);
		return vo;
	}




	@Override
	public String getDealState(String id) throws Exception {
		return dealDAO.getDealState(id);
	}

	@Override
	public DealVO getDealInfo(int no) throws Exception {	
		return dealDAO.getDealInfo(no);
	}


	@Override
	public void updateDealSstate(DealVO dealVO) throws Exception {
		dealDAO.updateDealSstate(dealVO);
		
	}


	@Override
	public void updateDealBstate(DealVO dealVO) throws Exception {
		dealDAO.updateDealBstate(dealVO);
		
	}


	@Override
	public void insertFinalBid(String a_no) throws Exception {
		dealDAO.insertFinalBid(a_no);
	}

	@Override
	public AdealVO getFinalBid(String a_no) throws Exception {
		return dealDAO.getFinalBid(a_no);
	}


	@Override
	public List<DealVO> getDealInfoByResDate(DealVO dealVO) throws Exception {
		
		return dealDAO.getDealInfoByResDate(dealVO);
	}


	@Override
	public void deleteDeal(int d_no) throws Exception {
		dealDAO.deleteDeal(d_no);
		System.out.println("delete Deal Call");
		
	}


	@Override
	public int totalCount_getAllDealInfo(DealVO dealVO) throws Exception {
		
		return dealDAO.totalCount_getAllDealInfo(dealVO);
	}


	


	
}
