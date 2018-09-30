package space.review.domain;

public class AverageListVO {
	private int p_no;
	private double starAvg;
	public AverageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AverageListVO(int p_no, double starAvg) {
		super();
		this.p_no = p_no;
		this.starAvg = starAvg;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public double getStarAvg() {
		return starAvg;
	}
	public void setStarAvg(double starAvg) {
		this.starAvg = starAvg;
	}
	@Override
	public String toString() {
		return "AverageListVO [p_no=" + p_no + ", starAvg=" + starAvg + "]";
	}
	
	
}
