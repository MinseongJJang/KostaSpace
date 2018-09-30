package space.amenties.model.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import space.amenties.domain.AmenitiesVO;

@Repository
public class AmentiesDAOImpl implements AmentiesDAO{
@Autowired
	private SqlSession session;

@Override
public void registerAmenitiesProduct(AmenitiesVO amentiesVO) throws Exception {
	session.insert("amenitiesMapper.registerAmenitiesProduct", amentiesVO);
	
}

@Override
public void registerAmenitiesAuctionTemp(AmenitiesVO amentiesVO) throws Exception {
	session.insert("amenitiesMapper.registerAmenitiesAuctionTemp", amentiesVO);
	
}

@Override
public void registerAmenitiesAuction(AmenitiesVO amentiesVO) throws Exception {
	session.insert("amenitiesMapper.registerAmenitiesAuction", amentiesVO);
	
}

@Override
public void updateAmenitiesProduct(AmenitiesVO amentiesVO) throws Exception {
	session.update("amenitiesMapper.updateAmenitiesProduct", amentiesVO);
	
}

@Override
public void updateAmenitiesAuction(AmenitiesVO amentiesVO) throws Exception {
	session.update("amenitiesMapper.updateAmenitiesAuction", amentiesVO);
	
}

@Override
public void updateAmenitiesAuctionTemp(AmenitiesVO amentiesVO) throws Exception {
	session.update("amenitiesMapper.updateAmenitiesAuctionTemp", amentiesVO);
	
}

@Override
public AmenitiesVO getAmentiesByPNo(int p_no) throws Exception {
	System.out.println("왜안나오냐 ; " + session.selectOne("amenitiesMapper.getAmentiesByPNo",p_no));
	return session.selectOne("amenitiesMapper.getAmentiesByPNo",p_no);
}

@Override
public AmenitiesVO getAmentiesByANo(int a_no) throws Exception {
	System.out.println("왜안나오냐 ; " + session.selectOne("amenitiesMapper.getAmentiesByANo",a_no));
	return session.selectOne("amenitiesMapper.getAmentiesByANo",a_no);
}

@Override
public AmenitiesVO getAmentiesByAtempNo(int atemp_no) throws Exception {
	return session.selectOne("amenitiesMapper.getAmentiesByANo",atemp_no);
}
	

}
