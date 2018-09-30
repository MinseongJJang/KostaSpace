package space.complain.model.impl;

import java.util.List;

import space.complain.domain.ComplainVO;

public interface ComplainDAO {
	public void complainProduct(ComplainVO complainVO)throws Exception;
	//상품 신고
	public ComplainVO getComplain(int cNo)throws Exception;
	//상세 신고글 조회
	public List<ComplainVO> getAllComplain(ComplainVO complainVO)throws Exception;
	//전체 신고글 조회
	public int totalCount_getAllComplain()throws Exception;
	//전체 신고글 갯수
	public List<ComplainVO> findComplainById(ComplainVO complainVO)throws Exception;
	//특정회원 신고글 검색
	public int totalCount_findComplainById(ComplainVO complainVO)throws Exception;
	//특정회원 신고글 갯수
	public List<ComplainVO> findComplainByPNo(ComplainVO complainVO)throws Exception;
	//특정 상품에 대한 신고글 조회
	public int totalCount_findComplainByPNo(ComplainVO complainVO)throws Exception;
	//특정 상품에 대한 신고글 총수
	public void deleteComplain(int cNo)throws Exception;
}
