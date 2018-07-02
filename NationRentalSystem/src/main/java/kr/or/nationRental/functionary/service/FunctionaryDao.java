package kr.or.nationRental.functionary.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.login.service.MemberDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestDto;

@Repository
public class FunctionaryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.functionary.service.FunctionaryMapper.";
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryDao.class);
	
	public int insertFunctionary(FunctionaryDto functionaryDto) {	
		logger.debug("FunctionaryDao - insertFunctionary - functionaryDto : " + functionaryDto);
		int row = sqlSession.insert(NS+"insertFunctionary", functionaryDto);	
		return row;
	}
	
	public int insertFunctionaryMoveInout(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertFunctionaryMoveInout - functionaryDto : " + functionaryDto);
		int row = sqlSession.insert(NS+"insertFunctionaryMoveInout", functionaryDto);
		return row;
	}
	
	public List<FunctionaryDto> selectListFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - selectListFunctionary - map : " + map.toString());
		return sqlSession.selectList(NS+"selectListFunctionary", map);
	}
	
	public int totalCountFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - totalCountFunctionary - map : " + map);
		return sqlSession.selectOne(NS+"totalCountFunctionary", map);
	}
	
	public FunctionaryDto viewFunctionaryInfo(String functionaryId) {
		logger.debug("FunctionaryDao - viewFunctionaryInfo - functionaryId : " + functionaryId);
		return sqlSession.selectOne(NS+"viewFunctionaryInfo", functionaryId);
	}
	
	public int updateFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - updateFunctionnary - functionaryDto : " + functionaryDto);
		return sqlSession.update(NS+"updateFunctionnary", functionaryDto);
	}
	
	public List<FunctionaryDto> selectAdminagency(String checkAdminagency) {
		logger.debug("FunctionaryDao - selectAdminagency - checkAdminagency : " + checkAdminagency);
		return sqlSession.selectList(NS+"selectAdminagency", checkAdminagency);		
	}
	
	public FunctionaryDto selectFunctionaryMoveInout(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectFunctionaryMoveInout - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectFunctionaryMoveInout", fuctionaryId);
	}

	public void updateFuctionaryMoveInout(FunctionaryDto returnfunctionaryMoveInoutCode) {
		logger.debug("FunctionaryDao - updateFuctionaryMoveInout - returnfunctionaryMoveInoutCode : " + returnfunctionaryMoveInoutCode);
		sqlSession.update(NS+"updateFuctionaryMoveInout", returnfunctionaryMoveInoutCode);
	}

	public void deleteFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - deleteFunctionnary - functionaryDto : " + functionaryDto);
		sqlSession.delete(NS+"deleteFunctionnary", functionaryDto);
	}

	public void insertStorageFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertStorageFunctionary - functionaryDto : " + functionaryDto);
		sqlSession.insert(NS+"insertStorageFunctionary", functionaryDto);
	}	
	
	//공무원 대여물품/시설등록한 업무 조회
	public List<GoodsFacilityDto> selectFunctionaryWorkGoodsfacility(Map<String, Object> map) {
		logger.debug("FunctionaryDao - selectFunctionaryWorkGoodsfacility - map : " + map.toString());
		return sqlSession.selectList(NS+"selectFunctionaryWorkGoodsfacility", map);
	}
	//공무원 대여물품/시설등록한 업무 조회 카운트
	public int totalCountFunctionaryWorkGoodsfacility(Map<String, Object> map) {
		logger.debug("FunctionaryDao - totalCountFunctionaryWorkGoodsfacility - map : " + map);
		return sqlSession.selectOne(NS+"totalCountFunctionaryWorkGoodsfacility", map);
	}
	
	//공무원 반납등록업무조회
	public List<ReturnGoodsfacilityInfoDto> selectFunctionaryWorkReturnGoodsfacilityInfo(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - selectFunctionaryWorkReturnGoodsfacilityInfo - memberId : " + functionaryDto);
		return sqlSession.selectList(NS+"selectFunctionaryWorkReturnGoodsfacilityInfo", functionaryDto);
	}
	
	//공무원 AS의뢰신청업무조회
	public List<UnitedAfterserviceRequestDto> selectFunctionaryWorkUnitedAfterserviceReques(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - selectFunctionaryWorkReturnGoodsfacilityInfo - memberId : " + functionaryDto);
		return sqlSession.selectList(NS+"selectFunctionaryWorkUnitedAfterserviceReques", functionaryDto);
	}
	
	//공무원 대행업체 등록 조회
	public List<AgencyDto> selectFunctionaryWorkAgency(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - selectFunctionaryWorkAgency - memberId : " + functionaryDto);
		return sqlSession.selectList(NS+"selectFunctionaryWorkAgency", functionaryDto);
	}
	//공무원 연회비/패키지 등록 조회
	public List<AnnualfeePakageDto> selectFunctionaryWorkAnnualfeePakage(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - selectFunctionaryWorkAnnualfeePakage - memberId : " + functionaryDto);
		return sqlSession.selectList(NS+"selectFunctionaryWorkAnnualfeePakage", functionaryDto);
	}

	
	
	

	/*public FunctionaryDto selectForStorageFunctionary(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectForStorageFunctionary - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectForStorageFunctionary", fuctionaryId);
	}*/
}
