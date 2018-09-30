package space.auction.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.auction.domain.AuctionTempVO;
import space.auction.domain.AuctionVO;
import space.bid.domain.BidVO;
import space.util.PagingBean;
@Repository
public class AuctionDAOImpl implements AuctionDAO{
	@Autowired
	private SqlSession session;
	
	@Override
	public void applyAuction(AuctionTempVO auctionTempVO) throws Exception {
		System.out.println("applyAuction Call....");
		session.insert("auctionMapper.applyAuction", auctionTempVO);
		
	}
	
	@Override
	public String selectByNoForDate(int a_no) throws Exception {
		System.out.println("selectByNoForDate Call....");
		return session.selectOne("auctionMapper.selectByNoForDate", a_no);
	}

	@Override
	public void deleteAuction(String a_no) throws Exception {
		System.out.println("deleteAuction Call....");
		session.delete("auctionMapper.deleteAuction", a_no);
		
	}

	@Override
	public void updateAuction(AuctionVO auctionVO) throws Exception {
		System.out.println("updateAuction Call");
		session.update("auctionMapper.updateAuction", auctionVO);
		
	}

	@Override
	public void acceptAuction(AuctionVO auctionVO) throws Exception {
		System.out.println("acceptAuction Call");
		session.update("auctionMapper.acceptAuction", auctionVO);
		
	}

	@Override
	public List<AuctionVO> getAllAuction(AuctionVO auctionVO) throws Exception {
		System.out.println("getAllAuction Call");
		return session.selectList("auctionMapper.getAllAuction", auctionVO);
	}

	@Override
	public AuctionVO getAuction(String a_no) throws Exception {
		System.out.println("getAuction Call");
		return session.selectOne("auctionMapper.getAuction",a_no);
	}

	@Override
	public void updateBidCount(BidVO bidVO) throws Exception {
		System.out.println("updateBidCount Call");
		session.update("auctionMapper.updateBidCount", bidVO);
	}

	@Override
	public String getBidCount(BidVO bidVO) throws Exception {
		System.out.println("getBidCount Call");
		return session.selectOne("auctionMapper.getBidCount", bidVO);
	}

	@Override
	public int totalCount(String id) throws Exception {
		
		return session.selectOne("auctionMapper.totalCount", id);
	}

	@Override
	public List<AuctionVO> getOnSaleAuction() throws Exception {
		System.out.println("getOnSaleAuction DAO CAll!!");
		return session.selectList("auctionMapper.getOnSaleAuction");
	}

	@Override
	public List<AuctionVO> getAllAuctionNoPaging(AuctionVO auctionVO) throws Exception {
		System.out.println("getAllAuctionNoPaging DAO CAll!!");
		return session.selectList("auctionMapper.getAllAuctionNoPaging", auctionVO);
	}

	@Override
	public int totalCountMyBidAuction(String id) throws Exception {
		return session.selectOne("auctionMapper.totalCountMyBidAuction", id);
	}


	
}
