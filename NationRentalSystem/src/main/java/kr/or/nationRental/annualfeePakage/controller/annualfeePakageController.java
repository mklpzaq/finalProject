package kr.or.nationRental.annualfeePakage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class annualfeePakageController {
	
	//연회비등록
	@RequestMapping(value="/insertannualfeePakage", method=RequestMethod.GET)
	public String insertannualfeePakage() {
			
		return "insertannualfeePakage";
	}
}
