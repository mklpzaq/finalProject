package kr.or.nationRental.agencyEmployee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;

/* 이것의 리턴값은 페이지가 아니다. 객체로 리턴된다.
 * 스프링에서 비동기 요청에 특화된 컨트롤러 
 * 이것이 리턴할 수 있는 뷰를 만들어 주어야 한다.
 * 
 * xml, json 라이브러리를 추가하면 리턴이 각각 xml, json형태로 리턴된다.
 *  */
@RestController
public class InjeungAgencyEmployeeController {
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;
	private static final Logger logger = LoggerFactory.getLogger(InjeungAgencyEmployeeController.class);
	
	@RequestMapping(value="/injeungAgencyEmployee", method=RequestMethod.POST)
	public String injeungEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("GET injeungEmployee InjeungAgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());		
		
		
		return "T";
	}
}
