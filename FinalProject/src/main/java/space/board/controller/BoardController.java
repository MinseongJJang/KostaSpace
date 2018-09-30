package space.board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import space.board.domain.BoardVO;
import space.board.model.impl.BoardService;
import space.board.model.impl.ListVO;
import space.util.PagingBean;

@Controller
public class BoardController {
   @Autowired
   private BoardService boardService;

   private String path = "C:\\finalProject\\eclipse\\workspace\\FinalProject\\src\\main\\webapp\\a.upload\\";

   @RequestMapping("registerBoard.do")
   public ModelAndView registerBoard(HttpServletRequest request, HttpServletResponse response, BoardVO boardVO)
         throws Exception {
      String rpath="";   
      System.out.println("1 :: " + boardVO);
      MultipartFile mFile = boardVO.getMultipartFile();

      System.out.println("�뙆�씪�쓽 �궗�씠利� :: " + mFile.getSize() + "=================" + mFile.isEmpty());
      if (mFile.isEmpty() == false) {
         String fileName = mFile.getOriginalFilename();
         boardVO.setOriginfilename(fileName);

         String newFileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
         boardVO.setNewfilename(newFileName);

         File copyFile = new File(path + newFileName);

         mFile.transferTo(copyFile);
      }
      boardService.registerBoard(boardVO);
      System.out.println("2 :: " + boardVO);
      
      if (boardVO.getNotice().equals("false")){
         rpath="redirect:getAllFAQInfo.do?notice=false";
      }
      else if (boardVO.getNotice().equals("true")){
         rpath="redirect:getAllNotice.do?notice=true";
      }
      return new ModelAndView(rpath);
   }

   @RequestMapping("updateBoard.do")
   public ModelAndView updateBoard(HttpServletRequest request, HttpServletResponse response, BoardVO boardVO)
         throws Exception {
      System.out.println("1 :: " + boardVO);
      MultipartFile mFile = boardVO.getMultipartFile();
      int bNo=Integer.parseInt(request.getParameter("bNo"));
      BoardVO bvo=boardService.getNotice(bNo);
      bvo.setCategory(boardVO.getCategory());
      bvo.setContent(boardVO.getContent());
      bvo.setTitle(boardVO.getTitle());
      System.out.println("�뙆�씪�쓽 �궗�씠利� :: " + mFile.getSize() + "=================" + mFile.isEmpty());
      if (mFile.isEmpty() == false) {
         String fileName = mFile.getOriginalFilename();
         boardVO.setOriginfilename(fileName);

         String newFileName = System.currentTimeMillis() + "_" + mFile.getOriginalFilename();
         boardVO.setNewfilename(newFileName);

         File copyFile = new File(path + newFileName);

         mFile.transferTo(copyFile);
      }
      boardService.updateBoard(bvo);
      System.out.println("2 :: " + bvo);
      return new ModelAndView("redirect:getAllNotice.do?notice=" + bvo.getNotice());
   }

   @RequestMapping("getAllFAQInfo.do")
   public ModelAndView getAllFAQInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String pageNo =request.getParameter("pageNo");
      BoardVO bvo = new BoardVO();
      System.out.println(" getAllFAQ controller Call:"+pageNo);
   
      bvo.setNotice(request.getParameter("notice"));
      System.out.println(request.getParameter("notice"));
      ListVO lvo = boardService.getAllFAQInfo(bvo,pageNo);
      
      return new ModelAndView("board/view/boardFAQList", "faqList",lvo);
   }

   @RequestMapping("getAllNotice.do")
   public ModelAndView getAllNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String pageNo = request.getParameter("pageNo");
      System.out.println("controller::"+pageNo);
      System.out.println("controller::"+request.getParameter("notice"));
      BoardVO bvo = new BoardVO();
      bvo.setNotice(request.getParameter("notice"));
       ListVO lvo = boardService.getAllNotice(bvo,pageNo);

      
      return new ModelAndView("board/view/boardNoticeList", "noticeList",lvo);
   }
   @RequestMapping("getNotice.do")
   public ModelAndView getNotice(HttpServletRequest request, HttpServletResponse response, int bNo) throws Exception {
      BoardVO bvo = boardService.getNotice(bNo);
      return new ModelAndView("board/view/board_detail","notice", bvo);
   }
   
   @RequestMapping("getNoticeForUpdate.do")
   public ModelAndView getNoticeForUpdate(HttpServletRequest request, HttpServletResponse response, int bNo) throws Exception {
      String id = request.getParameter("id");
      System.out.println("받아온 아이디 : "+id);
      BoardVO bvo = boardService.getNotice(bNo);
      return new ModelAndView("board/view/updateBoard","notice", bvo);
   }
   
   @RequestMapping("searchNotice.do")
   public ModelAndView searchNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      System.out.println("search1");
      String page = request.getParameter("pageNo");
      BoardVO bvo = new BoardVO();
      
      bvo.setContent(request.getParameter("searchNotice"));
      bvo.setTitle(request.getParameter("searchNotice"));
      bvo.setNotice("true");
      System.out.println(bvo);
      
      ListVO lvo = boardService.searchNotice(bvo,page);
      
      System.out.println(lvo);
      return new ModelAndView("board/view/boardNoticeList", "noticeList",lvo);
   }
   @RequestMapping("searchFAQ.do")
   public ModelAndView searchFAQ(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      
      String page = request.getParameter("pageNo");
      BoardVO bvo = new BoardVO();
      bvo.setContent(request.getParameter("searchNotice"));
      bvo.setTitle(request.getParameter("searchNotice"));
      bvo.setNotice("false");
      bvo.setCategory(request.getParameter("category"));
      System.out.println(bvo);
      
      ListVO lvo = boardService.searchNotice(bvo,page);
      
      System.out.println(lvo);
      return new ModelAndView("board/view/boardFAQList", "faqList",lvo);
   }
   
   
   @RequestMapping("deleteBoard.do")
   public ModelAndView deleteBoard(HttpServletRequest request, HttpServletResponse response,int bNo) throws Exception {
      
      System.out.println("1. deleteBoard");
      BoardVO bvo = boardService.getNotice(bNo);
      boardService.deleteBoard(bNo);
      
      return new ModelAndView("redirect:getAllNotice.do?notice=" + bvo.getNotice());
   }


}