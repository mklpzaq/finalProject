package kr.or.nationRental.agency.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AgencyDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.agency.service.AgencyMapper.";
	private static final Logger logger = LoggerFactory.getLogger(AgencyDao.class);
	
	public int insertAgency(AgencyDto agencyDto) {
		logger.debug("AgencyDao - insertAgency - agencyDto : " + agencyDto.toString());
		
		int row = sqlSession.insert(NS + "insertAgency", agencyDto);
		
		return row;
	}

}
