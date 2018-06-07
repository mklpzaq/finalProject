package kr.or.nationRental.citizen.controller;



import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.citizen.service.CitizenService;


@Controller
public class CitizenController {
	
	@Autowired
	private CitizenService citizenService;
	
	private static final Logger logger = LoggerFactory.getLogger(CitizenController.class);
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.GET)
	public String insertCitizen() {
			
		return "citizen/insertCitizenForm";
	}
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.POST)
	public String insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenController insertCitizen Post : " + citizenDto.toString()); 
		citizenService.insertCitizen(citizenDto);
		   
		return "redirect:/getCitizenList"; 
	}
	
	@RequestMapping(value="/getCitizenList", method=RequestMethod.GET)
	public String getCitizenList(Model model
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage
								,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
								,@RequestParam(value="searchOption", defaultValue="citizenId") String searchOption
								,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("CitizenController getCitizenList searchSelect : " + searchOption);
		logger.debug("CitizenController getCitizenList  searchWord : " + keyword);
		
		Map<String, Object> map = citizenService.getCitizenList(currentPage, pagePerRow, searchOption, keyword);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		logger.debug("list : "+ map.get("list"));
		logger.debug("lastPage : "+ map.get("lastPage"));
		logger.debug("beginPageNumForCurrentPage : "+ map.get("beginPageNumForCurrentPage"));
		logger.debug("currentPage : "+ currentPage);
		logger.debug("pagePerRow : "+ pagePerRow);
		logger.debug("searchOption : " + searchOption);
		logger.debug("keyword : " + keyword);
		
		
		return "/citizen/selectCitizenList";
	}
	
	
	
	
	
}
