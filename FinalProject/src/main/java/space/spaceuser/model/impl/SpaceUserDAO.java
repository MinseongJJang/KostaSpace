package space.spaceuser.model.impl;

import java.util.List;

import space.bid.domain.BidVO;
import space.deal.domain.DealVO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;

public interface SpaceUserDAO {
	public void registerUser(SpaceUserVO spaceUserVO)throws Exception;
	public void regiseterPointHistory(PointHistoryVO pointhistoryVO)throws Exception;
	public SpaceUserVO loginUser(SpaceUserVO spaceUserVO)throws Exception;
	//로그아웃
	public SpaceUserVO getUserInfo(String id)throws Exception;
	public void updateUser(SpaceUserVO spaceUserVO)throws Exception;
	public String findId(String tel)throws Exception;
	public String findPassword(SpaceUserVO spaceUserVO)throws Exception;
	public void deleteUser(SpaceUserVO spaceUserVO)throws Exception;
	public List<PointHistoryVO> getAllPointHistoryById(String id)throws Exception;
	public int idCheck(String id)throws Exception;

	public List<PointHistoryVO> getAllPointHistory()throws Exception;
	//관리자입장
	
	public String getPoint(String id)throws Exception;//궂이 필요가 없을것 같아
	public List<ProductVO> getAllProductById(String id)throws Exception;
	
	public void updatePlusPoint(SpaceUserVO spaceuserVO)throws Exception;
	public void updateMinusPoint(SpaceUserVO spaceuserVO)throws Exception;
	//이건 거래 있을때...
	public List<DealVO> getAllDealInfo(String id)throws Exception;
	public List<DealVO> getDealState(String id)throws Exception;
	public DealVO getDealInfo(int d_no) throws Exception;
	
	
	
	public BidVO getBidInfo(String id) throws Exception;
	public void upgradeUserGrade(String id)throws Exception;
	//거래가 일어날때 횟수를 늘려줘서 grade가 예를 들어 50이되면 grade값을 바꿔줘씨발
	
	
}
