package kr.or.nationRental.agencyEmployee.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgencyEmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeDao.class);
	final String NS = "kr.or.nationRental.agencyEmployee.service.AgencyEmployeeMapper.";
	
	public int insertAgencyNakchalEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("insertAgencyNakchalEmployee AgencyEmployeeDao");
		return sqlSession.insert(NS+"insertAgencyNakchalEmployee", agencyEmployeeDto);
	}
	
	public int insertAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("insertAgencyEmployee AgencyEmployeeDao");
		return sqlSession.insert(NS+"insertAgencyEmployee", agencyEmployeeDto);
	}
	
	public int idCheckAdministrator(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheckAdministrator AgencyEmployeeDao");
		return sqlSession.selectOne(NS+"idCheckAdministrator", agencyEmployeeDto);
	}
	
	public int idCheckFunctionary(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheckFunctionary AgencyEmployeeDao");
		return sqlSession.selectOne(NS+"idCheckFunctionary", agencyEmployeeDto);
	}
	
	public int idCheckAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheckAgencyEmployee AgencyEmployeeDao");
		return sqlSession.selectOne(NS+"idCheckAgencyEmployee", agencyEmployeeDto);
	}
	
	public int idCheckCitizen(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheckCitizen AgencyEmployeeDao");
		return sqlSession.selectOne(NS+"idCheckCitizen", agencyEmployeeDto);
	}
	
	public AgencyEmployeeDto getAgencyNameForInsert(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("getAgencyNameForInsert AgencyEmployeeDao");
		agencyEmployeeDto = sqlSession.selectOne(NS+"getAgencyNameForInsert", agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		return agencyEmployeeDto;
	}
	
	public int injeungAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("injeungAgencyEmployee AgencyEmployeeDao");
		int result = sqlSession.selectOne(NS+"injeungAgencyEmployee", agencyEmployeeDto);
		
		return result;
	}
}
