package kr.or.nationRental.annualfeePakage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.annualfeePakage.service.AnnualfeePakageService;

@Controller
public class AnnualfeePakageController {
	
	@Autowired
	private AnnualfeePakageService annualfeePakageService;
	//연회비등록
	@RequestMapping(value="/insertannualfeePakage", method=RequestMethod.GET)
	public String insertannualfeePakage() {
			
		return "insertannualfeePakage";
	}
}
