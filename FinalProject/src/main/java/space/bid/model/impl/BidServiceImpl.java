package space.bid.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.bid.domain.BidVO;
@Service
public class BidServiceImpl implements BidService{
	@Autowired
	private BidDAO bidDAO;
	@Override
	public void updateBidCount(BidVO vo) throws Exception {
		System.out.println("bidService.updateBidCount() 호출");
		bidDAO.updateBidCount(vo);
	}

	@Override
	public String getBidCount(BidVO vo) throws Exception {
		System.out.println("bidService.getBidCount() 호출");
		return bidDAO.getBidCount(vo);
	}

	@Override
	public BidVO getBidInfo(String userid) throws Exception {
		System.out.println("bidService.getBidInfo() 호출");
		return bidDAO.getBidInfo(userid);
	}

	@Override
	public void applyBidPoint(BidVO vo) throws Exception {
		System.out.println("bidService.applyBidPoint() 호출");
		bidDAO.applyBidPoint(vo);
	}

}
