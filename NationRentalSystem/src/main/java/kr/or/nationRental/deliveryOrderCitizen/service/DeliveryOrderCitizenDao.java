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
	
	//배달신청등록 기능
	public void insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.insert(NS+"insertDeliveryOrderCitizen", deliveryOrderCitizenDto);
	}
	//배달신청조회 기능
	public List<DeliveryOrderCitizenDto> selectListMyDeliveryOrderCitizen(String memberId) {
		logger.debug("DeliveryOrderCitizenDao - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		return sqlSession.selectList(NS+"selectListMyDeliveryOrderCitizen", memberId);		
	}
	
	//신청한 배달의 주소지를 수정하는 화면으로 이동
	public DeliveryOrderCitizenDto updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectOne(NS+"updateViewDeliveryOrderCitizenAddress", deliveryOrderCitizenDto);
	}
	
	//신청한 배달의 주소지를 수정기능
	public void updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.update(NS+"updateDeliveryOrderCitizenAddress", deliveryOrderCitizenDto);		
	}
	
	//배달신청을 취소하는 기능
	public void updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		sqlSession.update(NS+"updateIsCanceledDelivery", deliveryOrderCitizenDto);		
		
	}
	
	//공무원이 시민의 배달신청을 조회
	public List<DeliveryOrderCitizenDto> selectListDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - selectListDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectList(NS+"selectListDeliveryOrderCitizen", deliveryOrderCitizenDto);		
	}
	
	//배달을 신청하는 시민의 주소를 보내는 사람 주소에 셋팅하는 Dao
	public DeliveryOrderCitizenDto insertDeliveryOrderCitizenAddressSelect(
			DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - insertDeliveryOrderCitizenAddressSelect - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectOne(NS+"insertDeliveryOrderCitizenAddressSelect", deliveryOrderCitizenDto);
	}
	
	//배달시킬 행정기관의 주소를 받는 사람 주소에 셋팅Dao
	public DeliveryOrderCitizenDto insertDeliveryOrderAdminagencyAddressSelect(
			DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenDao - insertDeliveryOrderAdminagencyAddressSelect - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return sqlSession.selectOne(NS+"insertDeliveryOrderAdminagencyAddressSelect", deliveryOrderCitizenDto);
	}
	
}
