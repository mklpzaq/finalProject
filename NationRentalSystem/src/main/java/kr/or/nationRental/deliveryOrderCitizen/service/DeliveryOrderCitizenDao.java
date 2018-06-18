package kr.or.nationRental.deliveryOrderCitizen.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryOrderCitizenDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	final String NS = "kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenMapper.";
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderCitizenDao.class);

	public void insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.insert(NS+"insertDeliveryOrderCitizen", deliveryOrderCitizenDto);
	}

	public List<DeliveryOrderCitizenDto> selectListMyDeliveryOrderCitizen(String memberId) {
		logger.debug("DeliveryOrderCitizenDao - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		return sqlSession.selectList(NS+"selectListMyDeliveryOrderCitizen", memberId);		
	}

	public DeliveryOrderCitizenDto updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectOne(NS+"updateViewDeliveryOrderCitizenAddress", deliveryOrderCitizenDto);
	}

	public void updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.update(NS+"updateDeliveryOrderCitizenAddress", deliveryOrderCitizenDto);		
	}

	public void updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.update(NS+"updateIsCanceledDelivery", deliveryOrderCitizenDto);		
		
	}

	public List<DeliveryOrderCitizenDto> selectListDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - selectListDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectList(NS+"selectListDeliveryOrderCitizen", deliveryOrderCitizenDto);		
	}
	
}
