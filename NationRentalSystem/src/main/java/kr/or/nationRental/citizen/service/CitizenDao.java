package kr.or.nationRental.citizen.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.district.service.DistrictDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;

@Repository
public class CitizenDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final String NS ="kr.or.nationRental.citizen.service.CitizenMapper.";	
	
	private static final Logger logger = LoggerFactory.getLogger(CitizenDao.class);
		
	/*public List<DistrictDto> getdistrict() {
		logger.debug("CitizenDao getdistrict : ");		
		return sqlSession.selectList(NS+"getdistrict ");
	}*/
	
	public int insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenDao insertCitizen : " + citizenDto.toString());
		
		int row = sqlSession.insert(NS+"insertCitizen", citizenDto);
		
		return row;
	}

	public List<CitizenDto> getCitizenList(Map<String, Object> map) {
		return sqlSession.selectList(NS+"getCitizenList", map);
	}

	public int totalCountCitizen(Map<String, Object> map) {
		return sqlSession.selectOne(NS+"totalCountCitizen", map);
	}

	public CitizenDto getOneCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenDao getOneCitizen : " + citizenDto.toString());
		return sqlSession.selectOne(NS+"getOneCitizen", citizenDto);
	}

	public CitizenDto updateCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenDao updateCitizen : " + citizenDto.toString());
		return sqlSession.selectOne(NS+"updateCitizen", citizenDto);
	}
	
	public int updateOneCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenDao updateOneCitizen : " + citizenDto.toString());
		return sqlSession.update(NS+"updateOneCitizen", citizenDto);
	}

	

}
