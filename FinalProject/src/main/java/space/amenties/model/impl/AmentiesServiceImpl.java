package space.amenties.model.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import space.amenties.domain.AmenitiesVO;

@Service
public class AmentiesServiceImpl implements AmentiesService{
@Autowired
	private AmentiesDAO dao;

@Override
public void registerAmenitiesProduct(AmenitiesVO amentiesVO) throws Exception {
	dao.registerAmenitiesProduct(amentiesVO);
	
}

@Override
public void registerAmenitiesAuctionTemp(AmenitiesVO amentiesVO) throws Exception {
	dao.registerAmenitiesAuctionTemp(amentiesVO);
	
}

@Override
public void registerAmenitiesAuction(AmenitiesVO amentiesVO) throws Exception {
	dao.registerAmenitiesAuction(amentiesVO);
	
}

@Override
public void updateAmenitiesProduct(AmenitiesVO amentiesVO) throws Exception {
	dao.updateAmenitiesProduct(amentiesVO);
	
}

@Override
public void updateAmenitiesAuction(AmenitiesVO amentiesVO) throws Exception {
	dao.updateAmenitiesAuction(amentiesVO);
	
}

@Override
public void updateAmenitiesAuctionTemp(AmenitiesVO amentiesVO) throws Exception {
	dao.updateAmenitiesAuctionTemp(amentiesVO);
	
}

@Override
public AmenitiesVO getAmentiesByPNo(int p_no) throws Exception {
	System.out.println("일루안오냐?");
	return dao.getAmentiesByPNo(p_no);
}

@Override
public AmenitiesVO getAmentiesByANo(int a_no) throws Exception {
	
	return dao.getAmentiesByANo(a_no);
}

@Override
public AmenitiesVO getAmentiesByAtempNo(int atemp_no) throws Exception {
	
	return dao.getAmentiesByAtempNo(atemp_no);
}
	

}
