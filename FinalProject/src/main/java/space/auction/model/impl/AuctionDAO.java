package space.auction.model.impl;

import java.util.List;

import space.auction.domain.AuctionTempVO;
import space.auction.domain.AuctionVO;
import space.bid.domain.BidVO;
import space.util.PagingBean;

public interface AuctionDAO {
	public void applyAuction(AuctionTempVO auctionTempVO) throws Exception;
	public String selectByNoForDate(int a_no) throws Exception;
	public void deleteAuction(String a_no) throws Exception;
	public void updateAuction(AuctionVO auctionVO) throws Exception;
	public void acceptAuction(AuctionVO auctionVO) throws Exception;
	public List<AuctionVO> getAllAuction(AuctionVO auctionVO) throws Exception;
	public AuctionVO getAuction(String a_no) throws Exception;
	public void updateBidCount(BidVO bidVO) throws Exception;
	public String getBidCount(BidVO bidVO) throws Exception;
	public int totalCount(String id) throws Exception;
	public List<AuctionVO> getOnSaleAuction() throws Exception;
	public List<AuctionVO> getAllAuctionNoPaging(AuctionVO auctionVO) throws Exception;
	public int totalCountMyBidAuction(String id) throws Exception;
}
