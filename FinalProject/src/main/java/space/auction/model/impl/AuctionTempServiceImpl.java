package space.auction.model.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.auction.domain.AuctionTempVO;
import space.util.ListTempVO;
import space.util.PagingBean;
@Service
public class AuctionTempServiceImpl implements AuctionTempService{
	@Autowired
	private AuctionTempDAO auctionTempDAO; 
	
	@Override
	public void applyAuctionTemp(AuctionTempVO vo) throws Exception {
		System.out.println("AuctionTempService.applyAuctionTemp() 호출");
		auctionTempDAO.applyAuctionTemp(vo);
		
	}

	@Override
	public String selectByNoForDateTemp(int a_no) throws Exception {
		System.out.println("AuctionTempService.applyAuctionTemp() 호출");
		return auctionTempDAO.selectByNoForDateTemp(a_no);
	}

	@Override
	public ListTempVO getAllAuctionTemp(String pageNo) throws Exception {
		System.out.println("AuctionTempService.applyAuctionTemp() 호출");
		if(pageNo == null || pageNo == ""){
			pageNo = "1";//페이징 처리를 안했기 때문에 무조건 1페이지로 간다.
		}
		PagingBean bean = new PagingBean(totalCountTemp(),Integer.parseInt(pageNo));
		ListTempVO tempVO = new ListTempVO(auctionTempDAO.getAllAuctionTemp(bean),bean);
		return tempVO;
	}

	@Override
	public void deleteAuctionTemp(int a_no) throws Exception {
		System.out.println("AuctionTempService.applyAuctionTemp() 호출");
		auctionTempDAO.deleteAuctionTemp(a_no);
	}

	@Override
	public AuctionTempVO getAuctiontemp(int a_no) throws Exception {
		System.out.println("AuctionTempService.applyAuctionTemp() 호출");
		return auctionTempDAO.getAuctiontemp(a_no);
	}

	@Override
	public int totalCountTemp() throws Exception {
		System.out.println("AuctionTempService.totalCountTemp() 호출");
		return auctionTempDAO.totalCountTemp();
	}
	// 7월 13일 21시 13분부터 페이징처리 시작
	@Override
	public ListTempVO getMyApplyAuctionTempList(String id, String pageNo) throws Exception {
		System.out.println("AuctionTempService.getMyApplyAuctionTempList() 호출");
		if(pageNo == null || pageNo == ""){
			pageNo = "1";//페이징 처리를 안했기 때문에 무조건 1페이지로 간다.
		}
		PagingBean bean = new PagingBean(auctionTempDAO.totalCountMyApplyAuctionTemp(id),Integer.parseInt(pageNo));
		//ListTempVO tempVO = new ListTempVO(auctionTempDAO.getAllAuctionTemp(bean),bean);
		AuctionTempVO auctionTempVO = new AuctionTempVO();
		auctionTempVO.setId(id);
		auctionTempVO.setPb(bean);
		ListTempVO tempVO = new ListTempVO(auctionTempDAO.getMyApplyAuctionTempList(auctionTempVO), bean);
		return tempVO;
	}

	@Override
	public void updateAuctionTemp(AuctionTempVO auctionTempVO) throws Exception {
		System.out.println("AuctionTempService.updateAuctionTemp() 호출");
		auctionTempDAO.updateAuctionTemp(auctionTempVO);
	}

	@Override
	public void deleteAllAuctionTemp() throws Exception {
		auctionTempDAO.deleteAllAuctionTemp();
		
	}

	@Override
	public void deleteFile(String newFile) throws Exception {
		File f = new File(newFile);
		
		System.out.println(newFile+".. File Delete ok : "+f.delete());
		
	}

}
