package space.spaceuser.model.impl;

import java.util.List;

import space.bid.domain.BidVO;
import space.deal.domain.DealVO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;

public interface SpaceUserService {
	
	public void registerUser(SpaceUserVO spaceUserVO)throws Exception;
	public SpaceUserVO loginUser(SpaceUserVO spaceUserVO)throws Exception;
	public void updateUser(SpaceUserVO spaceUserVO)throws Exception;
	public void deleteUser(SpaceUserVO spaceUserVO)throws Exception;
	public String findId(String tel)throws Exception;
	public String findPassword(SpaceUserVO spaceUserVO)throws Exception;
	public SpaceUserVO getUserInfo(String id)throws Exception;
	public void upgradeUserGrade(String id)throws Exception;
	public List<ProductVO> getAllProductById(String id)throws Exception;
	public void regiseterPointHistory(PointHistoryVO pointhistoryVO)throws Exception;
	public String getPoint(String id)throws Exception;
	public void updatePlusPoint(SpaceUserVO spaceuserVO)throws Exception;
	public void updateMinusPoint(SpaceUserVO spaceuserVO)throws Exception;
	public List<PointHistoryVO> getAllPointHistoryById(String id)throws Exception;
	public List<PointHistoryVO> getAllPointHistory()throws Exception;
	public List<DealVO> getAllDealInfo(String id)throws Exception;
	public List<DealVO> getDealState(String id)throws Exception;
	public DealVO getDealInfo(int d_no) throws Exception;
	public BidVO getBidInfo(String id) throws Exception;
	public int idCheck(String id)throws Exception;
}
