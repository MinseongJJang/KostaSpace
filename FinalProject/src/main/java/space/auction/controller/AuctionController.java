package space.auction.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import space.adeal.domain.AdealVO;
import space.amenties.domain.AmenitiesVO;
import space.amenties.model.impl.AmentiesService;
import space.auction.domain.AuctionTempVO;
import space.auction.domain.AuctionVO;
import space.auction.model.impl.AuctionService;
import space.auction.model.impl.AuctionTempService;
import space.bid.domain.BidVO;
import space.bid.model.impl.BidService;
import space.deal.model.impl.DealService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;
import space.util.ListTempVO;
import space.util.ListVO;
import space.util.RunTask;

@Controller
public class AuctionController {
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private AuctionTempService auctionTempService;
	@Autowired
	private BidService bidService;
	@Autowired
	private DealService dealService;
	@Autowired
	private SpaceUserService spaceUserService;
	
	
	private String auctionPath
	= "C:\\finalProject\\eclipse\\workspace\\FinalProject\\src\\main\\webapp\\a.upload\\";
	private String crnPath
	= "C:\\finalProject\\eclipse\\workspace\\FinalProject\\src\\main\\webapp\\a.crn\\";
	
	@RequestMapping("applyAuction.do")
	public ModelAndView applyAuction(HttpServletRequest request, HttpServletResponse response,
			AuctionTempVO auctionTempVO) throws Exception {
		System.out.println("1. auctionTempVO 가져옴 :: " + auctionTempVO);

		auctionService.applyAuction(auctionTempVO, request.getParameter("a_no"));

		String enddate = auctionTempVO.getEnddate();
		System.out.println(enddate);
		String[] arr = enddate.split("-");
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		System.out.println(arr[2]);
		System.out.println(Integer.parseInt(arr[0]));
		System.out.println(Integer.parseInt(arr[1]));
		System.out.println(Integer.parseInt(arr[2]));

		Date end = new Date(Integer.parseInt(arr[0]) - 1900, Integer.parseInt(arr[1]) - 1,
				Integer.parseInt(arr[2]), 14, 00, 00);
		System.out.println("마감시각(Date end) : " + end);

		Date now = new Date();
		System.out.println("현재시각(Date now) : " + now);// 현재 시각

		long diff = end.getTime() - now.getTime();
		System.out.println("long diff :: end.getTime()-now.getTime() :: " + diff);
		long result = diff;
		System.out.println("long result diff :: " + (result));

		Timer timer = new Timer();
		// timer.schedule(new RunTask(), calendar, 1000*60);
		System.out.println("start...");
		timer.schedule(new RunTask(auctionService, auctionTempService, 
				bidService, dealService, spaceUserService),result);
		System.out.println(" 이제 네비게이션으로 ");
		// redirect 때는 viewResolver가 적용되지 않는다.
		return new ModelAndView("redirect:/getAllAuctionTemp.do");
	}

	@RequestMapping("endAuction.do")
	public ModelAndView endAuction(HttpServletRequest request, HttpServletResponse response)throws Exception {
		List<AuctionVO> list = auctionService.getOnSaleAuction();
		System.out.println(list);
		AuctionVO auctionVO = list.get(0);
		System.out.println(auctionVO);
		System.out.println(auctionVO.getA_no());
		String a_no = list.get(0).getA_no()+"";
		
		System.out.println("a_no" + a_no);
		dealService.insertFinalBid(a_no);	// deal에 거래내역 추가
		System.out.println("insertFinalBid ::: ");
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
		
		return new ModelAndView("auction/view/endAuctionTest");
	}
	
	@RequestMapping("checkOnSaleAuction.do")
	public ModelAndView checkOnSaleAuction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("checkOnSaleAuction.do 실행");
		List<AuctionVO> rlist = auctionService.getOnSaleAuction();
		PrintWriter out = response.getWriter();
		System.out.println("rlist.size() : " + rlist.size());
		out.print(rlist.size());
		return null;
	}
	// 7월 19일 수정
	@RequestMapping("getMyApplyAuctionTempList.do")
	public ModelAndView getMyApplyAuctionTempList(HttpServletRequest request, HttpServletResponse response, 
			AuctionVO auctionVO) throws Exception {
		SpaceUserVO vo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
		if(vo == null){
			return new ModelAndView("NewFile1");
		}
		System.out.println(vo.getId());
		System.out.println(auctionTempService.getMyApplyAuctionTempList(vo.getId(), request.getParameter("pageNo")));
		return new ModelAndView("auction/view/myApplyAuctionTempList", "listVO", 
				auctionTempService.getMyApplyAuctionTempList(vo.getId(), request.getParameter("pageNo")));
	}
	
	@RequestMapping("getAuction.do")
	public ModelAndView getAuction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("a_no 값 : "+request.getParameter("a_no"));
		AuctionVO vo=auctionService.getAuction(request.getParameter("a_no"));
		String price = vo.getPrice();
		System.out.println("컨트롤러에서 받은 price :: " + price);
		
		return new ModelAndView("JsonView", "price", price);
	}
	// 7월 19일 수정
	@RequestMapping("getAllMyAuction.do")
	public ModelAndView getAllMyAuction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getAllMyAuction controller 호출 ~~~~ ");
		SpaceUserVO vo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
		if(vo == null){
			return new ModelAndView("NewFile1");
		}
		// id에 해당하는 사람이 경매판매자로 나선것
		ListVO listVO = auctionService.getAllAuction(vo.getId(), request.getParameter("pageNo"));
		return new ModelAndView("auction/view/myAuctionList","listVO" , listVO);
		
	}
	
	@RequestMapping("getOnSaleAuction.do")
	public ModelAndView getOnSaleAuction(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getOnSaleAuction.do Controller call!!");
		List<AuctionVO> list = auctionService.getOnSaleAuction();
		
		if(request.getParameter("flag") != null){
			System.out.println("flag === " + request.getParameter("flag"));
			String enddate = "";
			if(list.size() != 0){
				enddate = list.get(0).getEnddate();
			}
			// 현재 진행중인 경매가 없다면 java.lang.IndexOutOfBoundsException: Index: 0, Size: 0 발생
			//return new ModelAndView("auction/view/indexAuction", "enddate", list.get(0).getEnddate());
			SpaceUserVO vo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
			System.out.println("session에 바인딩 된 id : " + vo.getId());
			SpaceUserVO svo = spaceUserService.getUserInfo(vo.getId());
			System.out.println("DB에서 가져온 id : " + svo.getId());
			request.getSession().setAttribute("spaceuservo", svo);
			return new ModelAndView("auction/view/indexAuction", "enddate", enddate);
		}else{
			return new ModelAndView("auction/view/bidAuction", "onSaleAuction", list);
		}
		
	}
	
	@RequestMapping("updateBidCount.do")
	public ModelAndView updateBidCount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("updateBidCount controller 호출");
		SpaceUserVO vo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
		System.out.println("spaceuservo :: " + vo);
		String id = vo.getId();	// session에서 로그인한 사용자의 id
		BidVO bid = bidService.getBidInfo(id);	// 입찰내역
		
		String bidprice = request.getParameter("price");	// 입찰가
		// 현재 진행중인 경매의 정보
		AuctionVO auctionVO = auctionService.getAuction(request.getParameter("a_no"));
		
		BidVO bidVO = new BidVO(id, bidprice);
		System.out.println("BidVO : " + bidVO);
		System.out.println("=================================================");
		
		System.out.println("현재 접속자(입찰자)의 point :: " + vo.getPoint());
		if(Integer.parseInt(vo.getPoint()) < Integer.parseInt(bidprice)){// 사용자의 보유 포인트와 입찰가를 비교
			System.out.println("보유 포인트가 부족합니다.");
			return new ModelAndView("updateBidModal");
		}
		
		if(Integer.parseInt(bidprice) <= Integer.parseInt(auctionVO.getPrice())){
			System.out.println("입찰가가 현재 경매가보다 낮음");
			return new ModelAndView("updateBidModal");
		}
		
		if (bid == null) {	// 현재 진행중인 경매에 사용자의 입찰이 처음일 경우(이때는 bid에 없다)
			// 현재 경매가보다 입찰가가 낮을때
			bidService.applyBidPoint(bidVO);
			
		} else{	// 2번째 부터 , bid에 사용자의 정보가 있는경우, 진행중인 경매에 입찰한 적이 있는 경우
			System.out.println(Integer.parseInt(bid.getPrice()) + "//////////////"+bid.getCount());
			System.out.println(Integer.parseInt(auctionVO.getPrice()));
			if(Integer.parseInt(bid.getCount()) == 0){	// 입찰 횟수를 전부 소모했을 경우
				System.out.println("bid.getCount()) == 0");
				return new ModelAndView("updateBidModal", "myBid", bid);
			}
			//Bid 가격 갱신, 카운트 차감
			auctionService.updateBidCount(bidVO);
			
		}
		System.out.println("!2312312312312312313123123123123123");
		//옥션 가격 입찰가로 업데이트
		auctionVO.setPrice(bidprice);
		auctionService.updateAuction(auctionVO);
		//최신 입찰내역을 바인딩해서 네비게이션
		BidVO bvo = bidService.getBidInfo(id);
		return new ModelAndView("updateBidModal", "myBid" , bvo);
	}
	
	@RequestMapping("getBidInfo.do")
	public ModelAndView getBidInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("!!!!!!!!");
		SpaceUserVO vo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
		System.out.println(vo);
		return new ModelAndView("myBidInfoModal", "myBid" , bidService.getBidInfo(vo.getId()));
	}
	
	
	/////////////////////////////////////////
	@RequestMapping("applyAuctionTemp.do")
	public ModelAndView applyAuctionTemp(HttpServletRequest request, HttpServletResponse response,
			AuctionTempVO auctionTempVO, AmenitiesVO amentiesVO)throws Exception{
		System.out.println("1 :: " + auctionTempVO);

		// 1. upload된 파일을 받아온다...리턴값 주의
		MultipartFile file = auctionTempVO.getUpload();
		MultipartFile afile = auctionTempVO.getAupload();

		System.out.println("파일의 사이즈 :: " + file.getName() + "=================" + file.isEmpty());
		System.out.println("파일의 사이즈 :: " + afile.getName() + "=================" + afile.isEmpty());

		// 2. 각각 파일의 이름, 사이즈를 리턴받고
		// 각각의 업로드한 파일들을 특정한 경로로 trasfer 시킴

		// crn 사진 웹에 저장하기
		if (file != null) {

			System.out.println("crn null이 아닐때 " + file.getName());
			String crnFileName = file.getOriginalFilename();// crn오리진네임 받기
			auctionTempVO.setOriginfilename(crnFileName);// crn오리진네임 옥션객체에 주입

			long crnFileSize = file.getSize();
			System.out.println("crnFileName : " + crnFileName + " | " + "crnFileSize : " + crnFileSize);

			String newCrnFileName = System.currentTimeMillis() + "_" + crnFileName;// crn새이름
																					// 받기
			auctionTempVO.setNewfilename(newCrnFileName);// crn새네임을 옥션객체에 주입

			file.transferTo(new File(crnPath + newCrnFileName));// 웹서버에 지정된 경로에 사진 저장
		}

		// 상품이미지 사진 웹에 저장하기
		if (afile != null) {
			System.out.println("image가 null아닐때 " + afile.getName());
			String auctionFileName = afile.getOriginalFilename();// 옥션네임 받기
			auctionTempVO.setAoriginfilename(auctionFileName);// 옥션사진네임 받아서 옥션객체에 주입

			long auctionFileSize = afile.getSize();
			System.out.println("auctionFileName : " + auctionFileName + " | " + "auctionFileSize : " + auctionFileSize);

			String newAuctionFileName = System.currentTimeMillis() + "_" + auctionFileName;// 옥션사진 새이름 받기
			auctionTempVO.setAnewfilename(newAuctionFileName);// 옥션사진 새이름 받아서 옥션객체에 주입

			afile.transferTo(new File(auctionPath + newAuctionFileName));// 웹서버에 지정된 경로에 사진 저장
		}

		auctionTempService.applyAuctionTemp(auctionTempVO);
		System.out.println("2 :: " + auctionTempVO);
		// redirect 때는 viewResolver가 적용되지 않는다.
		return new ModelAndView("redirect:/getOnSaleAuction.do","flag","index");
	}
	//
	@RequestMapping("updateAuctionTemp.do")
	public ModelAndView updateAuctionTemp(HttpServletRequest request, HttpServletResponse response,
			AuctionTempVO auctionTempVO)throws Exception{
		System.out.println("1 :: " + auctionTempVO);

		MultipartFile crn = auctionTempVO.getUpload();
		MultipartFile image = auctionTempVO.getAupload();

		System.out.println("MultipartFile crn : " + crn);
		System.out.println("MultipartFile image : " + image);

		// 1. upload된 파일을 받아온다...리턴값 주의
		if (crn != null) {

			System.out.println("crn이 null이 아니면 " + crn);
			String crnFileName = crn.getOriginalFilename();// crn오리진네임 받기
			auctionTempVO.setOriginfilename(crnFileName);// crn오리진네임 옥션객체에 주입
			System.out.println("***" + crnFileName + "***");

			long crnFileSize = crn.getSize();
			System.out.println("crnFileName : " + crnFileName + " | " + "crnFileSize : " + crnFileSize);
			if (crnFileName != "") {
				String newCrnFileName = System.currentTimeMillis() + "_" + crnFileName;// crn새이름 받기
				System.out.println("웹서버 저장 : " + newCrnFileName);
				auctionTempVO.setNewfilename(newCrnFileName);// crn새네임을 옥션객체에 주입
				crn.transferTo(new File(crnPath + newCrnFileName));// 웹서버에 지정된 경로에 사진 저장
			}
		}

		// 상품이미지 사진 웹에 저장하기
		if (image != null) {

			System.out.println("image가 null이 아니면 " + image);
			String auctionFileName = image.getOriginalFilename();// 옥션네임 받기
			auctionTempVO.setAoriginfilename(auctionFileName);// 옥션사진네임 받아서  옥션객체에 주입
			System.out.println("$$$" + auctionFileName + "$$$");

			long auctionFileSize = image.getSize();
			System.out.println("auctionFileName : " + auctionFileName + " | " + "auctionFileSize : " + auctionFileSize);

			if (auctionFileName != "") {
				String newAuctionFileName = System.currentTimeMillis() + "_" + auctionFileName;// 옥션사진 새이름 받기
				System.out.println("웹서버 저장 : " + newAuctionFileName);
				auctionTempVO.setAnewfilename(newAuctionFileName);// 옥션사진 새이름 받아서 옥션객체에 주입
				image.transferTo(new File(auctionPath + newAuctionFileName));// 웹서버에 지정된 경로에 사진 저장
			}
		}

		System.out.println("2 :: " + auctionTempVO);
		auctionTempService.updateAuctionTemp(auctionTempVO);

		// redirect 때는 viewResolver가 적용되지 않는다.
		return new ModelAndView("redirect:/getOnSaleAuction.do","flag","index");
	}
	
	@RequestMapping("deleteAuctionTemp.do")
	public ModelAndView deleteAuctionTemp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		AuctionTempVO vo=auctionTempService.getAuctiontemp(Integer.parseInt(request.getParameter("a_no")));
		
		if(vo.getNewfilename()!=null){
			auctionTempService.deleteFile(crnPath+vo.getNewfilename());
		}
		
		if(vo.getAnewfilename()!=null){
			auctionTempService.deleteFile(auctionPath+vo.getAnewfilename());
		}
		
		auctionTempService.deleteAuctionTemp(Integer.parseInt(request.getParameter("a_no")));
		return new ModelAndView("redirect:/getAllAuctionTemp.do");
	}
	@RequestMapping("deleteAllAuctionTemp.do")
	public ModelAndView deleteAllAuctionTemp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		auctionTempService.deleteAllAuctionTemp();
		return new ModelAndView("redirect:/getAllAuctionTemp.do");
	}
	
	@RequestMapping("getAllAuctionTemp.do")
	public ModelAndView getAllAuctionTemp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ListTempVO list = (ListTempVO) auctionTempService.getAllAuctionTemp(request.getParameter("pageNo"));
		return new ModelAndView("auction/view/auctionTempList", "listVO", list);
	}
	// 7월 19일 수정
	@RequestMapping("getAuctiontemp.do")
	public ModelAndView getAuctiontemp(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(auctionTempService.getAuctiontemp(Integer.parseInt(request.getParameter("a_no"))));
		AuctionTempVO auctiontemp = auctionTempService.getAuctiontemp(Integer.parseInt(request.getParameter("a_no")));
		
		SpaceUserVO vo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
		
		if(vo == null){
			return new ModelAndView("NewFile1");
		}
		
		if(!vo.getId().equals("admin") && vo.getId() != null){
			return new ModelAndView("auction/view/updateApplyAuctionTemp", "auctiontemp", auctiontemp);
		}
		
		return new ModelAndView("auction/view/auctionTempView", "auctiontemp", auctiontemp);
	}
	
	@RequestMapping("crnDownload.do")
	public ModelAndView crnDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap map = new HashMap();
		map.put("path", crnPath);
		return new ModelAndView("downloadView", map);
	}

	@RequestMapping("fileDelete.do")
	public ModelAndView fileDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("fileDelete 컨트롤러");
		String abd = request.getParameter("newfilename");
		System.out.println(abd);
		String[] abc = abd.split(",");
		System.out.println(abc);
		String newfilename = abc[0];
		String a_no = abc[1];

		System.out.println("fileDelete.do호출 newfilename : " + newfilename);
		System.out.println("fileDelete.do호출  a_no : " + a_no);

		AuctionTempVO vo = auctionTempService.getAuctiontemp(Integer.parseInt(a_no));
		System.out.println("AuctionTempVO에서 originfilename 지우기 : " + vo);

		if (newfilename != null) { // crn 파일이 있다면
			auctionTempService.deleteFile(crnPath + newfilename);
			vo.setOriginfilename(null);
			vo.setNewfilename(null);
			System.out.println("crn파일 null로 업데이트하기: " + vo);
			auctionTempService.updateAuctionTemp(vo);
		}

		return new ModelAndView("deleteFile");
	}

	@RequestMapping("aFileDelete.do")
	public ModelAndView afileDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("aFileDelete 컨트롤러");
		String abd = request.getParameter("anewfilename");
		System.out.println(abd);
		String[] abc = abd.split(",");
		System.out.println(abc);
		String anewfilename = abc[0];
		String a_no = abc[1];

		System.out.println("fileDelete.do호출 anewfilename : " + anewfilename);
		System.out.println("fileDelete.do호출  a_no : " + a_no);
		AuctionTempVO vo = auctionTempService.getAuctiontemp(Integer.parseInt(a_no));
		System.out.println("AuctionTempVO에서 aoriginfilename 지우기 : " + vo);

		if (anewfilename != null) { // img 파일이 있다면
			auctionTempService.deleteFile(auctionPath + anewfilename);
			vo.setAoriginfilename(null);
			vo.setAnewfilename(null);

			System.out.println("img파일 null로 업데이트하기: " + vo);
			auctionTempService.updateAuctionTemp(vo);
		}
		return new ModelAndView("aDeleteFile");
	}

}
