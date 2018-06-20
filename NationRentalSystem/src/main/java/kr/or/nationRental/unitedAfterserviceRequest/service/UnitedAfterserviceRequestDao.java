package kr.or.nationRental.unitedAfterserviceRequest.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.regularCheck.service.RegularCheckDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;

@Repository
public class UnitedAfterserviceRequestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestDao.class);
	final String NS = "kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestMapper.";
	
	/*public List<RegularCheckDto> selectListRegularCheck() {
		logger.debug("selectListRegularCheck UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListRegularCheck");
	}*/
	
	public UnitedAfterserviceRequestDto selectOneUnitedAfterserviceRequestDtoForInsertRegularCheckAS(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("selectOneUnitedAfterserviceRequestDtoForInsertRegularCheckAS UnitedAfterserviceRequestDao");
		unitedAfterserviceRequestDto = sqlSession.selectOne(NS+"selectOneUnitedAfterserviceRequestDtoForInsertRegularCheckAS", unitedAfterserviceRequestDto);
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★★");
		logger.debug(unitedAfterserviceRequestDto.toString());
		return unitedAfterserviceRequestDto;
	}
	
	public int totalCountRegularCheck(Map<String, Object> map) {
		logger.debug("totalCountRegularCheck UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"totalCountRegularCheck", map);
	}
	
	public List<RegularCheckDto> selectListRegularCheck(Map<String, Object> map){
		logger.debug("selectListRegularCheck UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListRegularCheck", map);
	}
	
	public int totalCountUnitedAfterserviceRequestDto(Map<String, Object> map) {
		logger.debug("totalCountUnitedAfterserviceRequestDto UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"totalCountUnitedAfterserviceRequestDto", map);
	}
	
	public List<UnitedAfterserviceRequestDto> selectListUnitedAfterserviceRequest(Map<String, Object> map) {
		logger.debug("selectListUnitedAfterserviceRequest UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListUnitedAfterserviceRequest", map);
	}
	
	public void insertUnitedAfterserviceRequest(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("insertUnitedAfterserviceRequest UnitedAfterserviceRequestDao");
		sqlSession.insert(NS+"insertUnitedAfterserviceRequest", unitedAfterserviceRequestDto);
	}
	
	public AgencyDto selectOneAgencyForAjax(AgencyDto agencyDto) {
		logger.debug("selectOneAgencyForAjax UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"selectOneAgencyForAjax", agencyDto);
	}
	
	public FunctionaryDto selectOneFunctionaryForListAgency(String functionaryId) {
		logger.debug("selectOneFunctionaryForListAgency UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"selectOneFunctionaryForListAgency", functionaryId);
	}

	public List<AgencyDto> selectListAgencyDto(FunctionaryDto functionaryDto) {
		logger.debug("selectListAgencyDto UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListAgencyDto", functionaryDto);
		
	}
	
	public UnitedAfterserviceRequestDto selectOneUnitedAfterserviceRequestDtoForInsert(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("selectOneUnitedAfterserviceRequestDtoForInsert UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"selectOneUnitedAfterserviceRequestDtoForInsert", unitedAfterserviceRequestDto);
	}
	
	public int totalCountReturnGoodsfacilityInfo(Map<String, Object> map) {
		logger.debug("totalCountReturnGoodsfacilityInfo UnitedAfterserviceRequestDao");
		return sqlSession.selectOne(NS+"totalCountReturnGoodsfacilityInfo", map);
	}
	
	public List<ReturnGoodsfacilityInfoDto> selectListReturnGoodsfacilityInfo(Map<String, Object> map){
		logger.debug("selectListBoard UnitedAfterserviceRequestDao");
		return sqlSession.selectList(NS+"selectListReturnGoodsfacilityInfo", map);
	}
}
