package space.spaceuser.domain;

import java.util.List;

import space.auction.domain.AuctionVO;
import space.board.domain.BoardVO;
import space.complain.domain.ComplainVO;
import space.pointhistory.domain.PointHistoryVO;
import space.review.domain.ReviewVO;

public class SpaceUserVO {
	private String id;
	private String password;
	private String tel;
	private String name;
	private String address;
	private String point;
	private List<PointHistoryVO> phList;
	private AuctionVO auctionVO;
	private List<BoardVO> bList;
	private List<ComplainVO> cList;
	private List<ReviewVO> rList;
	private String grade;
	private String crn;
	
	
	public SpaceUserVO() {
		super();
	}

	

	public SpaceUserVO(String id, String password, String tel, String name, String address, String point,
			List<PointHistoryVO> phList, AuctionVO auctionVO, List<BoardVO> bList, List<ComplainVO> cList,
			List<ReviewVO> rList, String grade, String crn) {
		super();
		this.id = id;
		this.password = password;
		this.tel = tel;
		this.name = name;
		this.address = address;
		this.point = point;
		this.phList = phList;
		this.auctionVO = auctionVO;
		this.bList = bList;
		this.cList = cList;
		this.rList = rList;
		this.grade = grade;
		this.crn = crn;
	}



	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getPoint() {
		return point;
	}


	public void setPoint(String point) {
		this.point = point;
	}


	public List<PointHistoryVO> getPhList() {
		return phList;
	}


	public void setPhList(List<PointHistoryVO> phList) {
		this.phList = phList;
	}


	public AuctionVO getAuctionVO() {
		return auctionVO;
	}


	public void setAuctionVO(AuctionVO auctionVO) {
		this.auctionVO = auctionVO;
	}


	public List<BoardVO> getbList() {
		return bList;
	}


	public void setbList(List<BoardVO> bList) {
		this.bList = bList;
	}


	public List<ComplainVO> getcList() {
		return cList;
	}


	public void setcList(List<ComplainVO> cList) {
		this.cList = cList;
	}


	public List<ReviewVO> getrList() {
		return rList;
	}


	public void setrList(List<ReviewVO> rList) {
		this.rList = rList;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getCrn() {
		return crn;
	}


	public void setCrn(String crn) {
		this.crn = crn;
	}



	@Override
	public String toString() {
		return "SpaceUserVO [id=" + id + ", password=" + password + ", tel=" + tel + ", name=" + name + ", address="
				+ address + ", point=" + point + ", phList=" + phList + ", auctionVO=" + auctionVO + ", bList=" + bList
				+ ", cList=" + cList + ", rList=" + rList + ", grade=" + grade + ", crn=" + crn + "]";
	}
	
	

}
