package kr.or.nationRental.administrator.controller;

import java.util.List;

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
import kr.or.nationRental.login.service.MemberDto;


@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	private AdministratorDto administratorDto;
	private MemberDto memberDto;
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
	public String insertAdministrator(AdministratorDto administratorDto) {
		logger.info("---insertAdministrator POST");
		administratorService.insertAdministrator(administratorDto);
		return "redirect:/selectListAdministrator";  // 나중엔 관리자 메인페이지로 이동시키자.
	}
	
	//관리자 계정 목록
	@RequestMapping(value="/selectListAdministrator", method=RequestMethod.GET)
	public String selectListAdministrator(Model model) {
		List<AdministratorDto> administratorDtoList = administratorService.selectListAdministrator();
		model.addAttribute("administratorDtoList", administratorDtoList);
		return "adminstrator/selectListAdmin";
	}
	
	//관리자 정보 수정화면 불러오기 GET
	//계획 : 내정보수정 버튼을 누르면 수정하기 버튼이 있는 화면으로 이동시킨다.
	@RequestMapping(value = "/updateAdministrator", method = RequestMethod.GET)
	public String updateAdministrator(AdministratorDto administratorDto, Model model) {
		logger.info("---updateAdministrator GET" + administratorDto);
		AdministratorDto administratorUpdate = administratorService.updateAdministratorForm(administratorDto);		
		model.addAttribute("administratorUpdate", administratorUpdate);
		return "adminstrator/updateAdministratorForm";  
	}  
	
	//관리자 정보 수정하기 POST
	//계획 : 수정이 완료되면  수정하기 버튼이 있는 화면으로 이동시킨다.
	@RequestMapping(value = "/updateAdministrator", method = RequestMethod.POST)
	public String updateAdministrator(AdministratorDto administratorDto) {
		logger.info("---updateAdministrator POST" + administratorDto);
		int row = administratorService.updateAdministrator(administratorDto);
		return "redirect:/selectListAdministrator";  // 나중에 경로 바꾸기
	} 	
}