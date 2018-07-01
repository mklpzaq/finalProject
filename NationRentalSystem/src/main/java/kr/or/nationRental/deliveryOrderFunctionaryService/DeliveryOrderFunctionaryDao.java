package kr.or.nationRental.deliveryOrderFunctionaryService;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DeliveryOrderFunctionaryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderFunctionaryDao.class);
	final String NS = "kr.or.nationRental.deliveryOrderFunctionaryService.DeliveryOrderFunctionaryMapper.";
	
	public void updateGoodsfacilityStateAfterService(DeliveryOrderFunctionaryDto deliveryOrderFunctionaryDto) {
		logger.debug("updateGoodsfacilityStateAfterService DeliveryOrderFunctionaryDao");
		sqlSession.update(NS+"updateGoodsfacilityStateAfterService", deliveryOrderFunctionaryDto);
	}
	
	public void updateDeliveryOrderCitizenForAccept(DeliveryOrderFunctionaryDto deliveryOrderFunctionaryDto) {
		logger.debug("updateDeliveryOrderCitizenForAccept DeliveryOrderFunctionaryDao");
		sqlSession.update(NS+"updateDeliveryOrderCitizenForAccept", deliveryOrderFunctionaryDto);
	}
	
	public void insertDeliveryOrderFunctionary(DeliveryOrderFunctionaryDto deliveryOrderFunctionaryDto) {
		logger.debug("insertDeliveryOrderFunctionary DeliveryOrderFunctionaryDao");
		sqlSession.insert(NS+"insertDeliveryOrderFunctionary", deliveryOrderFunctionaryDto);
	}
	
	/* 공무원 소속 배달 대행업체 리스트 가져오기 */
	public List<DeliveryOrderFunctionaryDto> selectListAgencyNameAndBusinesstypeName(DeliveryOrderFunctionaryDto deliveryOrderFunctionaryDto) {
		logger.debug("selectListAgencyNameAndBusinesstypeName DeliveryOrderFunctionaryDao");
		return sqlSession.selectList(NS+"selectListAgencyNameAndBusinesstypeName", deliveryOrderFunctionaryDto);
	}
	
	public DeliveryOrderFunctionaryDto selectOneDeliveryOrderFunctionaryForInsertForm(DeliveryOrderFunctionaryDto deliveryOrderFunctionaryDto) {
		logger.debug("selectOneDeliveryOrderFunctionaryForInsertForm DeliveryOrderFunctionaryDao");
		return sqlSession.selectOne(NS+"selectOneDeliveryOrderFunctionaryForInsertForm", deliveryOrderFunctionaryDto);
	}
	
	public int totalCountDeliveryOrderCitizenForAfterservice(Map<String, Object> map) {
		logger.debug("totalCountDeliveryOrderCitizenForAfterservice DeliveryOrderFunctionaryDao");
		return sqlSession.selectOne(NS+"totalCountDeliveryOrderCitizenForAfterservice", map);
	}
	
	public List<DeliveryOrderFunctionaryDto> selectListDeliveryOrderCitizenForAfterservice(Map<String, Object> map){
		logger.debug("selectListDeliveryOrderCitizenForAfterservice DeliveryOrderFunctionaryDao");
		return sqlSession.selectList(NS+"selectListDeliveryOrderCitizenForAfterservice", map);
	}
}
