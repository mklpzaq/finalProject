package kr.or.nationRental.annualfeePakage.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AnnualfeePakageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.annualfeePakage.service.AnnualfeePakageMapper.";
	private static final Logger logger = LoggerFactory.getLogger(AnnualfeePakageDao.class);
		
	public int insertAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - insertAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		int row = sqlSession.insert(NS+"insertAnnualfeePakage", annualfeePakageDto);
		return row;
	}

	public void insertAnnualfeePakageAuthority(Map<String, Integer> map) {
		logger.debug("AnnualfeePakageDao - insertAnnualfeePakageAuthority - map : " + map.toString());
		sqlSession.insert(NS+"insertAnnualfeePakageAuthority", map);
			
	}

	public List<AnnualfeePakageDto> selectListAnnualfeePakage(Map<String, Object> map) {
		logger.debug("AnnualfeePakageDao - selectListAnnualfeePakage - map : " + map.toString());
		return sqlSession.selectList(NS+"selectListAnnualfeePakage", map);
	}

	public int totalCountAnnualfeePakage(Map<String, Object> map) {
		logger.debug("AnnualfeePakageDao - totalCountAnnualfeePakage - map : " + map.toString());
		return sqlSession.selectOne(NS+"totalCountAnnualfeePakage", map);
	}

	public AnnualfeePakageDto annualfeePakageSangse(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - annualfeePakageSangse - annualfeePakageDto : " + annualfeePakageDto.toString());
		return sqlSession.selectOne(NS+"annualfeePakageSangse", annualfeePakageDto);
	}

	public void deleteAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - deleteAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		sqlSession.delete(NS+"deleteAnnualfeePakage", annualfeePakageDto);
	}

	public void deleteAnnualfeePakageAuthority(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - deleteAnnualfeePakageAuthority - annualfeePakageDto : " + annualfeePakageDto.toString());
		sqlSession.delete(NS+"deleteAnnualfeePakageAuthority", annualfeePakageDto);		
	}

	public void updateAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - updateAnnualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
		sqlSession.update(NS+"updateAnnualfeePakage", annualfeePakageDto);
	}

	public void deleteCheckAnnualfeePakageAuthority(Integer integer) {
		logger.debug("AnnualfeePakageDao - deleteCheckAnnualfeePakageAuthority - integer : " + integer.toString());
		sqlSession.delete(NS+"deleteCheckAnnualfeePakageAuthority", integer);
		
	}

	public void insertAnnualfeePakageOwnership(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - insertAnnualfeePakageOwnership - annualfeePakageDto : " + annualfeePakageDto.toString());
		sqlSession.insert(NS+"insertAnnualfeePakageOwnership", annualfeePakageDto);		
	}

	public List<AnnualfeePakageDto> selectListAnnualfeePakageOwnership(String memeberId) {
		logger.debug("AnnualfeePakageDao - selectListAnnualfeePakageOwnership - memeberLevel : " + memeberId);		
		return sqlSession.selectList(NS+"selectListAnnualfeePakageOwnership", memeberId);	
	}


	
	

	

	/*public int insertAnnualfeePakageAuthority(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - insertAnnualfeePakageAuthority - annualfeePakageDto : " + annualfeePakageDto.toString());
		int row = sqlSession.insert(NS+"insertAnnualfeePakageAuthority", annualfeePakageDto);
		return row;
	}*/
}
