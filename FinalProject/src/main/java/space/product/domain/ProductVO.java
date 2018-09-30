package space.product.domain;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import space.hashtag.domain.HashtagVO;

public class ProductVO {
   private int p_no;
   private String title;
   private String price;
   private String content;
   private String area;
   private List<HashtagVO> hashtagVO;
   private MultipartFile upload;
   private List<MultipartFile> uploads;
   private String pDate;
   private String category;
   private String crn;
   private String location;
   private String type;
   private String sTime;
   private String eTime;
   private String tel;
   private String originfilename;
   private String newfilename;
   private String originfilenames;
   private String newfilenames;
   private String id;
   private String hashtag;
   private double staravg;
   private String accomodation;
   private String area2;
   private String goodcount;
   private String reviewcount;
   public ProductVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   public ProductVO(int p_no, String title, String price, String content, String area, List<HashtagVO> hashtagVO,
         MultipartFile upload, List<MultipartFile> uploads, String pDate, String category, String crn,
         String location, String type, String sTime, String eTime, String tel, String originfilename,
         String newfilename, String originfilenames, String newfilenames, String id, String hashtag, double staravg,
         String accomodation, String area2, String goodcount, String reviewcount) {
      super();
      this.p_no = p_no;
      this.title = title;
      this.price = price;
      this.content = content;
      this.area = area;
      this.hashtagVO = hashtagVO;
      this.upload = upload;
      this.uploads = uploads;
      this.pDate = pDate;
      this.category = category;
      this.crn = crn;
      this.location = location;
      this.type = type;
      this.sTime = sTime;
      this.eTime = eTime;
      this.tel = tel;
      this.originfilename = originfilename;
      this.newfilename = newfilename;
      this.originfilenames = originfilenames;
      this.newfilenames = newfilenames;
      this.id = id;
      this.hashtag = hashtag;
      this.staravg = staravg;
      this.accomodation = accomodation;
      this.area2 = area2;
      this.goodcount = goodcount;
      this.reviewcount = reviewcount;
   }
   public int getP_no() {
      return p_no;
   }
   public void setP_no(int p_no) {
      this.p_no = p_no;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
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
   public List<HashtagVO> getHashtagVO() {
      return hashtagVO;
   }
   public void setHashtagVO(List<HashtagVO> hashtagVO) {
      this.hashtagVO = hashtagVO;
   }
   public MultipartFile getUpload() {
      return upload;
   }
   public void setUpload(MultipartFile upload) {
      this.upload = upload;
   }
   public List<MultipartFile> getUploads() {
      return uploads;
   }
   public void setUploads(List<MultipartFile> uploads) {
      this.uploads = uploads;
   }
   public String getpDate() {
      return pDate;
   }
   public void setpDate(String pDate) {
      this.pDate = pDate;
   }
   public String getCategory() {
      return category;
   }
   public void setCategory(String category) {
      this.category = category;
   }
   public String getCrn() {
      return crn;
   }
   public void setCrn(String crn) {
      this.crn = crn;
   }
   public String getLocation() {
      return location;
   }
   public void setLocation(String location) {
      this.location = location;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
   public String getsTime() {
      return sTime;
   }
   public void setsTime(String sTime) {
      this.sTime = sTime;
   }
   public String geteTime() {
      return eTime;
   }
   public void seteTime(String eTime) {
      this.eTime = eTime;
   }
   public String getTel() {
      return tel;
   }
   public void setTel(String tel) {
      this.tel = tel;
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
   public String getOriginfilenames() {
      return originfilenames;
   }
   public void setOriginfilenames(String originfilenames) {
      this.originfilenames = originfilenames;
   }
   public String getNewfilenames() {
      return newfilenames;
   }
   public void setNewfilenames(String newfilenames) {
      this.newfilenames = newfilenames;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getHashtag() {
      return hashtag;
   }
   public void setHashtag(String hashtag) {
      this.hashtag = hashtag;
   }
   public double getStaravg() {
      return staravg;
   }
   public void setStaravg(double staravg) {
      this.staravg = staravg;
   }
   public String getAccomodation() {
      return accomodation;
   }
   public void setAccomodation(String accomodation) {
      this.accomodation = accomodation;
   }
   public String getArea2() {
      return area2;
   }
   public void setArea2(String area2) {
      this.area2 = area2;
   }
   public String getGoodcount() {
      return goodcount;
   }
   public void setGoodcount(String goodcount) {
      this.goodcount = goodcount;
   }
   public String getReviewcount() {
      return reviewcount;
   }
   public void setReviewcount(String reviewcount) {
      this.reviewcount = reviewcount;
   }
   @Override
   public String toString() {
      return "ProductVO [p_no=" + p_no + ", title=" + title + ", price=" + price + ", content=" + content + ", area="
            + area + ", hashtagVO=" + hashtagVO + ", upload=" + upload + ", uploads=" + uploads + ", pDate=" + pDate
            + ", category=" + category + ", crn=" + crn + ", location=" + location + ", type=" + type + ", sTime="
            + sTime + ", eTime=" + eTime + ", tel=" + tel + ", originfilename=" + originfilename + ", newfilename="
            + newfilename + ", originfilenames=" + originfilenames + ", newfilenames=" + newfilenames + ", id=" + id
            + ", hashtag=" + hashtag + ", staravg=" + staravg + ", accomodation=" + accomodation + ", area2="
            + area2 + ", goodcount=" + goodcount + ", reviewcount=" + reviewcount + "]";
   }
   

}