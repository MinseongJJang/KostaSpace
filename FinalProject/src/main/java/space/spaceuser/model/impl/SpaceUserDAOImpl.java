package space.spaceuser.model.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.bid.domain.BidVO;
import space.deal.domain.DealVO;
import space.pointhistory.domain.PointHistoryVO;
import space.product.domain.ProductVO;
import space.spaceuser.domain.SpaceUserVO;
@Repository
public class SpaceUserDAOImpl implements SpaceUserDAO{
	@Autowired
	SqlSession session;
	@Override //회원가입
	public void registerUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("registerUser call");
		System.out.println(session.insert("userMapper.registerUser", spaceUserVO)+"row insert ok!!");
	}

	@Override //로그인
	public SpaceUserVO loginUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("loginUser Call...");
		return session.selectOne("userMapper.loginUser", spaceUserVO);
	}

	@Override //회원정보 수정
	public void updateUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("updateUser Call...");
		System.out.println(session.update("userMapper.updateUser", spaceUserVO)+"row update OK");
	}

	@Override //회원 탈퇴
	public void deleteUser(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("deleteUser Call...");
		System.out.println(session.delete("userMapper.deleteUser", spaceUserVO)+"row delete ok");
	}

	@Override //아이디 찾기
	public String findId(String tel) throws Exception {
		System.out.println("findId call....");
		return session.selectOne("userMapper.findId", tel);
	}

	@Override //비밀번호 찾기
	public String findPassword(SpaceUserVO spaceUserVO) throws Exception {
		System.out.println("findPassword call");
		return session.selectOne("userMapper.findPassword",spaceUserVO);
	}

	@Override //특정회원정보 조회
	public SpaceUserVO getUserInfo(String id) throws Exception {
		System.out.println("getUserInfo call..");
		return session.selectOne("userMapper.getUserInfo", id);
	}

	@Override //특정회원 정보수정
	public void upgradeUserGrade(String id) throws Exception {
		System.out.println("upgradeUserGrade call...");
		System.out.println(session.update("userMapper.upgradeUserGrade", id));
	}

	@Override //회원가입시 최초생성 , 포인트 거래마다 새로 생성
	public void regiseterPointHistory(PointHistoryVO pointhistoryVO) throws Exception {
		System.out.println("registerPointHistory call....");
		System.out.println(session.insert("pointMapper.regiseterPointHistory",pointhistoryVO)+"row insert");
	}

	@Override //특정회원 포인트 불러오기
	public String getPoint(String id) throws Exception {
		System.out.println("getPoint call....");
		return session.selectOne("pointMapper.getPoint", id);
	}

	@Override //특정회원의 총 포인트 거래 내역 보기
	public List<PointHistoryVO> getAllPointHistoryById(String id) throws Exception {
		System.out.println("getAllPointHistoryById call");
		return session.selectList("pointMapper.getAllPointHistoryById", id);
	}

	@Override // 관리자 입장에서 모든 포인트 거래 내역 보기
	public List<PointHistoryVO> getAllPointHistory() throws Exception {
		System.out.println("getAllPointHistory call");
		return session.selectList("pointMapper.getAllPointHistory");
	}

	@Override // 특정회원의 모든 거래내역 보기
	public List<DealVO> getAllDealInfo(String id) throws Exception {
		System.out.println("getAllDealInfo call");
		return session.selectList("dealMapper.getAllDealInfo", id);
	}

	@Override // 특정회원의 거래상태보기
	public List<DealVO> getDealState(String id) throws Exception {
		System.out.println("getDealState Call...");
		return session.selectList("dealMapper.getDealState", id);
	}

	@Override //특정거래 상세보기
	public DealVO getDealInfo(int d_no) throws Exception {
		System.out.println("getDealInfo call");
		return session.selectOne("dealMapper.getDealInfo", d_no);
	}

	@Override // 회원의 현재 bid정보보기
	public BidVO getBidInfo(String id) throws Exception {
		System.out.println("getBidInfo Call...");
		return session.selectOne("bidMapper.getBidInfo",id);
	}

	@Override
	public void updatePlusPoint(SpaceUserVO spaceuserVO) throws Exception {
		System.out.println("updatePlusPoint call...");
		System.out.println(session.update("pointMapper.updatePlusPoint",spaceuserVO)+"row update OK!!");
		
	}
	@Override
	public void updateMinusPoint(SpaceUserVO spaceuserVO) throws Exception {
		System.out.println("updateMinusPoint call...");
		System.out.println(session.update("pointMapper.updateMinusPoint",spaceuserVO)+"row update OK!!");
		
	}

	@Override
	public int idCheck(String id) throws Exception {
		System.out.println("idCheck Call...");
		return session.selectOne("userMapper.idCheck",id);
	}

	@Override
	public List<ProductVO> getAllProductById(String id) throws Exception {
		System.out.println("getAllProductById");
		return session.selectList("productMapper.getAllProductById", id);
	}

	

}
