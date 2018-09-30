package space.spaceuser.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import space.hashtag.domain.HashtagVO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.product.model.impl.ProductService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;

@Controller
public class SpaceUserController {
	@Autowired
	private SpaceUserService spaceUserService;
	@Autowired
	private ProductService productService;
   
   //회원가입,, 회원가입과 동시에 pointhistory가 생성되야 한다.
   @RequestMapping("registerUser.do")
   public ModelAndView registerUser(HttpServletRequest request, HttpServletResponse response, SpaceUserVO spaceUserVO)
         throws Exception {
      System.out.println("registerUser controllor call");
      String ad1 = request.getParameter("address1");
      String ad2= request.getParameter("address2");
      String address = ad1+" "+ad2;
      spaceUserVO.setAddress(address);
      spaceUserService.registerUser(spaceUserVO);
      PointHistoryVO phvo = new PointHistoryVO();
      phvo.setId(spaceUserVO.getId());
      spaceUserService.regiseterPointHistory(phvo);
      System.out.println("가입 단계에서 PointHistory생성 완료!!");
      return new ModelAndView("home");
   }
   //아이디체크 .. 회원가입시 아이디체크
   @RequestMapping("idCheck.do")//ajax나 jquery로 추가...
   public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response)throws Exception{
      String id =  request.getParameter("id");
      int result = spaceUserService.idCheck(id);
      return new ModelAndView("idCheckResultView","result",result);
     
   }
   //로그인 유저...
   @RequestMapping("loginUser.do")
   public ModelAndView loginUser(HttpServletRequest request, HttpServletResponse response, HttpSession session,SpaceUserVO vo)
         throws Exception {
      System.out.println("login controllor call");
      SpaceUserVO spaceuservo = spaceUserService.loginUser(vo);
      if(spaceuservo==null){
         return new ModelAndView("loginfail");
      }
      session.setAttribute("spaceuservo", spaceuservo);
      return new ModelAndView("home","spaceuservo",spaceuservo);
   }
   //로그아웃 유저....
   @RequestMapping("logout.do")
   public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
         throws Exception {
      if (session.getAttribute("spaceuservo") != null)
         session.invalidate();
      System.out.println("logout ok!!!");
      return new ModelAndView("home");
   }
   
   //유저정보 불러오기
   @RequestMapping("getUserInfo.do")
   public ModelAndView getUserInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
      System.out.println("getUserInfo controllor call");
      String id = request.getParameter("id");
      SpaceUserVO user=(SpaceUserVO) request.getSession().getAttribute("spaceuservo");
      //관리자 로그인시
      if(user.getId().equals("admin")){
    	  System.out.println("admin 로그인 : getUserInfo 특정회원 검색");
    	  String findUser=request.getParameter("findUser");
    	  System.out.println(findUser);
    	  SpaceUserVO uservo = spaceUserService.getUserInfo(findUser); 
    	return new ModelAndView("user/view/findUser", "uservo", uservo);
      }
      SpaceUserVO spaceuservo = spaceUserService.getUserInfo(id);
      return new ModelAndView("user/view/updateSpaceUser", "spaceuservo", spaceuservo);
   }
   //유저 정보 수정하기
   @RequestMapping("updateUser.do")
   public ModelAndView updateUser(HttpServletRequest request, HttpServletResponse response, SpaceUserVO vo)
         throws Exception {
      System.out.println("updateUser controllor call");
      if(request.getParameter("address2")!=null){
    	
    	  vo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
    	  vo.setAddress(request.getParameter("address1")+" "+request.getParameter("address2"));
    	  vo = spaceUserService.getUserInfo(vo.getId());
    	  System.out.println("회원수정할때 vo 정보 :" +vo);
    	  spaceUserService.updateUser(vo);
          request.getSession().setAttribute("spaceuservo", vo);
          return new ModelAndView("user/view/updateSpaceUser_ok");
      }
      
      vo = (SpaceUserVO)request.getSession().getAttribute("spaceuservo");
      vo = spaceUserService.getUserInfo(vo.getId());
      spaceUserService.updateUser(vo);
      request.getSession().setAttribute("spaceuservo", vo);
      return new ModelAndView("user/view/updateSpaceUser_ok");
   }
   //특정 회원 모든 포인트 거래내역 보기
   @RequestMapping("getAllPointHistoryById.do")
   public ModelAndView getAllPointHistoryById(HttpServletRequest request, HttpServletResponse response) throws Exception{
      System.out.println("getAllPointHistoryById 특정회원 모든 포인트 거래내역 보기");
      SpaceUserVO spaceuservo=(SpaceUserVO)request.getSession().getAttribute("spaceuservo");
      String id = spaceuservo.getId();
      List<PointHistoryVO> phlist = spaceUserService.getAllPointHistoryById(id);
      System.out.println("phlist :: "+phlist);
      return new ModelAndView("user/view/showPH", "phlist", phlist);
   }
   //회원 탈퇴하기
   @RequestMapping("deleteUser.do")
   public ModelAndView deleteUser(HttpServletRequest request, HttpServletResponse response)throws Exception{
      System.out.println("deleteUser Call  탈퇴하기...");
      SpaceUserVO spaceuservo =(SpaceUserVO)request.getSession().getAttribute("spaceuservo");
      //관리자 로그인시
      if(spaceuservo.getId().equals("admin")){
    	  System.out.println("deleteByAdmin");
    	 String deleteId=request.getParameter("id");
    	 	SpaceUserVO deleteUser = spaceUserService.getUserInfo(deleteId); // 삭제할 대상 유저객체
    	 	spaceUserService.deleteUser(deleteUser);
    	return new ModelAndView("user/view/findUser");
      }
      spaceUserService.deleteUser(spaceuservo);
      request.getSession().invalidate();
      
      return new ModelAndView("home");
   }
   
   
   //아이디 찾기
	@RequestMapping("findId.do")
	public ModelAndView findId(HttpServletRequest request, HttpServletResponse response)throws Exception{
		System.out.println("findId Call....");
		String tel = request.getParameter("tel");
		String id = spaceUserService.findId(tel);
		System.out.println("찾아온 id: "+id);
		return new ModelAndView("idResultView","id",id);
	}
   
	//비밀번호 찾기
	@RequestMapping("findPassword.do")
	public ModelAndView findPassword(HttpServletRequest request, HttpServletResponse response)throws Exception{
		System.out.println("findPassword Call....");
		String id= request.getParameter("id");
		String name=request.getParameter("name");
		SpaceUserVO spaceuserVO = new SpaceUserVO();
		spaceuserVO.setId(id);spaceuserVO.setName(name);
		String password = spaceUserService.findPassword(spaceuserVO);
		System.out.println(password);
		return new ModelAndView("passResultView","password",password);
	}

	
   @RequestMapping("getAllPointHistory.do")//관리자 페이지에서 모든 포인트 거래내역을 볼때...
   public ModelAndView getAllPointHistory(HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
      System.out.println("getAllPointHistory Controller Call.. 관리자가 모든 거래내역 볼때");
      List<PointHistoryVO> phlist =spaceUserService.getAllPointHistory();
      return new ModelAndView();
   }
   @RequestMapping("registerPointHistory.do")
   public ModelAndView registerPointHistory(HttpServletRequest request, HttpServletResponse response,HttpSession session ,PointHistoryVO phVO) throws Exception{
         SpaceUserVO spaceuserVO = (SpaceUserVO)session.getAttribute("spaceuservo");
         phVO.setId(spaceuserVO.getId());
         String point = request.getParameter("point");
         phVO.setTurnover(point);
      phVO.setCategory(request.getParameter("category"));
     spaceUserService.regiseterPointHistory(phVO);
     System.out.println("포인트 거래방식 : "+phVO.getCategory());
     
     if(phVO.getCategory().equals("충전")){
         System.out.println("updataPlusPoint call");
         spaceUserService.updatePlusPoint(spaceuserVO);
         
      }else{
         System.out.println("updateMinusPoint call");
         spaceUserService.updateMinusPoint(spaceuserVO);
         
      }
      System.out.println("포인트 거래 메소드 call");
      
      String id = spaceuserVO.getId();
      List<PointHistoryVO> phlist = spaceUserService.getAllPointHistoryById(id);
      System.out.println("충전 후 phlist :: "+phlist);
      SpaceUserVO spaceuserVO2 = spaceUserService.getUserInfo(id);
      session.setAttribute("spaceuservo", spaceuserVO2);
      return new ModelAndView("redirect:/getPoint.do");
   }
   
	@RequestMapping("searchProduct.do")
	public ModelAndView searchProduct(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String search = request.getParameter("search");
		System.out.println(search);
		if(search.startsWith("#")){
			List<HashtagVO> hlist =productService.searchProductByHashtag(search);
			System.out.println(hlist.size());
			ArrayList<ProductVO> plist = new ArrayList<ProductVO>();
			for(int i = 0 ; i<hlist.size(); i++){
				int no =hlist.get(i).getP_no();
				ProductVO pvo = productService.getProductInfo(no);
				System.out.println(pvo);
				plist.add(pvo);
				System.out.println(plist.get(i).getTitle());
				}
			request.setAttribute("plist", plist);
			return new ModelAndView("product/view/searchok","hlist",hlist);
		}else{
		List<ProductVO> plist =	productService.searchProductByKeyword(search);
		return new ModelAndView("product/view/searchok","plist",plist);
		}
	
	}   
   @RequestMapping("getPoint.do")
   public ModelAndView getPoint(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
      System.out.println("getPoint Controller Call");
      SpaceUserVO spaceuservo=(SpaceUserVO)request.getSession().getAttribute("spaceuservo");
      String id = spaceuservo.getId();
      String point = spaceUserService.getPoint(id);
      List<PointHistoryVO> phlist = spaceUserService.getAllPointHistoryById(id);
      
      System.out.println("Point :: " + point);
      request.setAttribute("phlist", phlist);
      return new ModelAndView("user/view/registerPH", "point", point);
   }

}