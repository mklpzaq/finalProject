package kr.or.nationRental.functionary.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;
import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.functionary.service.FunctionaryService;

@RestController
public class FunctionaryRestController {
	
	@Autowired
	private FunctionaryService functionaryService;
	
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;	
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryRestController.class);
		
	@RequestMapping(value="/selectAdminagency", method=RequestMethod.POST)
	public List<FunctionaryDto> selectAdminagency(@RequestParam(value="checkAdminagency") String checkAdminagency) {
		logger.debug("FunctionaryRestController - selectAdminagency - checkAdminagency : " + checkAdminagency);
		List<FunctionaryDto> list = null;
		if(checkAdminagency != "") {
			list = functionaryService.selectAdminagency(checkAdminagency);
		}else {
			list = null;
		}
		logger.debug("FunctionaryRestController - selectAdminagency - list : " + list.toString());
		return list;
	}
	
	@RequestMapping(value="/idCheck", method=RequestMethod.GET)
	public String idCheck(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST idCheck AgencyEmployeeRestController");
		logger.debug(agencyEmployeeDto.toString());
		/*
		 * Administrator, Functionary, AgencyEmployee, Citizen 테이블을 모두 참조해
		 * ID 중복이 있는지를 체크한다.
		 * ID 중복이 발생하였다면, result 변수에 F 가 초기화되고
		 * ID 중복이 발생하지 아니하였다면, result 변수에 T 가 초기화된다.
		 * */
		
		String result = agencyEmployeeService.idCheck(agencyEmployeeDto);
		
		return result;
	}
		
}
