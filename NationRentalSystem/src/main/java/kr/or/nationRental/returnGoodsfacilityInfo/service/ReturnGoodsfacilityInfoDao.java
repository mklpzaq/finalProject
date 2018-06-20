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

	public ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoCheck(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("ReturnGoodsfacilityInfoDao - returnGoodsfacilityInfoCheck - goodsFacilityDto : " + goodsFacilityDto.toString());
		return sqlsession.selectOne(NS + "returnGoodsfacilityInfoCheck", goodsFacilityDto);
	}

	public int selectOneGoodsfacilityRentalIsOrderedDelivery(int goodsfacilityRentalCode) {
		
		return sqlsession.selectOne(NS+"selectOneGoodsfacilityRentalIsOrderedDelivery", goodsfacilityRentalCode);
	}

	public List<StateGoodsDto> stateGoodsCode() {
		return sqlsession.selectList(NS + "stateGoodsCode");
	}

	public void insertReturnGoodsfacilityInfo(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto) {
		
		sqlsession.insert(NS+"insertReturnGoodsfacilityInfo", returnGoodsfacilityInfoDto);
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
