package space.complain.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import space.complain.domain.ComplainVO;
import space.util.PagingBean;

@Service
public class ComplainServiceImpl implements ComplainService {
	@Autowired
	private ComplainDAO complainDAO;

	@Override
	public void complainProduct(ComplainVO complainVO) throws Exception {
		System.out.println("Service > complainProduct Call");
		complainDAO.complainProduct(complainVO);
		System.out.println("complainProduct OK");
		
	}

	@Override
	public ComplainVO getComplain(int cNo) throws Exception {
		System.out.println("Service > getComplain Call");
		return complainDAO.getComplain(cNo);
	}

	@Override
	public int totalCount_getAllComplain() throws Exception {
		System.out.println("Service > totalCount_getAllComplain Call");
		return complainDAO.totalCount_getAllComplain();
	}

	@Override
	public ListVO getAllComplain(ComplainVO complainVO,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean = new PagingBean(totalCount_getAllComplain(), Integer.parseInt(page));
		complainVO.setPb(bean);
		ListVO vo = new ListVO(complainDAO.getAllComplain(complainVO), complainVO.getPb());
		return vo;
	}

	@Override
	public int totalCount_findComplainById(ComplainVO complainVO) throws Exception {
		
		return complainDAO.totalCount_findComplainById(complainVO);
	}

	@Override
	public ListVO findComplainById(ComplainVO complainVO,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean = new PagingBean(totalCount_findComplainById(complainVO), Integer.parseInt(page));
		complainVO.setPb(bean);
		ListVO vo = new ListVO(complainDAO.findComplainById(complainVO), complainVO.getPb());
		return vo;
	}

	@Override
	public int totalCount_findComplainByPNo(ComplainVO complainVO) throws Exception {
		
		return complainDAO.totalCount_findComplainByPNo(complainVO);
	}

	@Override
	public ListVO findComplainByPNo(ComplainVO complainVO,String page) throws Exception {
		if(page==null || page==""){
			page="1";
		}
		PagingBean bean =  new PagingBean(complainDAO.totalCount_findComplainByPNo(complainVO), Integer.parseInt(page));
		complainVO.setPb(bean);
		ListVO vo = new ListVO(complainDAO.findComplainByPNo(complainVO), complainVO.getPb());
		return vo;
	}

	@Override
	public void deleteComplain(int cNo) throws Exception {
		System.out.println("deleteComplain Service call");
		complainDAO.deleteComplain(cNo);
	}

}
