package space.pointhistory.domain;

public class PointHistoryVO {
	private int ph_no;
	private String id;
	private String category;//dafault를 미정 거래 종류(충전,환불,환전)식으로 정하기
	private String kind;//default 를 미정 거래방식에 따라 조원끼리 상의하여 정하기
	private String turnover;//deafault를 0
	private String phDate;
	public PointHistoryVO() {
		super();
	}

	public PointHistoryVO(int ph_no, String id, String category, String kind, String turnover,String phDate) {
		super();
		this.ph_no = ph_no;
		this.id = id;
		this.category = category;
		this.kind = kind;
		this.turnover = turnover;
		this.phDate=phDate;
	}

	public String getPhDate() {
		return phDate;
	}

	public void setPhDate(String phDate) {
		this.phDate = phDate;
	}

	public int getPh_no() {
		return ph_no;
	}

	public void setPh_no(int ph_no) {
		this.ph_no = ph_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getTurnover() {
		return turnover;
	}

	public void setTurnover(String turnover) {
		this.turnover = turnover;
	}

	@Override
	public String toString() {
		return "PointHistoryVO [ph_no=" + ph_no + ", id=" + id + ", category=" + category + ", kind=" + kind
				+ ", turnover=" + turnover + ", phDate=" + phDate + "]";
	}

	
	
}
