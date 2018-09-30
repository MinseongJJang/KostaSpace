package space.review.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import space.good.domain.GoodVO;
import space.util.PagingBean;

public class ReviewVO {
	private int r_no;
	private int p_no;
	private String id;
	private String average;
	private String content;
	private String goodCount;
	private String rDate;
	private MultipartFile upload;
	private String originfilename;
	private String newfilename;
	private List<GoodVO> goodVO;
	private PagingBean pb;
	public ReviewVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewVO(int r_no, int p_no, String id, String average, String content, String goodCount, String rDate,
			MultipartFile upload, String originfilename, String newfilename, List<GoodVO> goodVO, PagingBean pb) {
		super();
		this.r_no = r_no;
		this.p_no = p_no;
		this.id = id;
		this.average = average;
		this.content = content;
		this.goodCount = goodCount;
		this.rDate = rDate;
		this.upload = upload;
		this.originfilename = originfilename;
		this.newfilename = newfilename;
		this.goodVO = goodVO;
		this.pb = pb;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAverage() {
		return average;
	}
	public void setAverage(String average) {
		this.average = average;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGoodCount() {
		return goodCount;
	}
	public void setGoodCount(String goodCount) {
		this.goodCount = goodCount;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getOriginfilename() {
		return originfilename;
	}
	public void setOriginfilename(String originfilename) {
		this.originfilename = originfilename;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	public List<GoodVO> getGoodVO() {
		return goodVO;
	}
	public void setGoodVO(List<GoodVO> goodVO) {
		this.goodVO = goodVO;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}
	@Override
	public String toString() {
		return "ReviewVO [r_no=" + r_no + ", p_no=" + p_no + ", id=" + id + ", average=" + average + ", content="
				+ content + ", goodCount=" + goodCount + ", rDate=" + rDate + ", upload=" + upload + ", originfilename="
				+ originfilename + ", newfilename=" + newfilename + ", goodVO=" + goodVO + ", pb=" + pb + "]";
	}
	
	
	
	

	
	
	
	
}
