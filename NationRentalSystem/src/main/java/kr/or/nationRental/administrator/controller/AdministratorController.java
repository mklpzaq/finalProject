package kr.or.nationRental.administrator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdministratorController {
  

	@RequestMapping(value="/insertAdmin", method=RequestMethod.GET)
	public String insertAdmin() {
			
		return "/test";
	}
}
