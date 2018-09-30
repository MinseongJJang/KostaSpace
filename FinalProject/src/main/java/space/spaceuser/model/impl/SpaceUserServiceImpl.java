package space.spaceuser.model.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.adeal.domain.AdealVO;
import space.adeal.model.impl.AdealDAO;
import space.bid.domain.BidVO;
import space.deal.domain.DealVO;
import space.deal.model.impl.DealDAO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;
@Service
public class SpaceUserServiceImpl implements SpaceUserService{
	@Autowired
	private SpaceUserDAO spaceUserDAO;
	@Autowired
	private AdealDAO adealDAO;
	@Autowired
	private DealDAO dealDAO;
	
	@Override
	public void registerUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("registerUser Call..");
		spaceUserDAO.registerUser(spaceUserVO);
		
	}
	@Override
	public void regiseterPointHistory(PointHistoryVO pointhistoryVO) throws Exception {
		System.out.println("registerPointHistory Call....");
		spaceUserDAO.regiseterPointHistory(pointhistoryVO);
		
	}

	@Override
	public SpaceUserVO loginUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("loginUser Call");
		return spaceUserDAO.loginUser(spaceUserVO);
	}

	@Override
	public void updateUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("updateUser Call");
		spaceUserDAO.updateUser(spaceUserVO);
		
	}

	@Override
	public void deleteUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("deleteUser Call");
		spaceUserDAO.deleteUser(spaceUserVO);
		
	}

	@Override
	public String findId(String tel) throws Exception {
		System.out.println("findId Call");
		return spaceUserDAO.findId(tel);
	}

	@Override
	public String findPassword(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("findPassword call");
		return spaceUserDAO.findPassword(spaceUserVO);
	}

	@Override
	public SpaceUserVO getUserInfo(String id) throws Exception {
		System.out.println("getUserInfo Call");
		return spaceUserDAO.getUserInfo(id);
	}

	@Override
	public void upgradeUserGrade(String id) throws Exception {
		/*System.out.println("upgradeUserGrade Call");
		SpaceUserVO uvo=spaceUserDAO.getUserInfo(id);
		
		List<DealVO> dlist=dealDAO.getAllDealInfo(id); //일반상품 및 휴테크 거래내역
		List<AdealVO> adlist=adealDAO.getAdealList();//경매 거래 내역
			System.out.println("upgradeUserGrade 구매자 아이디 : "+id);
		//일반상품 및 휴테크 총 거래 금액
			int dsum=0;
			
			System.out.println("일반상품 및 휴테크 거래내역 금액 계산 ");
			for(int i=0 ; i<dlist.size() ; i++){
				int price = Integer.parseInt(dlist.get(i).getPrice());
				dsum += price;
			}
			
		//옥션 총 거래금액
			int asum=0;
			
			System.out.println("옥션 거래내역 금액 계산");
			for(int i=0 ; i<adlist.size() ; i++){
				if(adlist.get(i).getId().equals(id)){
					int aprice=Integer.parseInt(adlist.get(i).getfPrice());
					asum += aprice;
				}
				
			}
		int result= dsum + asum;
		System.out.println("총 거래 금액 : "+result );
		
		if(uvo.getGrade().equals("0") && result >= 10000 ){
			System.out.println("0등급 업그레이드: 구매자 - "+ id+" 총 거래 금액 : "+result);
			spaceUserDAO.upgradeUserGrade(id);
		}else if(uvo.getGrade() == "1" && result >= 50000 ){
			System.out.println("1등급 업그레이드: 구매자 - "+ id+" 총 거래 금액 : "+result);
			spaceUserDAO.upgradeUserGrade(id);
		}else if(uvo.getGrade() == "2" && result >= 100000 ){
			System.out.println("2등급 업그레이드: 구매자 - "+ id+" 총 거래 금액 : "+result);
			spaceUserDAO.upgradeUserGrade(id);
		}else if(uvo.getGrade() == "3" && result >= 300000 ){
			System.out.println("3등급 업그레이드: 구매자 - "+ id+" 총 거래 금액 : "+result);
			spaceUserDAO.upgradeUserGrade(id);
		}*/
		
	}



	@Override
	public String getPoint(String id) throws Exception {
		System.out.println("getPoint call Ok");
		return spaceUserDAO.getPoint(id);
	}

	@Override
	public List<PointHistoryVO> getAllPointHistoryById(String id) throws Exception {
		System.out.println("getAllPointHistoryById Call");
		return spaceUserDAO.getAllPointHistoryById(id);
	}

	@Override
	public List<PointHistoryVO> getAllPointHistory() throws Exception {
		System.out.println("getAllPointHistory call ok");
		return spaceUserDAO.getAllPointHistory();
	}

	@Override
	public List<DealVO> getAllDealInfo(String id) throws Exception {
		System.out.println("getAllDealInfo Call....");
		return spaceUserDAO.getAllDealInfo(id);
	}

	@Override
	public List<DealVO> getDealState(String id) throws Exception {
		System.out.println("getDalState call ok");
		return spaceUserDAO.getDealState(id);
	}

	@Override
	public DealVO getDealInfo(int d_no) throws Exception {
		System.out.println("getDealInfo Call ok");
		return spaceUserDAO.getDealInfo(d_no);
	}

	@Override
	public BidVO getBidInfo(String id) throws Exception {
		System.out.println("getBidInfo Call ok!");
		return spaceUserDAO.getBidInfo(id);
	}
	@Override
	public void updatePlusPoint(SpaceUserVO spaceuserVO) throws Exception {
		spaceUserDAO.updatePlusPoint(spaceuserVO);
		
	}
	@Override
	public void updateMinusPoint(SpaceUserVO spaceuserVO) throws Exception {
		spaceUserDAO.updateMinusPoint(spaceuserVO);
		
	}
	@Override
	public int idCheck(String id) throws Exception {
		
		return spaceUserDAO.idCheck(id);
	}
	@Override
	public List<ProductVO> getAllProductById(String id) throws Exception {
		System.out.println("getAllProductById Call");
		return spaceUserDAO.getAllProductById(id);
	}

	

}
