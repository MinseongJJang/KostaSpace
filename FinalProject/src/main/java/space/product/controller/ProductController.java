package space.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import space.amenties.domain.AmenitiesVO;
import space.amenties.model.impl.AmentiesService;
import space.deal.domain.DealVO;
import space.deal.model.impl.DealService;
import space.deal.model.impl.ListVO;
import space.good.domain.GoodVO;
import space.hashtag.domain.HashtagVO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.product.model.impl.ProductService;
import space.review.domain.ReviewVO;
import space.review.model.impl.ReviewService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;


@Controller
public class ProductController {
   
   @Autowired
   private ProductService productService;
   @Autowired
   private ReviewService reviewService;
   @Autowired
   private DealService dealService;
   @Autowired
   private SpaceUserService spaceuserService;
   @Autowired
   private AmentiesService amentiesService;
   
   private String path1 = "C:\\finalProject\\eclipse\\workspace\\FinalProject\\src\\main\\webapp\\p.upload\\";
   private String path2 = "C:\\finalProject\\eclipse\\workspace\\FinalProject\\src\\main\\webapp\\r.upload\\";
   
   @RequestMapping("registerSpace.do")
   public ModelAndView registerSpace(HttpServletRequest request,HttpServletResponse response,ProductVO productVO,HashtagVO hashtagVO,AmenitiesVO amenitiesVO) throws Exception{
      String category = request.getParameter("category");
      String licence = request.getParameter("licence");
      String sTime= request.getParameter("sTime");
      String eTime = request.getParameter("eTime");
      String hashtag = request.getParameter("hashtag");
      String area = request.getParameter("area");
      String location = request.getParameter("location");
      String type = request.getParameter("type");
      String amenitiesC = request.getParameter("amenitiesC");
      System.out.println("amenitiesC : " + amenitiesC);
      System.out.println("type :: " + type);
      System.out.println("hashtag :: "+hashtag);
      productVO.setHashtag(hashtag);
      System.out.println(productVO.getHashtag());
      productVO.setArea(area);
      productVO.setLocation(location);
      System.out.println(area);
      System.out.println(location);
      System.out.println(sTime);
      System.out.println(eTime);
      
      String[] area2 = area.split(" ");
      System.out.println(area2[1]);
      SpaceUserVO svo = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
      
         if(svo==null){ //로그인 상태가 아니다
            return new ModelAndView("redirect+:/home.jsp");         
         }
      
      System.out.println(category);
      productVO.setCategory(category);
      productVO.setCrn(licence);
      productVO.setId(svo.getId());
      productVO.setsTime(sTime);
      productVO.seteTime(eTime);
      productVO.setArea2(area2[1]);
      //대표이미지
      MultipartFile mFile=productVO.getUpload();
      System.out.println(mFile.getSize()+"============"+mFile.isEmpty());
      if(mFile.isEmpty()==false){//파일 업로드 했다
         String fileName = mFile.getOriginalFilename();
         productVO.setOriginfilename(fileName);
         
         String newFileName = System.currentTimeMillis()+"_"+fileName;
         productVO.setNewfilename(newFileName);
         System.out.println("newFilename  ::" + newFileName);
         File copyFile = new File(path1+newFileName);
         mFile.transferTo(copyFile);
      }
      
      //상세이미지
      List<MultipartFile> mFiles = productVO.getUploads();
      for(int i=0; i<mFiles.size(); i++){
    	  System.out.println("상세이미지 갯수 :: "+"============"+mFiles.size());
    	  System.out.println((mFiles.get(i)).getSize()+"============"+mFiles.isEmpty());
    	  System.out.println("mfiles :::::::::::::"+mFiles.get(i).getOriginalFilename());
      }
      String fileName1 ="";
      String fileName = "";
      String newFileName = "";
      String newFileName2 = "";
      if(mFiles.isEmpty()==false){//파일 업로드 했다
    	  for(int i=0; i<mFiles.size(); i++){
    		  fileName  = mFiles.get(i).getOriginalFilename();
    		  System.out.println("첫번째 상세 이미지 :: " + fileName);
    		  
    		  productVO.setOriginfilenames(fileName);
    		  fileName1 +=fileName+",";
    		  System.out.println("getOriginfilenames :::::::::::::::: "+productVO.getOriginfilenames());
    		  newFileName = System.currentTimeMillis()+"_"+fileName;
    		  System.out.println("newfilename :: "+newFileName);
    		  productVO.setNewfilenames(newFileName);
    		  newFileName2 += newFileName+",";
    		  System.out.println();
    		  System.out.println("setter에 바인딩 후  :: "+productVO.getNewfilenames());
    		  File copyFile = new File(path1+newFileName);
    		  mFiles.get(i).transferTo(copyFile);
    	  }//for
    	  productVO.setOriginfilenames(fileName1);
    	  productVO.setNewfilenames(newFileName2);
    	  
      }//if

      System.out.println(productVO.getHashtagVO());
      productService.registerProduct(productVO);
      
      String[] hashtagList = hashtag.split(",");
      System.out.println(hashtagList.length);
      System.out.println(hashtagList);
      //헤쉬태그 추가되는 부분
      for(int i=0; i<hashtagList.length; i++){
         
         System.out.println(hashtagList[i]);
         hashtagVO.setH_name(hashtagList[i].toString());
         hashtagVO.setP_no(productVO.getP_no());
         hashtagVO.setType(type);
         productService.registerHashtag(hashtagVO);
      }
      System.out.println("asdjksdhfjksdhfgsdhfgdfhghdfjkgdfjkghdflgdfklgjdfklgjdfklgjdfklgjdfklgjldfgjdfklgjdfklgjkldfjgkldfjgs");
      //amenitiesC 추가되는 부분
      amenitiesVO.setP_no(productVO.getP_no());
      amenitiesVO.setAmenities(amenitiesC);
      amentiesService.registerAmenitiesProduct(amenitiesVO);
      System.out.println(productVO.getP_no());
      System.out.println(productVO.getHashtag());
      return new ModelAndView("product/view/registerProduct_ok");
   }
   

   @RequestMapping("getAmentiesByPNo.do")
   public ModelAndView getAmentiesByPNo(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   int p_no = Integer.parseInt(request.getParameter("pNo"));
	   AmenitiesVO avo = amentiesService.getAmentiesByPNo(p_no);
	   //뷰단에서 amenties에 필드값이 0일경우에는 지원안함, 1일 경우에는 지원함을 구분지어줘야한다.
	   return new ModelAndView("","",avo);
   }
   @RequestMapping("updateAmenties.do")
   public ModelAndView updateAmenties(HttpServletRequest request, HttpServletResponse response, AmenitiesVO amentiesVO)throws Exception{
	   int p_no = Integer.parseInt(request.getParameter("pNo"));
	   amentiesVO.setP_no(p_no);
	  amentiesService.updateAmenitiesProduct(amentiesVO);
	  
	   return new ModelAndView("redirect:/getAmentiesByPNo.do");
   }
   
   @RequestMapping("getAllProduct.do")
   public ModelAndView getAllProduct(HttpServletRequest request,HttpServletResponse response) throws Exception{
	   //가져온 rlist 와 plist 의 p_no값이 맞으면 새로운 리스트에 담는다.
	   List<ProductVO> avgList = new ArrayList<ProductVO>();
	   List<Double> starList = reviewService.getStarAverage();
	   List<Integer> pNoList = reviewService.getPnoAverage();
	   SpaceUserVO spaceuservo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
	   ProductVO productVO = new ProductVO();
	   if(spaceuservo != null){
	   
	   spaceuservo = spaceuserService.getUserInfo(spaceuservo.getId());
	   request.getSession().setAttribute("spaceuservo", spaceuservo);
	   }
	   //staravg를 업데이트하는게 여기서 수행
	   for(int i=0; i<starList.size(); i++){
		   productVO.setStaravg(starList.get(i));
		   productVO.setP_no(pNoList.get(i));
		 
		   productService.updateStarAverage(productVO);
	   }
	   //평점순으로 상품 불러옴
	   List<Integer> recentPNoList = reviewService.getPnoAverage();
	   for(int i=0; i<pNoList.size(); i++){
		  
		  avgList.add(productService.getProductInfo(recentPNoList.get(i)));
	   }
	   //전체 상품 불러옴
	   System.out.println("getAllProduct controller call");
	   List<ProductVO> plist = productService.getAllProduct();
	   for(ProductVO p : plist){
		   int reviewCount = reviewService.reviewCount(p.getP_no());
		   p.setReviewcount(""+reviewCount);
		   productService.updateReviewCount(p);
	   }
	   List<HashtagVO> hslist = productService.getHnoBySpace();
	   List<HashtagVO> htlist = productService.getHnoByTech();
	   System.out.println(hslist);
	   Collections.shuffle(hslist);
	   Collections.shuffle(htlist);

	
	   request.setAttribute("htlist", htlist);
	   request.setAttribute("hslist", hslist);
	   
	  
	   request.setAttribute("avgList", avgList);
	  
	   return new ModelAndView("index", "plist", plist);
   }

   @RequestMapping("getProduct.do")
   public ModelAndView getProduct(HttpServletRequest request, HttpServletResponse response,ReviewVO reviewVO)throws Exception{
      int p_no = Integer.parseInt(request.getParameter("no"));   
      String page = request.getParameter("page");
      System.out.println(p_no);
      ProductVO productvo = productService.getProductInfo(p_no);
      List<HashtagVO> hlist = productService.getHashtagByNo(p_no);
      
      String file = productvo.getNewfilenames();
      System.out.println(file);
      String[] files = file.split(",");
      for(int i=0;i<files.length;i++){
    	  System.out.println(files[i]);
      }
      reviewVO.setP_no(p_no);
      
      space.review.model.impl.ListVO rlist = reviewService.getReviewByPno(reviewVO, page);
      AmenitiesVO amenitiesVO = amentiesService.getAmentiesByPNo(p_no);
      SpaceUserVO spaceuserVO = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
      GoodVO goodVO = new GoodVO();
      if(spaceuserVO != null){
    	  goodVO.setP_no(p_no);
          goodVO.setId(spaceuserVO.getId());
      }
      String[] gId = {"",""};
      List<GoodVO> glist = reviewService.getAllGood(goodVO);
      System.out.println("glist다다다너ㅏ론어ㅏ론아라ㅣㄴㅇ린ㅇ러ㅏㅣㄴㅇㄹ " + glist);
      if(glist.size()!=0){
    	  gId[0] = glist.get(0).getId();
    	  gId[1] = spaceuserVO.getId();
    	  System.out.println(gId);
      }
      
      System.out.println(rlist);
     
      System.out.println("타입 시발년아 : " + productvo.getType());
      String[] amenities ={};
      if(productvo.getType().equals("공간")){
    	  amenities = amenitiesVO.getAmenities().split(",");
    	  request.setAttribute("amenities", amenities);
      System.out.println(amenitiesVO);
      }else {
    	  
    	  request.setAttribute("amenities", "없음");
      }
      request.setAttribute("gId", gId);
      
      request.setAttribute("files", files);
      request.setAttribute("rlist", rlist);
      request.setAttribute("hlist", hlist);
      System.out.println("가져온 p_no::::::::::::"+productvo.getP_no());
      System.out.println("productvo=========================="
      		+ "========="+productvo.getNewfilename());
      System.out.println(productvo.getContent());
      String[] content = productvo.getContent().split("\n");
      for(int i = 0 ; i< content.length; i++){
    	  System.out.println(content[i]);
      }
      
      request.setAttribute("content", content);
      return new ModelAndView("product/view/productView","productvo",productvo);
      
      
   }
   @RequestMapping("searchProductByHashtag.do")
   public ModelAndView searchProductByHashtag(HttpServletRequest request, HttpServletResponse response)throws Exception{
      String hash = request.getParameter("hash");
      if(hash.startsWith("#")){
         List<HashtagVO> hlist =productService.searchProductByHashtag(hash);
         System.out.println(hlist.size());
         ArrayList<ProductVO> plist = new ArrayList<ProductVO>();
         for(int i = 0 ; i<hlist.size(); i++){
            int no =hlist.get(i).getP_no();
            ProductVO pvo = productService.getProductInfo(no);
            System.out.println(pvo);
            plist.add(pvo);
            System.out.println(plist.get(i).getTitle());
            }
         request.setAttribute("rplist", plist);
         return new ModelAndView("product/view/sbcProductList","hlist",hlist);
      }else{
         List<ProductVO> plist =   productService.searchProductByKeyword(hash);
         return new ModelAndView("product/view/searchok","plist",plist);
         
      }
   }
   
   @RequestMapping("registerReview.do")
   public ModelAndView registerReview(HttpServletRequest request, HttpServletResponse response,ReviewVO reviewVO)throws Exception{
      String review = request.getParameter("review");
      String average = request.getParameter("average");
      String p_no = request.getParameter("no");
      SpaceUserVO spaceuserVO = (SpaceUserVO) request.getSession().getAttribute("spaceuservo");
      reviewVO.setContent(review);
      reviewVO.setId(spaceuserVO.getId());
      reviewVO.setAverage(average);
      reviewVO.setP_no(Integer.parseInt(p_no));

      
      reviewService.addReview(reviewVO);
      
      
      
      return new ModelAndView("redirect:/getProduct.do","no",p_no);
      
   }
   
   @RequestMapping("getProduct2.do")
   public ModelAndView getProduct2(HttpServletRequest request, HttpServletResponse response,ReviewVO reviewVO)throws Exception{

      String p_no = request.getParameter("p_no");
      String page = request.getParameter("page");
      System.out.println(p_no);
      ProductVO productvo = productService.getProductInfo(Integer.parseInt(p_no));
      
      List<HashtagVO> hlist = productService.getHashtagByNo(Integer.parseInt(p_no));
      space.review.model.impl.ListVO rlist = reviewService.getReviewByPno(reviewVO,page);
      request.setAttribute("rlist", rlist);
      request.setAttribute("hlist", hlist);
      return new ModelAndView("product/view/productView","productvo",productvo);
   }
   
   @RequestMapping("getAllProductById.do")
   public ModelAndView getAllProductById(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
	   System.out.println("getAllProductById Controller Call");
	   String id = ((SpaceUserVO)session.getAttribute("spaceuservo")).getId();
	   List<ProductVO> plist = productService.getAllProductById(id);
	   return new ModelAndView("product/view/myProductList","plist",plist);
   }
   
   @RequestMapping("deleteProduct.do")
   public ModelAndView deleteProduct(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   SpaceUserVO spaceuserVO = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
	   int no = Integer.parseInt(request.getParameter("no"));
	   System.out.println(no);
	   productService.deleteProduct(no);
	   List<ProductVO> plist = productService.getAllProductById(spaceuserVO.getId());
	   return new ModelAndView("product/view/myProductList","plist",plist);
   }
   
   @RequestMapping("reserveProduct.do")
   public ModelAndView reserveProduct(HttpServletRequest request, HttpServletResponse response,HttpSession session,DealVO dealVO)throws Exception{
      String resDate = request.getParameter("date");
      System.out.println(resDate);
      String sTime = request.getParameter("sTime");
      System.out.println(sTime);
      String eTime = request.getParameter("eTime");
      String resTime = sTime+"~"+eTime;
      SpaceUserVO spaceuserVO = (SpaceUserVO)session.getAttribute("spaceuservo");
      System.out.println(spaceuserVO);
      SpaceUserVO user = spaceuserService.getUserInfo(spaceuserVO.getId());
      System.out.println(user);
      int no = Integer.parseInt(request.getParameter("no"));
      String title = request.getParameter("title");
      String price = request.getParameter("price");
      //가격계산 추가 2017.07.05 김정식
      System.out.println("상품 가격 : "+price);
      int sTimeInt = Integer.parseInt(sTime.substring(0,2));
      int eTimeInt = Integer.parseInt(eTime.substring(0,2));
      System.out.println("이용 시작시간 : "+sTimeInt+", 끝나는 시간 : "+eTimeInt);
      int timePrice = eTimeInt - sTimeInt;
      System.out.println("예약한 시간 값 : "+timePrice);
      int priceResult = Integer.parseInt(price)*timePrice;
      System.out.println("상품 가격 x 예약한 시간 : "+Integer.toString(priceResult));
      //
      String area = request.getParameter("area");
      ProductVO productVO = productService.getProductInfo(no);
      System.out.println(productVO);
      String sId = productVO.getId();
      String bId = user.getId();
      
      dealVO.setsId(sId);
      dealVO.setbId(bId);
      dealVO.setP_no(no);
      dealVO.setPrice(Integer.toString(priceResult));
      dealVO.setResDate(resDate);
      dealVO.setResTime(resTime);
      dealVO.setbTel(user.getTel());
      dealVO.setsTel(productVO.getTel());
      dealVO.setTitle(title);
      dealVO.setArea(area);
      dealService.registerDeal(dealVO);
      System.out.println("dealVO INFO :: " +dealVO);
      System.out.println("deal 테이블에 등록 ok");
      
      DealVO deal = dealService.getDealInfo(dealVO.getD_no());
      System.out.println("deal에 관한 내용 가져온다.");
      System.out.println("특정 deal에 대한 INFO ::" + deal);
      System.out.println("해당 상품에 대한 IMG : " + productVO.getNewfilename());
      request.getSession().getServletContext().setAttribute("pvo", productVO);
      request.getSession().getServletContext().setAttribute("deal", deal);
      return new ModelAndView("redirect:deal/view/deal.jsp","deal",deal);
   }
   
   @RequestMapping("reserveOk.do")
   public ModelAndView reserveOk(HttpServletRequest request, HttpServletResponse response)throws Exception{

	   String bstate = request.getParameter("bstate");
	   System.out.println(bstate);
	   String sstate = request.getParameter("sstate");
	   System.out.println(sstate);
	   
	  
	   int no = Integer.parseInt(request.getParameter("dNo"));
	   System.out.println(no);
	   DealVO rdealVO = dealService.getDealInfo(no);
	   System.out.println(rdealVO); 
	   if(bstate.equals("1")){
		   System.out.println("bstate 업데이트");
		   dealService.updateDealBstate(rdealVO);
		   DealVO rdealVO1 = dealService.getDealInfo(no);
		   System.out.println(rdealVO1);
		  
	   }else if(sstate.equals("1")){
		   System.out.println("sstate 업데이트");
		   dealService.updateDealSstate(rdealVO);
		   DealVO rdealVO2 = dealService.getDealInfo(no);
		   System.out.println(rdealVO2);
		   
	   }
	   DealVO rdealVO3 = dealService.getDealInfo(no);
	   System.out.println(rdealVO3);
		   if(rdealVO3.getsState().equals("1") && rdealVO3.getbState().equals("1")){
			   dealService.updateDealSuccess(rdealVO3.getsId());
			   dealService.updateDealSuccess(rdealVO3.getbId());
			   SpaceUserVO spaceuserVO1 = spaceuserService.getUserInfo(rdealVO3.getsId());
			   SpaceUserVO spaceuserVO2 = spaceuserService.getUserInfo(rdealVO3.getbId());
			   
			   dealService.plusPointByDeal(rdealVO3);
			   dealService.minusPointByDeal(rdealVO3);
			   
			   //거래 확정시에 포인트 유동이 되면서 거래내역이 생성된다.
			   PointHistoryVO phvoP = new PointHistoryVO();
			   PointHistoryVO phvoM = new PointHistoryVO();
			   phvoP.setId(rdealVO3.getsId());//포인트쌓일놈
			   phvoM.setId(rdealVO3.getbId());//포인트깍일놈
			   phvoP.setKind("");
			   phvoM.setKind("");
			   phvoP.setCategory("판매");phvoM.setCategory("구매");
			   phvoP.setTurnover("+"+rdealVO3.getPrice());
			   phvoM.setTurnover("-"+rdealVO3.getPrice());
			   
			   spaceuserService.regiseterPointHistory(phvoP);
			   spaceuserService.regiseterPointHistory(phvoM);
			   System.out.println("포인트거래내역 생성");
			   System.out.println("포인트 왔다갔다 완료 ");
			   
			   
			   if(Integer.parseInt(rdealVO3.getPrice()) >= 50000){
			   spaceuserService.upgradeUserGrade(spaceuserVO1.getId());
			   spaceuserService.upgradeUserGrade(spaceuserVO2.getId());
			   }
			   if(rdealVO3.getsId().equals(spaceuserVO1.getId())){
				  
				   SpaceUserVO spaceuservo = spaceuserService.getUserInfo(rdealVO3.getsId());
				   
				   request.getSession().setAttribute("spaceuservo", spaceuservo);
				   
				  
			   }
		   }
	   return new ModelAndView("deal/view/reserveOk","rdealVO", rdealVO);
	   
   }
   
   @RequestMapping("finalReserve.do")
   public ModelAndView finalReserve(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   int no = Integer.parseInt(request.getParameter("no"));
	   DealVO deal = dealService.getDealInfo(no);
	   return new ModelAndView("deal/view/deal","deal",deal);
   }

   @RequestMapping("getAllDealInfo.do")
   public ModelAndView getAllDealInfo(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   String pageNo = request.getParameter("pageNo");
	   SpaceUserVO spaceuserVO = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
	   String id = spaceuserVO.getId();
	   DealVO dealVO = new DealVO();
	   dealVO.setbId(id);
	   dealVO.setsId(id);
	   ListVO vo = dealService.getAllDealInfo(dealVO,pageNo);
	   System.out.println("ListVO로 찍는거다 : " + vo);
	   return new ModelAndView("deal/view/dealList","dlist",vo);
   }
   
   @RequestMapping("getDealInfo.do")
   public ModelAndView getDealInfo(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   int no = Integer.parseInt(request.getParameter("no"));
	   DealVO deal = dealService.getDealInfo(no);
	   return new ModelAndView("deal/view/deal","deal",deal);
   }
   
   @RequestMapping("r.do")
   public ModelAndView r(HttpServletRequest request, HttpServletResponse response)throws Exception{
      int p_no = Integer.parseInt(request.getParameter("pNo"));
      System.out.println(p_no);
      ProductVO pvo =productService.getProductInfo(p_no);//해당 상품에 대한 정보
      System.out.println(pvo);
      int pstime = Integer.parseInt(pvo.getsTime().substring(0,2));//판매자가 제시한 시작 시간
      int petime = Integer.parseInt(pvo.geteTime().substring(0,2));//판매자가 제시한 종료 시간
      System.out.println(pstime + " " + petime);
      ArrayList<String> rtimeS = new ArrayList<String>();// 판매자가지정한 예약가능한 시작시간      
      ArrayList<String> rtimeE = new ArrayList<String>();//예약 가능한 종료시간
      ArrayList<String> f = new ArrayList<String>();//예약 가능한 시작시간 ~ 예약 가능한 종료시간 을 리스트로 만든것
      for(int i=pstime;i<=petime-1;i++){
         if(i>=0&&i<10){
            rtimeS.add("0"+i+":00");
         }else{
         rtimeS.add(i+":00");
         }
         
      }
      System.out.println(rtimeS+"판매자가 제시한 시작시간입니다.");
      for(int i=pstime+1;i<=petime;i++){
         if(i>=0&&i<10){
            rtimeE.add("0"+i+":00");
         }else{
            rtimeE.add(i+":00");
         }
      }
      System.out.println(rtimeE+"판매자가 제시한 종료시간입니다.");
      for(int i=0;i<rtimeS.size();i++){
         f.add(rtimeS.get(i)+"~"+rtimeE.get(i));
        
      }
      System.out.println(f+"판매자가 제시한 시간 1시간단위 묶음");
      DealVO dvo = new DealVO();
      String resDate = request.getParameter("resDate");//예약자가 원하는 날짜
      System.out.println(resDate);
      //String resTimeS = request.getParameter("resTimeS");//예약자가 원하는 시작시간
     // String resTimeE = request.getParameter("resTimeE");//예약자가 원하는 종료시간
      //String restime = resTimeS+"~"+resTimeE;
      dvo.setP_no(p_no);dvo.setResDate(resDate);//쿼리조건 세팅
      List<DealVO> dlist = dealService.getDealInfoByResDate(dvo);//예약자가 원하는 날짜에 존재하는 모든 거래내역
      System.out.println(dlist+"예약되어있는 항목들입니다.");
   
      if(dlist.isEmpty()){//예약 날짜에 대한 정보가 없다면 f를 리턴
         ArrayList<ArrayList<String>> f1 = new ArrayList<ArrayList<String>>();
         f1.add(rtimeS);
         f1.add(rtimeE);
         System.out.println(f1+"예약없는 날짜에 예약가능한 시간 목록입니다.");
         return new ModelAndView("rtimeView","f",f1);
        
      }else if(!dlist.isEmpty()){
       System.out.println(dlist.size());
        ArrayList<ArrayList<String>> f1 = new ArrayList<ArrayList<String>>();
         for(int i=0;i<dlist.size();i++){
            int a = Integer.parseInt(dlist.get(i).getResTime().substring(6,8));
           
            int b = Integer.parseInt(dlist.get(i).getResTime().substring(0,2));
            int c= a-b;
            System.out.println(a+"::예약된 종료시간"+b+"::예약되어있는 시작시간");
            
            if(c==1){
               System.out.println("11??");
               System.out.println(rtimeS.remove(rtimeS.indexOf(dlist.get(i).getResTime().substring(0,5)))+"지워진시작시간");
               System.out.println(rtimeE.remove(rtimeE.indexOf(dlist.get(i).getResTime().substring(6)))+"지워진종료시간");
               f1.add(rtimeS);
               f1.add(rtimeE);
                
               System.out.println(f+"Aaaaaaaaaa");
               
               
              
            }else if(c>=2){//int k=rtimeS.indexOf(rdtimes.get(i));k<k+a-b;k++
               int q = rtimeS.indexOf(dlist.get(i).getResTime().substring(0,5));
               int w = rtimeS.indexOf(dlist.get(i).getResTime().substring(6));
               for(int k=q;k<w;k++){
                  rtimeS.remove(q);
                  rtimeE.remove(q);
                   f1.add(rtimeS);
                     f1.add(rtimeE);
                    
               }
               //q = 예약되어있는 시작시간을 포함한 판매자가 제시한 해당 시작시간리스트 인덱스번호
               //w 는 예약되어있는 종료시간을 포함한 판메자가 제시한 해당 판매시간리스트의 인덱스번호

               
            }
            
            
         }
         return new ModelAndView("rtimeView","f",f1); 
      }
          return new ModelAndView();
   }

   @RequestMapping("updateGoodCount.do")
   public ModelAndView updateGoodCount(HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
	   String id = ((SpaceUserVO)session.getAttribute("spaceuservo")).getId();
	   int p_no = Integer.parseInt(request.getParameter("pNo"));
	   int r_no = Integer.parseInt(request.getParameter("rNo"));
	   GoodVO goodVO = new GoodVO();
	   goodVO.setId(id);goodVO.setP_no(p_no);goodVO.setR_no(r_no);
	   ReviewVO reviewVO = new ReviewVO();
	   reviewVO.setId(id);reviewVO.setP_no(p_no);reviewVO.setR_no(r_no);
	   String result = reviewService.checkGoodState(goodVO);
	   if(result.equals("0")){
		   reviewService.updateGood(goodVO);
		   reviewService.updateGoodCount(reviewVO);
	   }else if(result.equals("1")){
		   reviewService.updateNoGood(goodVO);
		   reviewService.GoodCountCancle(reviewVO);
	   }
	   ReviewVO rvo = reviewService.getReview(r_no);
	
	   
	   return new ModelAndView("","rvo",rvo);
   }
   @RequestMapping("searchProductByCondition.do")
   public ModelAndView sarchProductByCondition(HttpServletRequest request, HttpServletResponse response,ProductVO productVO)throws Exception{
 
     String accomodation =request.getParameter("accomodation");
     String type = request.getParameter("type");
     System.out.println(type+"타입!!!!!!!!");
     String area = request.getParameter("area");
     productVO.setAccomodation(accomodation);productVO.setType(type);productVO.setArea(area);
     System.out.println(productVO.getAccomodation() + productVO.getType() + productVO.getArea() +"ddddd");
      List<ProductVO> rplist = productService.searchProductByCondition(productVO);
      System.out.println(rplist+"이거야이거");
      return new ModelAndView("product/view/sbcProductList","rplist",rplist);
   }
   
   @RequestMapping("registerGood.do")
   public ModelAndView registerGood(HttpServletRequest request, HttpServletResponse response,GoodVO goodVO)throws Exception{
	   int p_no = Integer.parseInt(request.getParameter("pno"));
	   int r_no = Integer.parseInt(request.getParameter("rno"));
	   SpaceUserVO spaceuserVO = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
	   String id = spaceuserVO.getId();
	   System.out.println("p_no : " + p_no );
	   System.out.println("r_no : " + r_no );
	   System.out.println("id : " + id );
	   goodVO.setId(id);
	   goodVO.setP_no(p_no);
	   goodVO.setR_no(r_no);
	   goodVO.setGoodState("1");
	   //List<GoodVO> glist = reviewService.getGood(goodVO);
	   
	   reviewService.registerGood(goodVO);
	   
	   
	   return new ModelAndView();
   }
   
   @RequestMapping("plusGoodCount.do")
   public ModelAndView plusGoodCount(HttpServletRequest request, HttpServletResponse response,GoodVO goodVO)throws Exception{
	   System.out.println("넘어와라");
	   int p_no = Integer.parseInt(request.getParameter("p_no"));
	   SpaceUserVO spaceuservo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
	   goodVO.setId(spaceuservo.getId());
	   goodVO.setP_no(p_no);
	   
	   reviewService.registerGood(goodVO);
	
	   goodVO = reviewService.getGood(goodVO);
	   
	   productService.plusGoodCount(p_no);
	   
	   ProductVO product = productService.getProductInfo(p_no);
	   String count = product.getGoodcount();
	   String uid = goodVO.getId();
	   String id = spaceuservo.getId();
	   ArrayList<String> list = new ArrayList<String>();
	   list.add(count);
	   list.add(uid);
	   list.add(id);
	   return new ModelAndView("goodView","list",list);
   }
   @RequestMapping("AdminDeleteProduct.do")
   public ModelAndView AdminDeleteProduct(HttpServletRequest request, HttpServletResponse response)throws Exception{
      System.out.println("AdminDeleteProduct Controller call");
      String pNo = request.getParameter("pNo");
      productService.deleteProduct(Integer.parseInt(pNo));
      return new ModelAndView("redirect:/getAllComplain.do?pageNo=1");
   }
 
}