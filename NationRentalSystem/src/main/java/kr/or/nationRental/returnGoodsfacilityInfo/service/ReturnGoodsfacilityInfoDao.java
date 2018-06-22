package kr.or.nationRental.returnGoodsfacilityInfo.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;

@Repository
public class ReturnGoodsfacilityInfoDao {
	
	@Autowired private SqlSessionTemplate sqlsession;
	
	final String NS = "kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoMapper.";
	
	private static final Logger logger = LoggerFactory.getLogger(ReturnGoodsfacilityInfoDao.class);
	
	//대여/예약정보 셋팅
	public ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoCheck(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("ReturnGoodsfacilityInfoDao - returnGoodsfacilityInfoCheck - goodsFacilityDto : " + goodsFacilityDto.toString());
		return sqlsession.selectOne(NS + "returnGoodsfacilityInfoCheck", goodsFacilityDto);
	}

	public int selectOneGoodsfacilityRentalIsOrderedDelivery(int goodsfacilityRentalCode) {
		logger.debug("ReturnGoodsfacilityInfoDao - selectOneGoodsfacilityRentalIsOrderedDelivery - goodsfacilityRentalCode : " + goodsfacilityRentalCode);
		return sqlsession.selectOne(NS+"selectOneGoodsfacilityRentalIsOrderedDelivery", goodsfacilityRentalCode);
	}
	
	//선택할 수 있는 반납 상태 리스트
	public List<StateGoodsDto> stateGoodsCode() {
		logger.debug("ReturnGoodsfacilityInfoDao - stateGoodsCode : ");
		return sqlsession.selectList(NS + "stateGoodsCode");
	}
	
	//반납등록 insert
	public void insertReturnGoodsfacilityInfo(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto) {
		logger.debug("ReturnGoodsfacilityInfoDao - insertReturnGoodsfacilityInfo - returnGoodsfacilityInfoDto : " + returnGoodsfacilityInfoDto.toString());
		sqlsession.insert(NS+"insertReturnGoodsfacilityInfo", returnGoodsfacilityInfoDto);
	}
	
	//배달신청 취소 update 
	public void updateIsCanceledDelivery(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto) {
		logger.debug("ReturnGoodsfacilityInfoDao - updateIsCanceledDelivery - returnGoodsfacilityInfoDto : " + returnGoodsfacilityInfoDto.toString());
		sqlsession.update(NS+"updateIsCanceledDelivery", returnGoodsfacilityInfoDto);			
	}

	public int checkreturnGoodsfacilityInfo(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto) {
		return sqlsession.selectOne(NS+"checkreturnGoodsfacilityInfo", returnGoodsfacilityInfoDto);		
	}
	
	//등록된 반납정보 조회	
	public List<ReturnGoodsfacilityInfoDto> selectReturnGoodsfacilityInfo(Map<String, Object> map) {
		return sqlsession.selectList(NS+"selectReturnGoodsfacilityInfo", map);	
	}

	public int totalCountSelectReturnGoodsfacilityInfo(Map<String, Object> map) {		
		return sqlsession.selectOne(NS+"totalCountSelectReturnGoodsfacilityInfo", map);	
	}
}
