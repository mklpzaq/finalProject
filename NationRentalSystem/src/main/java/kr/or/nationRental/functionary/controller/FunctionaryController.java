package kr.or.nationRental.functionary.controller;

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

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.functionary.service.FunctionaryService;

@Controller
public class FunctionaryController {
	
	@Autowired 
	private FunctionaryService functionaryService;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryController.class);
	
	//공무원 가입 화면으로 이동
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.GET)
	public String insertFunctionary() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	//공무원 가입화면에서 입력받은 데이터로 공무원기본정보테이블과 공무원이력관리테이블 두곳에 insert
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.POST)
	public String insertFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryController - insertFunctionary - functionaryDto : " + functionaryDto.toString());
		
		functionaryService.insertFunctionary(functionaryDto);
		
		return "redirect:/selectListFunctionary";
	}
	
	@RequestMapping(value="/idcehck", method=RequestMethod.GET)
	public String idcehck() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/selectListFunctionary", method=RequestMethod.GET)
	public String selectListFunctionary(Model model
										,HttpSession session
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="all") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
						logger.debug("FunctionaryController - selectListFunctionary - currentPage : " + currentPage);
						logger.debug("FunctionaryController - selectListFunctionary - pagePerRow  : " + pagePerRow);
						logger.debug("FunctionaryController - selectListFunctionary - searchSelect  : " + searchOption);
						logger.debug("FunctionaryController - selectListFunctionary - keyword  : " + keyword);
						
						Map<String, Object> map = functionaryService.selectListFunctionary(currentPage, pagePerRow, searchOption, keyword);
						model.addAttribute("list", map.get("list"));
						model.addAttribute("lastPage", map.get("lastPage"));
						model.addAttribute("currentPage", currentPage);
						model.addAttribute("startPage", map.get("startPage"));
						model.addAttribute("endPage", map.get("endPage"));
						model.addAttribute("pagePerRow", pagePerRow);
						model.addAttribute("searchOption", searchOption);
						model.addAttribute("keyword", keyword);
		
		return "/functionary/selectListFunctionary";
	}
}
