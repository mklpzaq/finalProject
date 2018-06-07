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
	
	@RequestMapping(value="/goInjeungAgencyEmployee", method=RequestMethod.GET)
	public String goInjeungEmployee() {
		logger.debug("GET goInjeungEmployee AgencyEmployeeController");
		
		return "agencyEmployee/injeungAgencyemployeeForm";
	}
/*		
	@RequestMapping(value="/injeungAgencyEmployee", method=RequestMethod.POST)
	public String injeungEmployee(Model model
								,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST injeungEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		
		int result = agencyEmployeeService.injeungAgencyEmployee(agencyEmployeeDto);
		String returnAddress = "/injeungAgencyEmployee";
		if(1 == result) {
			logger.debug("인증성공");
			model.addAttribute("isInjeung", "인증성공");
			returnAddress = "agencyEmployee/insertAgencyEmployeeForm";
		}else {
			logger.debug("인증실패");
			model.addAttribute("isInjeung", "인증실패");
			returnAddress = "redirect:/injeungAgencyEmployee";
		}
		
		
		 * 리턴 주소 토글 인증완료/인증못할때.
		 * 
		
		return returnAddress;
	}*/
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.GET)
	public String insertEmployee() {
		return "/agencyEmployee/insertAgencyEmployeeForm";
	}
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.POST)
	public String insertEmployee(AgencyEmployeeDto agencyEmployeeDto) {
		
		return "redirect:/";
	}
}
