package space.good.domain;

public class GoodVO {
	private int p_no;
	private int r_no;
	private String goodState;
	private String id;
	
	public GoodVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodVO(int p_no, int r_no, String goodState, String id) {
		super();
		this.p_no = p_no;
		this.r_no = r_no;
		this.goodState = goodState;
		this.id = id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getGoodState() {
		return goodState;
	}

	public void setGoodState(String goodState) {
		this.goodState = goodState;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "goodVO [p_no=" + p_no + ", r_no=" + r_no + ", goodState=" + goodState + ", id=" + id + "]";
	}
	
	
	
	
}
