package space.complain.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.complain.domain.ComplainVO;

@Repository
public class ComplainDAOImpl implements ComplainDAO{
	@Autowired
	SqlSession sqlSession;

	@Override
	public void complainProduct(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > complainProduct Call");
		sqlSession.insert("complainMapper.complainProduct", complainVO);
		System.out.println("DAO > 등록완료 ");
		
	}

	@Override
	public ComplainVO getComplain(int cNo) throws Exception {
		System.out.println("DAO > getComplain Call");
		return sqlSession.selectOne("complainMapper.getComplain", cNo);
	}

	@Override
	public List<ComplainVO> getAllComplain(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > getAllComplin Call");
		return sqlSession.selectList("complainMapper.getAllComplain",complainVO);
	}

	@Override
	public int totalCount_getAllComplain() throws Exception {
		System.out.println("DAO > totalCount_getAllComplain Call");
		return sqlSession.selectOne("complainMapper.totalCount_getAllComplain");
	}

	@Override
	public List<ComplainVO> findComplainById(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > findComplainById Call");
		return sqlSession.selectList("complainMapper.findComplainById", complainVO);
	}

	@Override
	public int totalCount_findComplainById(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > totalCount_findComplainById Call");
		return sqlSession.selectOne("complainMapper.totalCount_findComplainById",complainVO);
	}

	@Override
	public List<ComplainVO> findComplainByPNo(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > findComplainByPNo Call");
		return sqlSession.selectList("complainMapper.findComplainByPNo",complainVO);
	}

	@Override
	public int totalCount_findComplainByPNo(ComplainVO complainVO) throws Exception {
		System.out.println("DAO > totalCount_findComplainByPNo Call");
		return sqlSession.selectOne("complainMapper.totalCount_findComplinByPNo", complainVO);
	}

	@Override
	public void deleteComplain(int cNo) throws Exception {
		System.out.println("DAO > deleteComplain Call");
		sqlSession.delete("complainMapper.deleteComplain",cNo);
	}
	
	

}
