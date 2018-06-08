package kr.or.nationRental.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.agency.service.AgencyService;
import kr.or.nationRental.functionary.controller.FunctionaryController;
import kr.or.nationRental.functionary.service.FunctionaryService;

@Controller
public class AgencyController {
	
	
	/*@Autowired 
	private AgencyService agencyService;*/
	
	private static final Logger logger = LoggerFactory.getLogger(AgencyController.class);
	
	//공무원 가입 화면으로 이동
	@RequestMapping(value="/insertAgencyService", method=RequestMethod.GET)
	public String insertFunctionary() {
			
		return "/agency/insertAgencyServiceForm";
	}
	
}
