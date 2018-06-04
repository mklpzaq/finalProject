package kr.or.nationRental.functionary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FunctionaryController {

	@RequestMapping(value="/insertFunctionary", method=RequestMethod.GET)
	public String insertFunctionary() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/idcehck", method=RequestMethod.GET)
	public String idcehck() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.POST)
	public String insertFunctionary(@RequestParam(value="id") String id
									,@RequestParam(value="Password1") String Password1
									,@RequestParam(value="adminagencyCode") String adminagencyCode
									,@RequestParam(value="functionaryNum") String functionaryNum
									,@RequestParam(value="functionaryName") String functionaryName
									,@RequestParam(value="functionaryPhone") String functionaryPhone
									,@RequestParam(value="functionaryEmail") String functionaryEmail) {
			
		return "redirect:/";
	}
	
	
}
