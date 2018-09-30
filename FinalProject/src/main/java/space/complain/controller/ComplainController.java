package space.complain.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.complain.domain.ComplainVO;
import space.complain.model.impl.ComplainService;
import space.complain.model.impl.ListVO;
import space.product.domain.ProductVO;
import space.product.model.impl.ProductService;
import space.spaceuser.domain.SpaceUserVO;

@Controller
public class ComplainController {
	@Autowired
	private ComplainService service;
	@Autowired
	private ProductService productService;
	
	@RequestMapping("complainProduct.do")
	public ModelAndView complainProduct(HttpServletRequest request, HttpServletResponse response, ComplainVO complainVO)throws Exception{
		System.out.println("complainProduct controller call");
		String id= ((SpaceUserVO)request.getSession().getAttribute("spaceuservo")).getId();
		complainVO.setId(id);
		service.complainProduct(complainVO);
		System.out.println("complainProduct service call");
		
		return new ModelAndView("redirect:findComplainById.do?pageNo=1");
	}
	@RequestMapping("getComplain.do")
	public ModelAndView getComplain(HttpServletRequest request, HttpServletResponse response)throws Exception{
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		ComplainVO cvo = (ComplainVO)service.getComplain(cNo);
		
		int pNo = cvo.getP_no();
		ProductVO productvo = productService.getProductInfo(pNo);
		System.out.println("신고된 상품정보 : "+productvo);
		
		request.getSession().setAttribute("productvo", productvo);
		
		return new ModelAndView("complain/view/complain_detail","cvo",cvo);
	}
	//관리자일때
	@RequestMapping("getAllComplain.do")
	public ModelAndView getAllComplain(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String pageNo=request.getParameter("pageNo");
		ComplainVO cvo = new ComplainVO();
		ListVO lvo = service.getAllComplain(cvo, pageNo);
		return new ModelAndView("complain/view/myComplainList","lvo",lvo);
	}
	@RequestMapping("findComplainById")
	public ModelAndView findComplainById(HttpServletRequest request, HttpServletResponse response,HttpSession session)throws Exception{
		String pageNo = request.getParameter("pageNo");
		System.out.println(pageNo);
		String id = ((SpaceUserVO)session.getAttribute("spaceuservo")).getId();
		System.out.println(id);
		ComplainVO cvo = new ComplainVO();
		cvo.setId(id);
		ListVO lvo = service.findComplainById(cvo, pageNo);
		System.out.println(lvo.getList());
		return new ModelAndView("complain/view/myComplainList","lvo",lvo);
	}
	@RequestMapping("findComplainByPNo")
	public ModelAndView findComplainByPNo(HttpServletRequest request, HttpServletResponse response)throws Exception{
		String pageNo = request.getParameter("pageNo");
		int p_no = Integer.parseInt(request.getParameter("pNo"));
		ComplainVO cvo = new ComplainVO();
		cvo.setP_no(p_no);
		ListVO lvo = service.findComplainByPNo(cvo, pageNo);
		return new ModelAndView("","",lvo);
	}
	
	@RequestMapping("deleteComplain.do")
	public ModelAndView deleteComplain(HttpServletRequest request, HttpServletResponse response, HttpSession session)throws Exception{
		System.out.println("deleteComplain controller call");
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		service.deleteComplain(cNo);
		String id = ((SpaceUserVO)session.getAttribute("spaceuservo")).getId();
		ComplainVO cvo = new ComplainVO();
		cvo.setId(id);
		ListVO lvo = service.findComplainById(cvo, "1");
		return new ModelAndView("complain/view/myComplainList","lvo",lvo);
	}
}
