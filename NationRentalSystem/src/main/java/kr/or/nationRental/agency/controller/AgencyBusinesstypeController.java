package kr.or.nationRental.agency.controller;

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

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.agency.service.AgencyBusinesstypeDto;
import kr.or.nationRental.agency.service.AgencyBusinesstypeService;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;

@Controller
public class AgencyBusinesstypeController {
	private static final Logger logger = LoggerFactory.getLogger(AgencyBusinesstypeController.class);
	@Autowired private AgencyBusinesstypeService agencyBusinesstypeService;
	
	//대행업체 업종 목록
	@RequestMapping(value="/selectListAgencyBusinesstype", method=RequestMethod.GET)
	public String selectListAgencyBusinesstype(Model model
										,HttpSession session
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="all") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("selectListGoodsFacilityCategory - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategory - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategory - searchSelect  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategory - keyword  : " + keyword);
		
		Map<String, Object> map = agencyBusinesstypeService.selectListAgencyBusinesstype(currentPage, pagePerRow, searchOption, keyword);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
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
		
		return "agency/selectListAgencyBusinesstype";
	}
	
	//업종추가 폼 불러오기
	@RequestMapping(value = "/insertAgencyBusinesstype", method = RequestMethod.GET)
	public String insertAgencyBusinesstype() {
		logger.debug("---insertAgencyBusinesstype");
   		return "agency/insertAgencyBusinesstypeForm";
	}
	
	//업종 추가
	@RequestMapping(value = "/insertAgencyBusinesstype", method = RequestMethod.POST)
	public String insertAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("insertAgencyBusinesstype");
		agencyBusinesstypeService.insertAgencyBusinesstype(agencyBusinesstypeDto);
   		return "redirect:/selectListAgencyBusinesstype";
	}
	
	//업종 수정 폼 불러오기
	@RequestMapping(value = "/updateAgencyBusinesstypeForm", method = RequestMethod.GET)
	public String updateAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto, Model model) {
		logger.debug("updateAgencyBusinesstype");
		AgencyBusinesstypeDto updateAgencyBusinesstype = agencyBusinesstypeService.updateAgencyBusinesstypeForm(agencyBusinesstypeDto);		
		model.addAttribute("updateAgencyBusinesstype", updateAgencyBusinesstype);
		return "agency/updateAgencyBusinesstypeForm";  
	}  
	
	//업종 수정
	@RequestMapping(value = "/updateAgencyBusinesstype", method = RequestMethod.POST)
	public String updateAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeDto) {
		logger.debug("updateAgencyBusinesstype");
		int row = agencyBusinesstypeService.updateAgencyBusinesstype(agencyBusinesstypeDto);		

		return "redirect:/selectListAgencyBusinesstype";
	} 
	
	//업종 삭제
	@RequestMapping(value = "/deleteAgencyBusinesstype", method= RequestMethod.GET)
	public String deleteAgencyBusinesstype(AgencyBusinesstypeDto agencyBusinesstypeCode) {
		agencyBusinesstypeService.deleteAgencyBusinesstype(agencyBusinesstypeCode);
		return "redirect:/selectListAgencyBusinesstype";
	}
}
