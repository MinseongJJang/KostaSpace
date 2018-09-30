package space.adeal.domain;

public class AdealVO {
	private int a_deal_no;
	private int a_no;
	private String id;
	private String fPrice;
	
	public AdealVO(){}

	public AdealVO(int a_deal_no, int a_no, String id, String fPrice) {
		super();
		this.a_deal_no = a_deal_no;
		this.a_no = a_no;
		this.id = id;
		this.fPrice = fPrice;
	}

	public int getA_deal_no() {
		return a_deal_no;
	}

	public void setA_deal_no(int a_deal_no) {
		this.a_deal_no = a_deal_no;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getfPrice() {
		return fPrice;
	}

	public void setfPrice(String fPrice) {
		this.fPrice = fPrice;
	}

	@Override
	public String toString() {
		return "AdealVO [a_deal_no=" + a_deal_no + ", a_no=" + a_no + ", id=" + id + ", fPrice=" + fPrice + "]";
	}
	
}
