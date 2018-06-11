package kr.or.nationRental.agencyEmployee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;

@Controller
public class AgencyEmployeeController {
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeController.class);
	
	/*@RequestMapping(value="/updateAgencyEmployee", method=RequestMethod.GET)
	public String updateAgencyEmployee(Model model
										,@RequestParam(value="sendNo") int articleId) {
		logger.debug("updateAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeDto = agencyEmployeeService.updateAgencyEmployee(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		 업데이트 시킨 후 업데이트된 정보를 회원정보 화면으로 넘긴다. 
		model.addAttribute("agencyEmployeeDto", agencyEmployeeDto);
		return "agencyEmployee/viewAgencyEmployeeInfo";
	}*/
	
	@RequestMapping(value="/updateAgencyEmployee", method=RequestMethod.POST)
	public String updateAgencyEmployee(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("updateAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeDto = agencyEmployeeService.updateAgencyEmployee(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		/* 업데이트 시킨 후 업데이트된 정보를 회원정보 화면으로 넘긴다. */
		model.addAttribute("agencyEmployeeDto", agencyEmployeeDto);
		return "agencyEmployee/viewAgencyEmployeeInfo";
	}
	
	
	@RequestMapping(value="/viewAgencyEmployeeInfo", method=RequestMethod.GET)
	public String viewAgencyEmployeeInfo(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("GET viewAgencyEmployeeInfo AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeDto = agencyEmployeeService.selectOneAgencyEmployee(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		model.addAttribute("agencyEmployeeDto", agencyEmployeeDto);
		return "agencyEmployee/viewAgencyEmployeeInfo";
	}
	
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.POST)
	public String insertAgencyEmployee(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST insertAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		/*
		 * result 값이 true 일경우에는 insert가 정상적으로 이루어진 경우이다.
		 * result 값이 false 인 경우에는 insert가 정상적으로 이루어지지 않은 경우이다.
		 * */
		agencyEmployeeService.insertAgencyEmployee(agencyEmployeeDto);
		return "redirect:/joinCongratulation";
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











