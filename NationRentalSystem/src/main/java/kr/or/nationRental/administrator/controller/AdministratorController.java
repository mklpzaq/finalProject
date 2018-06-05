package kr.or.nationRental.administrator.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.administrator.service.AdministratorService;


@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	private static final Logger logger = LoggerFactory.getLogger(AdministratorController.class);
	
	//관리자등록 GET
	//insertAdminForm.jsp를 포워드방식으로 호출한다.
	@RequestMapping(value="/insertAdministrator", method=RequestMethod.GET)
	public String insertAdministrator() {
		logger.info("---insertAdministrator GET");
		return "adminstrator/insertAdminForm";
	}
	
	//관리자등록 POST
	@RequestMapping(value="/insertAdministrator", method=RequestMethod.POST)
	public String insertAdministrator(AdministratorDto administratordDto) {
		logger.info("---insertAdministrator POST");
		administratorService.insertAdministrator(administratordDto);
		return "redirect:/getAdminList";
	}
	
}