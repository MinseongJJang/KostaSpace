package space.amenties.domain;

public class AmenitiesVO {
	private int p_no;
	private String amenities;
	private int a_no;
	private int atemp_no;
	
	public AmenitiesVO() {
		super();
	}

	public AmenitiesVO(int p_no, String amenities, int a_no, int atemp_no) {
		super();
		this.p_no = p_no;
		this.amenities = amenities;
		this.a_no = a_no;
		this.atemp_no = atemp_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getAmenities() {
		return amenities;
	}

	public void setAmenities(String amenities) {
		this.amenities = amenities;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public int getAtemp_no() {
		return atemp_no;
	}

	public void setAtemp_no(int atemp_no) {
		this.atemp_no = atemp_no;
	}

	@Override
	public String toString() {
		return "AmenitiesVO [p_no=" + p_no + ", amenities=" + amenities + ", a_no=" + a_no + ", atemp_no=" + atemp_no
				+ "]";
	}
	
	
	
	
}
