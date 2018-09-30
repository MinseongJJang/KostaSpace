package space.deal.model.impl;

import java.util.List;

import space.deal.domain.DealVO;
import space.review.domain.ReviewVO;
import space.util.PagingBean;

/**
 * 게시물 리스트 정보와 
 * 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class ListVO {
	private List<DealVO> list;
	private PagingBean pagingBean;
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListVO(List<DealVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<DealVO> getList() {
		return list;
	}
	public void setList(List<DealVO> list) {
		this.list = list;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
	
}










