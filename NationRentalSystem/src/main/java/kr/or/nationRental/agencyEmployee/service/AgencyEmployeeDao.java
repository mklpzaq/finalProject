package kr.or.nationRental.agencyEmployee.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AgencyEmployeeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeDao.class);
	final String NS = "kr.or.nationRental.agencyEmployee.service.AgencyEmployeeMapper.";
	
	//deleteAgencyNakchalEmployee
	public int deleteAgencyNakchalEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("deleteAgencyNakchalEmployee AgencyEmployeeDao");
		return sqlSession.delete(NS+"deleteAgencyNakchalEmployee", agencyEmployeeDto);
	}
	
	public int deleteAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("deleteAgencyEmployee AgencyEmployeeDao");
		return sqlSession.delete(NS+"deleteAgencyEmployee", agencyEmployeeDto);
	}
	
	public void updateAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("updateAgencyEmployee AgencyEmployeeDao");
		sqlSession.update(NS+"updateAgencyEmployee", agencyEmployeeDto);
	}
	
	public String getAgencyName(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("getAgencyName AgencyEmployeeDao");
		String agencyName = sqlSession.selectOne(NS+"getAgencyName", agencyEmployeeDto);
		logger.debug("★★★★★★★★★★★★★★★★");
		logger.debug("agencyName : " + agencyName);
		return agencyName;
	}
	
	public AgencyEmployeeDto selectOneAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("selectOneAgencyEmployee AgencyEmployeeDao");
		return sqlSession.selectOne(NS+"selectOneAgencyEmployee", agencyEmployeeDto);
	}
	
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
	
	/* 대행업체 인증코드 획득 = 대행업체 낙찰코드 획득 */
	public int injeungAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("injeungAgencyEmployee AgencyEmployeeDao");
		int result = sqlSession.selectOne(NS+"injeungAgencyEmployee", agencyEmployeeDto);
		
		return result;
	}
}
