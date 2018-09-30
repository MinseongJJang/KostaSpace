package space.board.model.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.board.domain.BoardVO;
import space.util.PagingBean;
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void registerBoard(BoardVO bvo) throws Exception {
		boardDAO.registerBoard(bvo);
		System.out.println("registerBoard Call ok");
		
	}

	@Override
	public void updateBoard(BoardVO bvo) throws Exception {
		boardDAO.updateBoard(bvo);
		System.out.println("updateBoard Call ok!!");
		
	}



	@Override
	public int totalCount_searchFAQ(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.totalCount_searchFAQ(bvo);
	}

	@Override
	public BoardVO getFAQInfo(int bNo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getFAQInfo(bNo);
	}
	@Override
	public ListVO searchFAQ(BoardVO bvo,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean = new PagingBean(totalCount_searchFAQ(bvo), Integer.parseInt(page));
		bvo.setPb(bean);
		ListVO vo = new ListVO(boardDAO.searchFAQ(bvo), bvo.getPb()) ;
		return vo;
	}
	
	@Override
	public int totalCount_getAllFAQInfo(BoardVO notice) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.totalCount_getAllFAQInfo(notice);
	}
	@Override
	public ListVO getAllFAQInfo(BoardVO notice,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean = new PagingBean(totalCount_getAllFAQInfo(notice), Integer.parseInt(page));
		notice.setPb(bean);
		System.out.println("珥앷쾶�떆臾쇱닔::"+totalCount_getAllFAQInfo(notice));
		System.out.println("Service FAQINFO call :: page ::"+notice.getPb().getNowPage());
		ListVO vo = new ListVO(boardDAO.getAllFAQInfo(notice),notice.getPb());
		return vo;
	}
	@Override
	public BoardVO getNotice(int bNo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getNotice(bNo);
	}
	@Override
	public int totalcount_getAllNotice(BoardVO notice) throws Exception {
		
		return boardDAO.totalcount_getAllNotice(notice);
	}
	@Override
	public ListVO getAllNotice(BoardVO notice,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		System.out.println("service call::"+notice.getNotice());
		PagingBean bean = new PagingBean(totalcount_getAllNotice(notice), Integer.parseInt(page));
		
		notice.setPb(bean);
		System.out.println(bean);
		System.out.println("service�뿉 �엯�젰�맂 �럹�씠吏�::"+notice.getPb().getNowPage());
		System.out.println("sevice�뿉 �엯�젰�맂 �럹�씠利덇렇猷뱀닔 ::"+notice.getPb().getNumberOfContentPerPage());
		ListVO vo = new ListVO(boardDAO.getAllNotice(notice),notice.getPb());
		return vo;
	}

	@Override
	public int totalcount_searchNotice(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.totalcount_searchNotice(bvo);
	}

	@Override
	public ListVO searchNotice(BoardVO bvo,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean = new PagingBean(totalcount_searchNotice(bvo), Integer.parseInt(page));
		bvo.setPb(bean);
		ListVO vo = new ListVO(boardDAO.searchNotice(bvo), bvo.getPb());
		
		return vo;
	}

	@Override
	public void deleteBoard(int bNo) throws Exception {
		boardDAO.deleteBoard(bNo);
		
	}

	


	
	

}
