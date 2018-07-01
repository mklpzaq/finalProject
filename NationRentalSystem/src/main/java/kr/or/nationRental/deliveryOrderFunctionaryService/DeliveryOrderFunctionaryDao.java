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
	
	public int totalCountDeliveryOrderCitizenForAfterservice(Map<String, Object> map) {
		logger.debug("totalCountDeliveryOrderCitizenForAfterservice DeliveryOrderFunctionaryDao");
		return sqlSession.selectOne(NS+"totalCountDeliveryOrderCitizenForAfterservice", map);
	}
	
	public List<DeliveryOrderFunctionaryDto> selectListDeliveryOrderCitizenForAfterservice(Map<String, Object> map){
		logger.debug("selectListDeliveryOrderCitizenForAfterservice DeliveryOrderFunctionaryDao");
		return sqlSession.selectList(NS+"selectListDeliveryOrderCitizenForAfterservice", map);
	}
}
