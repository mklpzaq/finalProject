package kr.or.nationRental.login.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.agencyEmployee.controller.AgencyEmployeeController;
import kr.or.nationRental.login.service.LoginService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String insertAgencyEmployee() {
		/*
		 * 시민, 관리자, 직원, 공무원 가입되어있는 상태에서 진행
		 * */
		
		
		return "redirect:/";
	}
}
