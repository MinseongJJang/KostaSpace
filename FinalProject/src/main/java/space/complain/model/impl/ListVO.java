package space.complain.model.impl;

import java.util.List;
import space.complain.domain.ComplainVO;
import space.util.PagingBean;

/**
 * 게시물 리스트 정보와 
 * 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class ListVO {
	private List<ComplainVO> list;
	private PagingBean pagingBean;
	
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ListVO(List<ComplainVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<ComplainVO> getList() {
		return list;
	}

	public void setList(List<ComplainVO> list) {
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










