package space.hashtag.domain;

public class HashtagVO {
	private String h_name;
	private int p_no;
	private int h_no;
	private String type;
	public HashtagVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HashtagVO(String h_name, int p_no, int h_no, String type) {
		super();
		this.h_name = h_name;
		this.p_no = p_no;
		this.h_no = h_no;
		this.type = type;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "HashtagVO [h_name=" + h_name + ", p_no=" + p_no + ", h_no=" + h_no + ", type=" + type + "]";
	}
	
	
}
