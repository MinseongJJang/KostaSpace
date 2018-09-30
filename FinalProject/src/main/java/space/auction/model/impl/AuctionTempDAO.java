package space.auction.model.impl;

import java.util.List;

import space.auction.domain.AuctionTempVO;
import space.util.ListTempVO;
import space.util.PagingBean;

public interface AuctionTempDAO {
	void applyAuctionTemp(AuctionTempVO vo) throws Exception;
	String selectByNoForDateTemp(int a_no) throws Exception;
	List<AuctionTempVO> getAllAuctionTemp(PagingBean pagingbean) throws Exception;
	void deleteAuctionTemp(int a_no) throws Exception;
	AuctionTempVO getAuctiontemp(int a_no) throws Exception;
	int totalCountTemp() throws Exception;
	//List<AuctionTempVO> getMyApplyAuctionTempList(String id) throws Exception;
	// 7월 13일 21시 13분부터 페이징처리 시작
	List<AuctionTempVO> getMyApplyAuctionTempList(AuctionTempVO auctionTempVO) throws Exception;
	void updateAuctionTemp(AuctionTempVO auctionTempVO) throws Exception;
	void deleteAllAuctionTemp() throws Exception;
	int totalCountMyApplyAuctionTemp(String id) throws Exception;
}
