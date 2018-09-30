package space.complain.model.impl;

import space.complain.domain.ComplainVO;

public interface ComplainService {
	public void complainProduct(ComplainVO complainVO)throws Exception;
	//상품 신고
	public ComplainVO getComplain(int cNo)throws Exception;
	//상세 신고글 조회
	public ListVO getAllComplain(ComplainVO complainVO,String page)throws Exception;
	//전체 신고글 조회
	public int totalCount_getAllComplain()throws Exception;
	//전체 신고글 갯수
	public ListVO findComplainById(ComplainVO complainVO,String page)throws Exception;
	//특정회원 신고글 검색
	public int totalCount_findComplainById(ComplainVO complainVO)throws Exception;
	//특정회원 신고글 갯수
	public ListVO findComplainByPNo(ComplainVO complainVO,String page)throws Exception;
	//특정 상품에 대한 신고글 조회
	public int totalCount_findComplainByPNo(ComplainVO complainVO)throws Exception;
	//특정 상품에 대한 신고글 총수
	public void deleteComplain(int cNo)throws Exception;
}
