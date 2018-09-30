package space.auction.domain;

import org.springframework.web.multipart.MultipartFile;

import space.util.PagingBean;

public class AuctionVO {
	private int a_no;
	private String price;
	private String content;
	private String area;
	private MultipartFile upload;
	private String location;
	private String tel;
	private String crn;
	private String a_date;	//a_date
	private String confirm;
	private String title;
	private String originfilename;
	private String newfilename;
	private String id;
	private String name;
	private String enddate;
	private PagingBean pb;
	private String accomodation;
	private String aoriginfilename;
	private String anewfilename;
	private MultipartFile aupload;
	private String amenities;
	
	public AuctionVO() {
		
	}

	public AuctionVO(int a_no, String price, String content, String area, MultipartFile upload, String location,
			String tel, String crn, String a_date, String confirm, String title, String originfilename,
			String newfilename, String id, String name, String enddate, PagingBean pb, String accomodation,
			String aoriginfilename, String anewfilename, MultipartFile aupload, String amenities) {
		super();
		this.a_no = a_no;
		this.price = price;
		this.content = content;
		this.area = area;
		this.upload = upload;
		this.location = location;
		this.tel = tel;
		this.crn = crn;
		this.a_date = a_date;
		this.confirm = confirm;
		this.title = title;
		this.originfilename = originfilename;
		this.newfilename = newfilename;
		this.id = id;
		this.name = name;
		this.enddate = enddate;
		this.pb = pb;
		this.accomodation = accomodation;
		this.aoriginfilename = aoriginfilename;
		this.anewfilename = anewfilename;
		this.aupload = aupload;
		this.amenities = amenities;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCrn() {
		return crn;
	}

	public void setCrn(String crn) {
		this.crn = crn;
	}

	public String getA_date() {
		return a_date;
	}

	public void setA_date(String a_date) {
		this.a_date = a_date;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public PagingBean getPb() {
		return pb;
	}

	public void setPb(PagingBean pb) {
		this.pb = pb;
	}

	public String getAccomodation() {
		return accomodation;
	}

	public void setAccomodation(String accomodation) {
		this.accomodation = accomodation;
	}

	public String getAoriginfilename() {
		return aoriginfilename;
	}

	public void setAoriginfilename(String aoriginfilename) {
		this.aoriginfilename = aoriginfilename;
	}

	public String getAnewfilename() {
		return anewfilename;
	}

	public void setAnewfilename(String anewfilename) {
		this.anewfilename = anewfilename;
	}

	public MultipartFile getAupload() {
		return aupload;
	}

	public void setAupload(MultipartFile aupload) {
		this.aupload = aupload;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	@Override
	public String toString() {
		return "AuctionVO [a_no=" + a_no + ", price=" + price + ", content=" + content + ", area=" + area + ", upload="
				+ upload + ", location=" + location + ", tel=" + tel + ", crn=" + crn + ", a_date=" + a_date
				+ ", confirm=" + confirm + ", title=" + title + ", originfilename=" + originfilename + ", newfilename="
				+ newfilename + ", id=" + id + ", name=" + name + ", enddate=" + enddate + ", pb=" + pb
				+ ", accomodation=" + accomodation + ", aoriginfilename=" + aoriginfilename + ", anewfilename="
				+ anewfilename + ", aupload=" + aupload + ", amenities=" + amenities + "]";
	}
	
}
