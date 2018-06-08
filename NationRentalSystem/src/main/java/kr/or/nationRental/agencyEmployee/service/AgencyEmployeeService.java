package kr.or.nationRental.agencyEmployee.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AgencyEmployeeService {
	@Autowired
	private AgencyEmployeeDao AgencyEmployeeDao;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeService.class);
	
	@Transactional
	public void insertAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("insertAgencyEmployee AgencyEmployeeService");
		AgencyEmployeeDao.insertAgencyEmployee(agencyEmployeeDto);
		AgencyEmployeeDao.insertAgencyNakchalEmployee(agencyEmployeeDto);
	}
	
	public String idCheck(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("idCheck AgencyEmployeeService");
		/*
		 * Administrator, Functionary, AgencyEmployee, Citizen 테이블을 모두 참조해
		 * ID 중복이 있는지를 체크한다.
		 * ID 중복이 발생하였다면, result 변수에 F 가 초기화되고
		 * ID 중복이 발생하지 아니하였다면, result 변수에 T 가 초기화된다.
		 * */
		String result = null;
		if(agencyEmployeeDto.getAgencyEmployeeId().equals("")) {
			logger.debug("ID를 아무것도 입력하지 않았을 경우.");
			result = "F";
		}else if(1 == AgencyEmployeeDao.idCheckAdministrator(agencyEmployeeDto)) {
			logger.debug("관리자에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == AgencyEmployeeDao.idCheckFunctionary(agencyEmployeeDto)) {
			logger.debug("공무원에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == AgencyEmployeeDao.idCheckAgencyEmployee(agencyEmployeeDto) ) {
			logger.debug("대행업체 직원에서 ID 중복이 발생함");
			result = "F";
		}else if(1 == AgencyEmployeeDao.idCheckCitizen(agencyEmployeeDto)) {
			logger.debug("시민에서 ID 중복이 발생함");
			result = "F";
		}else {
			logger.debug("ID중복이 발생하지 아니함.");
			result = "T";
		}

		return result;
	}
	
	/*
	 * agencyEmployeeDto에 담겨있는 인증번호를 통해 낙찰된 대행업체의 대행업체명을 가져온다.
	 * */
	public AgencyEmployeeDto getAgencyNameForInsert(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("getAgencyNameForInsert AgencyEmployeeService");
		agencyEmployeeDto = AgencyEmployeeDao.getAgencyNameForInsert(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		
		return agencyEmployeeDto;
	}
	
	public int injeungAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("injeungAgencyEmployee AgencyEmployeeService");
		return AgencyEmployeeDao.injeungAgencyEmployee(agencyEmployeeDto);
	}
	
	
}
