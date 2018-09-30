package space.auction.model.impl;

import java.util.List;

import space.auction.domain.AuctionTempVO;
import space.auction.domain.AuctionVO;
import space.bid.domain.BidVO;
import space.util.ListVO;
import space.util.PagingBean;

public interface AuctionService {
	public void applyAuction(AuctionTempVO auctionTempVO, String auctiontempa_no) throws Exception;
	public String selectByNoForDate(int a_no) throws Exception;
	public void deleteAuction(String a_no) throws Exception;
	public void updateAuction(AuctionVO auctionVO) throws Exception;
	public void acceptAuction(AuctionVO auctionVO) throws Exception;
	public ListVO getAllAuction(String id, String pageNo) throws Exception;
	public AuctionVO getAuction(String a_no) throws Exception;
	public void updateBidCount(BidVO bidVO) throws Exception;
	public String getBidCount(BidVO bidVO) throws Exception;
	public int totalCount(String id) throws Exception;
	public List<AuctionVO> getOnSaleAuction() throws Exception;
	void deleteFile(String newFile) throws Exception;
}
