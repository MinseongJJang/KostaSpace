package space.spaceuser.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.deal.domain.DealVO;
import space.deal.model.impl.DealService;
import space.product.domain.ProductVO;
import space.product.model.impl.ProductService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;
@Controller
public class SpaceDealController {
	@Autowired
	private DealService dealService;
	@Autowired
	private ProductService productService;
	@Autowired
	private SpaceUserService spaceUserService;
	
	@RequestMapping("registerDeal.do")//뷰페이지에서 컨트롤러로 넘길때 p_no를 넘겨줘야한다. 그 p_no로 판매자 정보를 획득한다.
	public ModelAndView registerDeal(HttpServletRequest request, HttpServletResponse response,HttpSession session,DealVO dealVO)throws Exception{
		System.out.println("registerDeal 컨트롤러 도착");
		String bId = ((SpaceUserVO)session.getAttribute("spaceuservo")).getId();//예약자 ID
		String bTel = ((SpaceUserVO)session.getAttribute("spaceuservo")).getTel();//예약자 전화번호
		dealVO.setbId(bId);dealVO.setbTel(bTel);
		String sResDate = request.getParameter("SresDate");
		String eResDate = request.getParameter("EResDate");
		String resDate = sResDate+"~"+eResDate;
		String SresTime = request.getParameter("SresTime");
		String EresTime = request.getParameter("EresTime");
		String resTime = SresTime+"~"+EresTime;
		
		int p_no = Integer.parseInt(request.getParameter("p_no"));
		String sId = ((ProductVO)productService.getProductInfo(p_no)).getId();//판매자 ID
		String sTel = ((ProductVO)productService.getProductInfo(p_no)).getTel();//판매자 비밀번호
		String price = ((ProductVO)productService.getProductInfo(p_no)).getPrice();
		String title =((ProductVO)productService.getProductInfo(p_no)).getTitle();
		String area= ((ProductVO)productService.getProductInfo(p_no)).getArea();
		dealVO.setsId(sId);dealVO.setbTel(bTel);dealVO.setResDate(resDate);dealVO.setResTime(resTime);
		dealVO.setPrice(price);dealVO.setTitle(title);dealVO.setArea(area);
		dealService.registerDeal(dealVO);
		System.out.println("registerDeal Controller 완료!!");
		return new ModelAndView();
	}
}
