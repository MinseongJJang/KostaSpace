package space.auction.model.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.adeal.domain.AdealVO;
import space.adeal.model.impl.AdealDAO;
import space.auction.domain.AuctionTempVO;
import space.auction.domain.AuctionVO;
import space.bid.domain.BidVO;
import space.util.ListVO;
import space.util.PagingBean;
@Service
public class AuctionServiceImpl implements AuctionService{
	@Autowired
	private AuctionDAO auctionDAO;
	@Autowired
	private AuctionTempDAO auctionTempDAO;
	/*
	// 안씀 삭제 요망 7월 13일 21시 24분
	@Autowired
	private AdealDAO adealDAO;
	*/
	@Override
	public void applyAuction(AuctionTempVO auctionTempVO, String auctiontempa_no) throws Exception {
		
		auctionDAO.applyAuction(auctionTempVO);
		System.out.println("2. auctionTempVO가 auctionVO로 들어감");
		auctionTempDAO.deleteAuctionTemp(Integer.parseInt(auctiontempa_no));
		System.out.println("3. auctionTempVO가 삭제됨");
	}
	
	@Override
	public String selectByNoForDate(int a_no) throws Exception {
		
		return auctionDAO.selectByNoForDate(a_no);
	}

	@Override
	public void deleteAuction(String a_no) throws Exception {
		
		auctionDAO.deleteAuction(a_no);
	}

	@Override
	public void updateAuction(AuctionVO auctionVO) throws Exception {
		
		auctionDAO.updateAuction(auctionVO);
	}

	@Override
	public void acceptAuction(AuctionVO auctionVO) throws Exception {
		
		auctionDAO.acceptAuction(auctionVO);
	}

	@Override
	public ListVO getAllAuction(String id, String pageNo) throws Exception {
		if(pageNo == null || pageNo == ""){
			pageNo = "1";
		}
		
		System.out.println(auctionDAO.totalCountMyBidAuction(id));
		PagingBean pb = new PagingBean(auctionDAO.totalCountMyBidAuction(id), Integer.parseInt(pageNo));
		AuctionVO avo = new AuctionVO();
		avo.setId(id);
		avo.setPb(pb);
		ListVO listVO = new ListVO(auctionDAO.getAllAuctionNoPaging(avo), avo.getPb());
		return listVO;
		
		/*
		System.out.println(totalCount(id));
		PagingBean pb = new PagingBean(totalCount(id), Integer.parseInt(pageNo));
		AuctionVO avo = new AuctionVO();
		avo.setId(id);
		avo.setPb(pb);
		ListVO listVO = new ListVO(auctionDAO.getAllAuction(avo), avo.getPb());
		return listVO;
		*/
	}

	@Override
	public AuctionVO getAuction(String a_no) throws Exception {
		
		return auctionDAO.getAuction(a_no);
	}

	@Override
	public void updateBidCount(BidVO bidVO) throws Exception {
		
		auctionDAO.updateBidCount(bidVO);;
	}

	@Override
	public String getBidCount(BidVO bidVO) throws Exception {
	
		return auctionDAO.getBidCount(bidVO);
	}

	@Override
	public int totalCount(String id) throws Exception {
		
		return auctionDAO.totalCount(id);
	}

	@Override
	public List<AuctionVO> getOnSaleAuction() throws Exception {
		System.out.println("getOnSaleAuction Service call!!!");
		List<AuctionVO> rlist = new ArrayList<AuctionVO>();
		for(AuctionVO vo : auctionDAO.getOnSaleAuction()){
			
			if(vo.getConfirm().equals("true")){
				System.out.println("getOnSaleAuction 조건문");
				rlist.add(vo);
			}
		}
		return rlist;
	}

	@Override
	public void deleteFile(String newFile) throws Exception {
		File f = new File(newFile);
		
		System.out.println(newFile+".. File Delete ok : "+f.delete());
	}


	

}
