package space.complain.domain;

import space.util.PagingBean;

public class ComplainVO {
	private String id;
	private int c_no;
	private int p_no;
	private String content;
	private String title;
	private String cDate;
	private PagingBean pb;
	
	public ComplainVO(){}

	public ComplainVO(String id, int c_no, int p_no, String content, String title, String cDate, PagingBean pb) {
		super();
		this.id = id;
		this.c_no = c_no;
		this.p_no = p_no;
		this.content = content;
		this.title = title;
		this.cDate = cDate;
		this.pb = pb;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public PagingBean getPb() {
		return pb;
	}

	public void setPb(PagingBean pb) {
		this.pb = pb;
	}

	@Override
	public String toString() {
		return "ComplainVO [id=" + id + ", c_no=" + c_no + ", p_no=" + p_no + ", content=" + content + ", title="
				+ title + ", cDate=" + cDate + ", pb=" + pb + "]";
	}
	
	
}
