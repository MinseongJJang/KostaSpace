package space.spaceuser.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import space.deal.domain.DealVO;
import space.deal.model.impl.DealService;
import space.spaceuser.domain.SpaceUserVO;
import space.spaceuser.model.impl.SpaceUserService;

@Controller
public class AjaxController {
   @Autowired
   private SpaceUserService userService;
   @Autowired
   private DealService dealService;

   @RequestMapping("rcount.do")
   public ModelAndView rcount(HttpServletRequest request, HttpServletResponse response)throws Exception{
      int stime = Integer.parseInt(request.getParameter("stime").substring(0, 2));
      int etime = Integer.parseInt(request.getParameter("etime").substring(0, 2));
      int t = etime-stime;
      int price =Integer.parseInt(request.getParameter("price"));
      int totalPrice = price*t;
      return new ModelAndView("rcount","t",totalPrice);
   }
   @RequestMapping("loginCheck.do")
   public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response)throws Exception{
      String id = request.getParameter("id");
      String password = request.getParameter("password");
      SpaceUserVO uvo = new SpaceUserVO();
      uvo.setId(id);uvo.setPassword(password);
      
      return new ModelAndView("loginResult","l",userService.loginUser(uvo));
   }
   @RequestMapping("deleteDeal.do")
   public ModelAndView deleteDeal(HttpServletRequest request, HttpServletResponse response)throws Exception{
      int d_no = Integer.parseInt(request.getParameter("dNo"));
      System.out.println(d_no);
      dealService.deleteDeal(d_no);
      DealVO deal = dealService.getDealInfo(d_no);
      System.out.println("getDealInfo");
      return new ModelAndView("cancleModal","deal",deal);
   }

   @RequestMapping("passcheck.do")
   public ModelAndView passcheck(HttpServletRequest request, HttpServletResponse response)throws Exception{
      String pass = request.getParameter("pass");
      String passcheck = request.getParameter("passcheck");
      if(pass.equals(passcheck)){
         return new ModelAndView("passcheckResultView","result",0);
      }else{
         return new ModelAndView("passcheckResultView","result",1);   
      }   
   }
   @RequestMapping("plus.do")
   public ModelAndView plus(HttpServletRequest request, HttpServletResponse response)throws Exception{
      int cnt = Integer.parseInt(request.getParameter("cnt"));
      int d = cnt+1;
      return new ModelAndView("plusaccmo","d",d);
   }
   @RequestMapping("afterCharge.do")
   public ModelAndView afterCharge(HttpServletRequest request, HttpServletResponse response)throws Exception{
	   System.out.println("123123123123123123");
	   int point = Integer.parseInt(request.getParameter("point"));
	   System.out.println("원래 포인트" + point);
	   int turnover = Integer.parseInt(request.getParameter("turnover"));
	   System.out.println("충전할 포인트 " + point);
	   int sumPoint = (point+turnover);
	   System.out.println(sumPoint);
	   
	   return new ModelAndView("afterCharge","sumPoint",sumPoint);
}
}