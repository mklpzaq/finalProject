package kr.or.nationRental.annualfeePakage.service;

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

	

	

	/*public int insertAnnualfeePakageAuthority(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageDao - insertAnnualfeePakageAuthority - annualfeePakageDto : " + annualfeePakageDto.toString());
		int row = sqlSession.insert(NS+"insertAnnualfeePakageAuthority", annualfeePakageDto);
		return row;
	}*/
}
