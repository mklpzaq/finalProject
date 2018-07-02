package kr.or.nationRental.login.controller;


import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
		//id찾기 화면으로 이동
		@RequestMapping(value="/idSelect", method=RequestMethod.GET)
		public String idSelect() {
			
			
			return "/login/idSelect";
		}
		
		/*id찾기
		 *id찾기의 프로세스
		 *폼에서 가입된 아이디의 이름과 전화번호, 이메일을 넘겨받는다
		 *넘겨받은 아이디와 이름, 전화번호, 이메일로
		 */
		@RequestMapping(value="/idSelect", method=RequestMethod.POST)
		public String idSelect(MemberDto memberDto
							,Model model) {
			logger.debug("FunctionaryController - idSelect - memberDto : " + memberDto.toString());	
			Map <String, Object> map = loginService.idSelect(memberDto);
			
			
			model.addAttribute("map", map);
			//logger.debug("FunctionaryController - idSelect - map : " + map.get("administratorDto").);	
			/*if(map.get("adminId") != null) {
			model.addAttribute("adminId", map.get("adminId"));
			}
			if( map.get("agencyEmployeeId") != null) {
			model.addAttribute("agencyEmployeeId", map.get("agencyEmployeeId"));
			}
			if(map.get("citizenId") != null) {
			model.addAttribute("citizenId", map.get("citizenId"));
			}
			if(map.get("functionaryId") != null) {
			model.addAttribute("functionaryId", map.get("functionaryId"));
			}*/
			return "/login/checkId";
		}
	
}


















