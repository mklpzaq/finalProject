package kr.or.nationRental.agencyEmployee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;



@Controller
public class AgencyEmployeeController {
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeController.class);
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.GET)
	public String insertEmployee() {
		return "/employee/insertEmployeeForm";
	}
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.POST)
	public String insertEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		
		return "/employee/insertEmployeeForm";
	}
}
