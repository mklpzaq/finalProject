package kr.or.nationRental.agencyEmployee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;

@Controller
public class AgencyEmployeeController {
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeController.class);
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.POST)
	public String insertAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST insertAgencyEmployee AgencyEmployeeController");
		/*
		 * 여기부분에 인서트부분을 구현해야 한다.
		 * */
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/getInsertAgencyEmployeeForm", method=RequestMethod.POST)
	public String getInsertAgencyEmployeeForm(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST insertEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		/* 
		 * getAgencyNameForInsert 매서드의 결과로 
		 * agencyEmployeeDto에는 agencyName 정보와  agencyEmployeeInjeungNum가 존재하게 되고,
		 * agencyInfo라는 이름의 key값으로 model에 담아 포워드로 
		 * insertAgencyEmployeeForm.jsp로 넘어가게 된다.
		 *  */
		agencyEmployeeDto = agencyEmployeeService.getAgencyNameForInsert(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		model.addAttribute("agencyInfo", agencyEmployeeDto);
		return "agencyEmployee/insertAgencyEmployeeForm";
	}
	
	@RequestMapping(value="/goInjeungAgencyEmployee", method=RequestMethod.GET)
	public String goInjeungEmployee() {
		logger.debug("GET goInjeungEmployee AgencyEmployeeController");
		return "agencyEmployee/injeungAgencyemployeeForm";
	}
}











