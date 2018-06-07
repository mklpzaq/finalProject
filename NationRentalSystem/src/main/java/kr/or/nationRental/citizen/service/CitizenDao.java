package kr.or.nationRental.citizen.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CitizenDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	final String NS ="kr.or.nationRental.citizen.service.CitizenMapper.";
	
	private static final Logger logger = LoggerFactory.getLogger(CitizenDao.class);
	
	public int insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenDao insertCitizen : " + citizenDto.toString());
		
		int row = sqlsession.insert(NS+"insertCitizen", citizenDto);
		
		return row;
	}

}
