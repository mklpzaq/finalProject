package kr.or.nationRental.unitedAfterserviceRequest.service;

import java.util.List;

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
	
	public List<ReturnGoodsfacilityInfoDto> selectListReturnGoodsfacilityInfo(){
		logger.debug("selectListReturnGoodsfacilityInfo UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListReturnGoodsfacilityInfo");
	}
}
