package kr.or.nationRental.unitedAfterserviceRequest.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;

@Repository
public class UnitedAfterserviceRequestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestDao.class);
	final String NS = "kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestMapper.";
	
	public int totalCountReturnGoodsfacilityInfo(Map<String, Object> map) {
		logger.debug("totalCountReturnGoodsfacilityInfo UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"totalCountReturnGoodsfacilityInfo", map);
	}
	
	public List<ReturnGoodsfacilityInfoDto> selectListReturnGoodsfacilityInfo(Map<String, Object> map){
		logger.debug("selectListBoard UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListReturnGoodsfacilityInfo", map);
	}
}
