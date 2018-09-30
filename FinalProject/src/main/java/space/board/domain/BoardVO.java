package space.board.domain;

import org.springframework.web.multipart.MultipartFile;

import space.util.PagingBean;

public class BoardVO {
   private int b_no;
   private String id;
   private String title;
   private String category;
   private String bDate;
   private String content;
   private String newfilename;
   private String originfilename;
   private MultipartFile multipartFile;
   private String notice;
   private PagingBean pb;
   public BoardVO(){}
public BoardVO(int b_no, String id, String title, String category, String bDate, String content, String newfilename,
		String originfilename, MultipartFile multipartFile, String notice, PagingBean pb) {
	super();
	this.b_no = b_no;
	this.id = id;
	this.title = title;
	this.category = category;
	this.bDate = bDate;
	this.content = content;
	this.newfilename = newfilename;
	this.originfilename = originfilename;
	this.multipartFile = multipartFile;
	this.notice = notice;
	this.pb = pb;
}

public int getB_no() {
	return b_no;
}
public void setB_no(int b_no) {
	this.b_no = b_no;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getbDate() {
	return bDate;
}
public void setbDate(String bDate) {
	this.bDate = bDate;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getNewfilename() {
	return newfilename;
}
public void setNewfilename(String newfilename) {
	this.newfilename = newfilename;
}
public String getOriginfilename() {
	return originfilename;
}
public void setOriginfilename(String originfilename) {
	this.originfilename = originfilename;
}
public MultipartFile getMultipartFile() {
	return multipartFile;
}
public void setMultipartFile(MultipartFile multipartFile) {
	this.multipartFile = multipartFile;
}
public String getNotice() {
	return notice;
}
public void setNotice(String notice) {
	this.notice = notice;
}
public PagingBean getPb() {
	return pb;
}
public void setPb(PagingBean pb) {
	this.pb = pb;
}
@Override
public String toString() {
	return "BoardVO [b_no=" + b_no + ", id=" + id + ", title=" + title + ", category=" + category + ", bDate=" + bDate
			+ ", content=" + content + ", newfilename=" + newfilename + ", originfilename=" + originfilename
			+ ", multipartFile=" + multipartFile + ", notice=" + notice + ", pb=" + pb + "]";
}

   
 
   
}