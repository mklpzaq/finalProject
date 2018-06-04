package kr.or.nationRental.administrator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdministratorController {
  

	@RequestMapping(value="/insertAdminstrator", method=RequestMethod.GET)
	public String insertAdminstrator() {
			
		return "";
	}
}
