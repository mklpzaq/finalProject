package kr.or.nationRental.administrator.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.administrator.service.Administrator;
import kr.or.nationRental.administrator.service.AdministratorService;


@Controller
public class AdministratorController {
	@Autowired
	private AdministratorService administratorService;
	private static final Logger logger = LoggerFactory.getLogger(AdministratorController.class);
	
	//관리자를 새로 추가하는 폼을 보여준다.
	//insertAdminForm.jsp를 포워드방식으로 호출한다.
	@RequestMapping(value="/insertAdminForm", method=RequestMethod.GET)
	public String insertAdmin() {
		return "adminstrator/insertAdminForm";
	}
	
}