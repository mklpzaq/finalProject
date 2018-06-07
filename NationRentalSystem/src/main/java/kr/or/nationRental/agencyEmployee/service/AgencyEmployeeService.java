package kr.or.nationRental.agencyEmployee.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AgencyEmployeeService {
	@Autowired
	private AgencyEmployeeDao AgencyEmployeeDao;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeService.class);
	
	public int injeungAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("injeungAgencyEmployee AgencyEmployeeService");
		return AgencyEmployeeDao.injeungAgencyEmployee(agencyEmployeeDto);
	}
}
