package kr.or.nationRental.agency.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;


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

	public List<AgencyDto> selectListContractAgency(int adminagencyCode) {
		logger.debug("AgencyDao - selectListContractAgency - adminagencyCode : " + adminagencyCode);
		
		
		return sqlSession.selectList(NS + "selectListContractAgency", adminagencyCode);
	}
	
	public List<AgencyDto> selectListContractClosedAgency(int adminagencyCode) {
		logger.debug("AgencyDao - selectListContractClosedAgency - adminagencyCode : " + adminagencyCode);
		
		
		return sqlSession.selectList(NS + "selectListContractClosedAgency", adminagencyCode);
	}

	public int updateAgencyContractClosed(AgencyDto agencyDto) {
		logger.debug("AgencyDao - updateAgencyContractClosed - agencyDto : " + agencyDto.toString());
		int row = sqlSession.update(NS + "updateAgencyContractClosed", agencyDto);
		return row;
	}

	public void deleteAgencyNakchalEmployee(AgencyDto agencyDto) {
		logger.debug("AgencyDao - deleteAgencyNakchalEmployee - agencyDto : " + agencyDto.toString());
		
		sqlSession.delete(NS + "deleteAgencyNakchalEmployee", agencyDto);
	}

	public List<AgencyEmployeeDto> selectNullAgencyNakchalEmployee() {
		logger.debug("AgencyDao - selectNullAgencyNakchalEmployee - ");
		return sqlSession.selectList(NS + "selectNullAgencyNakchalEmployee");
	}

	public List<String> selectAgencyNakchalEmployeeId(AgencyDto agencyDto) {
		logger.debug("AgencyDao - selectAgencyNakchalEmployeeId - agencyDto : " + agencyDto.toString());
		
		return sqlSession.selectList(NS + "selectAgencyNakchalEmployeeId", agencyDto);
	}

	public AgencyEmployeeDto selectAgencyEmployee(String agencyEmployeeDtoId) {
		logger.debug("AgencyDao - selectAgencyEmployee - agencyEmployeeDtoId : " + agencyEmployeeDtoId.toString());
		
		return sqlSession.selectOne(NS + "selectAgencyEmployee2", agencyEmployeeDtoId);
	}

}
