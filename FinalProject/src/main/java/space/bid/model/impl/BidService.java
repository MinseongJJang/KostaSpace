package space.bid.model.impl;

import space.bid.domain.BidVO;

public interface BidService {
	void updateBidCount(BidVO vo)throws Exception;
	String getBidCount(BidVO vo)throws Exception;
	BidVO getBidInfo(String userid)throws Exception;
	void applyBidPoint(BidVO vo)throws Exception;
}
