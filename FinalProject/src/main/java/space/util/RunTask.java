package space.util;

import java.util.List;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import space.adeal.domain.AdealVO;
import space.auction.domain.AuctionVO;
import space.auction.model.impl.AuctionService;
import space.auction.model.impl.AuctionTempService;
import space.bid.model.impl.BidService;
import space.deal.model.impl.DealService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;

public class RunTask extends TimerTask {
	private AuctionService auctionService;
	private AuctionTempService auctionTempService;
	private BidService bidService;
	private DealService dealService;
	private SpaceUserService spaceUserService;
	
	public RunTask() {
		super();
		System.out.println("1. RunTask  Constructor... ");
	}
	
	public RunTask(AuctionService auctionService, AuctionTempService auctionTempService, BidService bidService,
			DealService dealService, SpaceUserService spaceUserService) {
		System.out.println("1. 인자값 있는 생성자...^^");
		this.auctionService = auctionService;
		this.auctionTempService = auctionTempService;
		this.bidService = bidService;
		this.dealService = dealService;
		this.spaceUserService = spaceUserService;
	}

	@Override
	public void run(){
		try {
			System.out.println("2. run!!!!!!!!!!!!!");
			
			List<AuctionVO> list = auctionService.getOnSaleAuction();
			System.out.println(list);
			AuctionVO auctionVO = list.get(0);
			System.out.println(auctionVO);
			System.out.println(auctionVO.getA_no());
			String a_no = list.get(0).getA_no()+"";
			
			System.out.println("a_no" + a_no);
			dealService.insertFinalBid(a_no);	// deal에 거래내역 추가
			System.out.println("insertFinalBid "
					+ "::: ");
			AdealVO adealVO = dealService.getFinalBid(a_no);	// deal에서 구매자 아이디 가져오기
			String adealId = adealVO.getId();
			System.out.println("구매자 아이디 : " + adealId);
			String finalPrice = adealVO.getfPrice();
			System.out.println("getFinalBid 의 finalPrice  :::" + finalPrice);
			
			SpaceUserVO buyUser = spaceUserService.getUserInfo(adealId);	// 구매자 정보
			SpaceUserVO sellUser = spaceUserService.getUserInfo(list.get(0).getId());	// 판매자 정보
			System.out.println("판매자 아이디 ::  " + list.get(0).getId());
			
			
			System.out.println("구매자 포인트  :: " + buyUser.getPoint());
			buyUser.setPoint((Integer.parseInt(buyUser.getPoint()) - Integer.parseInt(finalPrice))+"");
			System.out.println("구매자 포인트 감소 :: " + buyUser.getPoint());
			
			System.out.println("판매자 포인트  :: " + sellUser.getPoint());
			sellUser.setPoint((Integer.parseInt(sellUser.getPoint()) + Integer.parseInt(finalPrice))+"");
			System.out.println("판매자 포인트 증가  :: " + sellUser.getPoint());
			
			spaceUserService.updateUser(buyUser);
			spaceUserService.updateUser(sellUser);
			
			//dealService.plusPointByAuction(auctionVO);
			//dealService.minusPointByAuction();
			
			auctionVO.setConfirm("false");
			auctionService.acceptAuction(auctionVO);
			
			dealService.deletePastBid();
			
			spaceUserService.upgradeUserGrade(adealId);//거래금액 충족시 회원등급 업그레이드
			/*
			SpaceUserVO vo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
			System.out.println("RUNTASK - 세션에 바인딩 ::: " + vo);
			SpaceUserVO svo=spaceUserService.getUserInfo(vo.getId());
			System.out.println("RUNTASK - 세션에 바인딩 ::: " + svo);
			request.setAttribute("spaceuservo", svo);
			*/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
