package space.amenties.model.impl;



import space.amenties.domain.AmenitiesVO;

public interface AmentiesDAO {
	public void registerAmenitiesProduct(AmenitiesVO amentiesVO)throws Exception;
	public void registerAmenitiesAuctionTemp(AmenitiesVO amentiesVO)throws Exception;
	public void registerAmenitiesAuction(AmenitiesVO amentiesVO)throws Exception;
	public void updateAmenitiesProduct(AmenitiesVO amentiesVO)throws Exception;
	public void updateAmenitiesAuction(AmenitiesVO amentiesVO)throws Exception;
	public void updateAmenitiesAuctionTemp(AmenitiesVO amentiesVO)throws Exception;
	public AmenitiesVO getAmentiesByPNo(int p_no)throws Exception;
	public AmenitiesVO getAmentiesByANo(int a_no)throws Exception;
	public AmenitiesVO getAmentiesByAtempNo(int atemp_no)throws Exception;
	
}
