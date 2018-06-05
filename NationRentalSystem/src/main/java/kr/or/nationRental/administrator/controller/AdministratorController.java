package kr.or.nationRental.administrator.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.administrator.service.AdministratorService;
import kr.or.nationRental.administrator.service.InjeungDto;
import kr.or.nationRental.administrator.service.InjeungService;


@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	private InjeungService injeungService;
	private static final Logger logger = LoggerFactory.getLogger(AdministratorController.class);
	
	//관리자 인증 GET
	@RequestMapping(value="/injeungAdministrator", method=RequestMethod.GET)
	public String injeungAdministrator() {
		logger.info("---injeungAdministrator GET");
		return "adminstrator/injeungAdminForm";
	}
	
	//관리자 인증 POST 이후 관리자 등록 화면으로 이동
	@RequestMapping(value = "/injeungAdministrator", method = RequestMethod.POST)
	public String injeungAdministrator(InjeungDto injeungDto, Model model, HttpSession session) {
		injeungDto = injeungService.selectInjeung(injeungDto);
		if (injeungDto == null) {
			model.addAttribute("injeungDto", injeungDto);
			return "adminstrator/injeungAdminForm";
		}
		session.setAttribute("injeung", injeungDto);
		return "redirect:/insertAdminForm";	
	}
	
	
	
	
	
/*	
	//관리자등록 GET
	//insertAdminForm.jsp를 포워드방식으로 호출한다.
	@RequestMapping(value="/insertAdministrator", method=RequestMethod.GET)
	public String insertAdministrator() {
		logger.info("---insertAdministrator GET");
		return "adminstrator/insertAdminForm";
	}
	*/
	//관리자등록 POST
	@RequestMapping(value="/insertAdministrator", method=RequestMethod.POST)
	public String insertAdministrator(AdministratorDto administratordDto) {
		logger.info("---insertAdministrator POST");
		
		
		
		administratorService.insertAdministrator(administratordDto);
		return "redirect:/getAdminList";
	}
	
}