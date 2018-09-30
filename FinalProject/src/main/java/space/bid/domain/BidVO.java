package space.bid.domain;

public class BidVO {
	private String id;
	private String price;
	private String count;
	
	public BidVO() {
		super();
	}

	public BidVO(String id, String price, String count) {
		super();
		this.id = id;
		this.price = price;
		this.count = count;
	}
	
	public BidVO(String id, String price) {
		super();
		this.id = id;
		this.price = price;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "BidVO [id=" + id + ", price=" + price + ", count=" + count + "]";
	}
	
}
