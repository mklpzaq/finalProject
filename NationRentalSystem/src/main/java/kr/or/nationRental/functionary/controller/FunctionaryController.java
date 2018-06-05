package kr.or.nationRental.functionary.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.functionary.service.FunctionaryService;

@Controller
public class FunctionaryController {
	
	@Autowired 
	private FunctionaryService functionaryService;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryController.class);

	@RequestMapping(value="/insertFunctionary", method=RequestMethod.GET)
	public String insertFunctionary() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/idcehck", method=RequestMethod.GET)
	public String idcehck() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.POST)
	public String insertFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryController - insertFunctionary : " + functionaryDto.toString());
		
		functionaryService.insertFunctionary(functionaryDto);
		
		return "redirect:/selectListFunctionary";
	}
	
	@RequestMapping(value="/selectListFunctionary", method=RequestMethod.GET)
	public String selectListFunctionary(Model model) {
		
		List<FunctionaryDto> functionaryDtoList = functionaryService.selectListFunctionary();
		model.addAttribute("functionaryDtoList", functionaryDtoList);
		return "/functionary/selectListFunctionary";
	}
}
