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
	
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.POST)
	public String insertFunctionary(@RequestParam(value="") String id) {
			
		return "redirect:/";
	}
}
