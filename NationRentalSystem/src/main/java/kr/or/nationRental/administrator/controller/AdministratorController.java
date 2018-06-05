package kr.or.nationRental.administrator.controller;

import java.util.List;
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

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.administrator.service.AdministratorService;
import kr.or.nationRental.administrator.service.InjeungDto;
import kr.or.nationRental.administrator.service.InjeungService;
import kr.or.nationRental.functionary.service.FunctionaryDto;


@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	
	@Autowired
	private InjeungService injeungService;
	private static final Logger logger = LoggerFactory.getLogger(AdministratorController.class);
	
	//관리자 인증 GET
	@RequestMapping(value="/injeungAdministrator", method=RequestMethod.GET)
	public String injeungAdministrator() {
		logger.info("---injeungAdministrator GET");
		return "adminstrator/injeungAdminForm";
	}
	
	//관리자 인증 POST insertAdminForm.jsp로 이동
	@RequestMapping(value = "/injeungAdministrator", method = RequestMethod.POST)
	public String injeungAdministrator(InjeungDto injeungDto, Model model, HttpSession session) {
		logger.info("---injeungAdministrator POST");
		InjeungDto injeung = injeungService.selectInjeung(injeungDto);
		if (injeung == null) {
			model.addAttribute("injeungNum", injeungDto);
			return "adminstrator/injeungAdminForm";
		}
		session.setAttribute("injeung", injeung);
		return "adminstrator/insertAdminForm";	
	}	
	
	//관리자등록 POST
	@RequestMapping(value="/insertAdministrator", method=RequestMethod.POST)
	public String insertAdministrator(AdministratorDto administratordDto) {
		logger.info("---insertAdministrator POST");
		administratorService.insertAdministrator(administratordDto);
		return "redirect:/selectListAdministrator";
	}
	
	//관리자 계정 목록
	@RequestMapping(value="/selectListAdministrator", method=RequestMethod.GET)
	public String selectListAdministrator(Model model) {
		List<AdministratorDto> administratorDtoList = administratorService.selectListAdministrator();
		model.addAttribute("administratorDtoList", administratorDtoList);
		return "adminstrator/selectListAdmin";
	}
	
}