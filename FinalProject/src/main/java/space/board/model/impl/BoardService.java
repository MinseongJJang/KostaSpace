package space.board.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.board.domain.BoardVO;

public interface BoardService {
	public void registerBoard(BoardVO bvo) throws Exception;
	public void updateBoard(BoardVO bvo) throws Exception;
	/** FAQ 寃��깋 */
	public ListVO searchFAQ(BoardVO bvo,String page) throws Exception;	// word濡� title 怨� content �몮�떎 寃��깋�븳�떎.
	public int totalCount_searchFAQ(BoardVO bvo) throws Exception;
	/** �듅�젙 FAQ 議고쉶 */
	public BoardVO getFAQInfo(int bNo) throws Exception;
	
	/** �쟾泥� FAQ 議고쉶 */
	public ListVO getAllFAQInfo(BoardVO notice,String page) throws Exception;
	public int totalCount_getAllFAQInfo(BoardVO notice) throws Exception;
	/** �듅�젙 怨듭��궗�빆 議고쉶 */
	public BoardVO getNotice(int bNo) throws Exception;
	
	/** �쟾泥� 怨듭��궗�빆 議고쉶 */
	public ListVO getAllNotice(BoardVO notice,String page) throws Exception;
	public int totalcount_getAllNotice(BoardVO notice) throws Exception;
	/** 怨듭��궗�빆 寃��깋 */
	public ListVO searchNotice(BoardVO bvo,String page) throws Exception;	// word濡� title 怨� content �몮�떎 寃��깋�븳�떎.
	public int totalcount_searchNotice(BoardVO bvo)throws Exception;
	public void deleteBoard(int bNo) throws Exception;
	
}
