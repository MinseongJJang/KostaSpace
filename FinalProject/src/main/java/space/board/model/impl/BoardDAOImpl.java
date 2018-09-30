package space.board.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.board.domain.BoardVO;
@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> searchFAQ(BoardVO bvo) throws Exception {
		System.out.println("boardDAO.searchFAQ() �샇異�");
		return sqlSession.selectList("boardMapper.searchFAQ", bvo);
	}

	@Override
	public BoardVO getFAQInfo(int bNo) throws Exception {
		System.out.println("boardDAO.getFAQInfo() �샇異�");
		return sqlSession.selectOne("boardMapper.getFAQInfo", bNo);
	}

	@Override
	public List<BoardVO> getAllFAQInfo(BoardVO notice) throws Exception {
		System.out.println("boardDAO.getAllFAQInfo() �샇異�");
		System.out.println("daoCall notice"+notice.getNotice());
		System.out.println("daocall page::"+notice.getPb().getNowPage());
		return sqlSession.selectList("boardMapper.getAllFAQInfo", notice);
	}

	@Override
	public BoardVO getNotice(int bNo) throws Exception {
		System.out.println("boardDAO.getNotice() �샇異�");
		return sqlSession.selectOne("boardMapper.getNotice", bNo);
	}

	@Override
	public List<BoardVO> getAllNotice(BoardVO notice) throws Exception {
		System.out.println("boardDAO.getAllNotice() �샇異�");
		System.out.println("daoCall::"+notice.getNotice());
		System.out.println("daoCall::"+notice.getPb().getNowPage());
		return sqlSession.selectList("boardMapper.getAllNotice", notice);
	}

	@Override
	public List<BoardVO> searchNotice(BoardVO bvo) throws Exception {
		System.out.println("boardDAO.searchNotice() �샇異�");
		return sqlSession.selectList("boardMapper.searchNotice", bvo);
	}

	@Override
	public int totalCount_searchFAQ(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.totalCount_searchFAQ",bvo);
	}

	



	@Override
	public int totalCount_getAllFAQInfo(BoardVO notice) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.totalCount_getAllFAQInfo", notice);
	}

	



	@Override
	public int totalcount_getAllNotice(BoardVO notice) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.totalcount_getAllNotice", notice);
	}

	@Override
	public int totalcount_searchNotice(BoardVO bvo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.totalcount_searchNotice", bvo);
	}

	@Override
	public void registerBoard(BoardVO bvo) throws Exception {
		System.out.println(sqlSession.insert("boardMapper.registerBoard", bvo)+"row insert ok");
		
	}

	@Override
	public void updateBoard(BoardVO bvo) throws Exception {
		System.out.println(sqlSession.update("boardMapper.updateBoard", bvo)+"row update ok");
		
	}

	@Override
	public void deleteBoard(int bNo) throws Exception {
		System.out.println(sqlSession.delete("boardMapper.deleteBoard",bNo)+"row delete ok!!");
		
	}
	
}
