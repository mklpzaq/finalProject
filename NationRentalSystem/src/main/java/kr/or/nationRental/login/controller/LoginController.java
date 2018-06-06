package kr.or.nationRental.login.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.agencyEmployee.controller.AgencyEmployeeController;
import kr.or.nationRental.login.service.LoginService;
import kr.or.nationRental.login.service.MemberDto;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin() {
		
		return "login/loginForm";
	}
	
	/* 
	 * 회원(citizen, agencyEmployee, Adminstrator, Functionary를 Member로 정의한다.)에 공통된
	 * ID, PW정보를 MemberDto로 넘겨받는다.
	 *  */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String getLogin(MemberDto memberDto
							,HttpSession session) {
		logger.debug("POST getLogin LoginController");
		logger.debug(memberDto.toString());
		loginService.login(memberDto, session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String getLogout(HttpSession session) {
		logger.debug("GET getLogout LoginController");
		loginService.logout(session);
		
		return "redirect:/";
	}
	
}


















