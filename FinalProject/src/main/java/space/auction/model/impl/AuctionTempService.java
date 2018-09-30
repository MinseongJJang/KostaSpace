package space.auction.model.impl;

import java.util.List;

import space.auction.domain.AuctionTempVO;
import space.util.ListTempVO;
import space.util.PagingBean;

public interface AuctionTempService {
	void applyAuctionTemp(AuctionTempVO vo) throws Exception;
	String selectByNoForDateTemp(int a_no) throws Exception;
	ListTempVO getAllAuctionTemp(String pageNo) throws Exception;
	void deleteAuctionTemp(int a_no) throws Exception;
	AuctionTempVO getAuctiontemp(int a_no) throws Exception;
	int totalCountTemp() throws Exception;
	ListTempVO getMyApplyAuctionTempList(String id, String pageNo) throws Exception;
	void updateAuctionTemp(AuctionTempVO auctionTempVO) throws Exception;
	void deleteAllAuctionTemp() throws Exception;
	void deleteFile(String newFile) throws Exception;
}
