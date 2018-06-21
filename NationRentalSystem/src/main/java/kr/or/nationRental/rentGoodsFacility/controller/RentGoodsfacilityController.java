package kr.or.nationRental.rentGoodsFacility.controller;

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

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.goodsFacility.controller.GoodsFacilityController;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.login.service.MemberDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityService;

@Controller
public class RentGoodsfacilityController {

	@Autowired
	private RentGoodsfacilityService rentGoodsfacilityService;
	private static final Logger logger = LoggerFactory.getLogger(RentGoodsfacilityController.class);
	
	@RequestMapping(value="/applicationRentFrom", method=RequestMethod.GET)
	public String insertApplicationRentForm(GoodsFacilityDto goodsFacilityDto
											,MemberDto memberDto
											,HttpSession session
											,Model model) {
		logger.debug("RentGoodsfacilityController applicationRentFrom: " + goodsFacilityDto.toString());
		logger.debug("RentGoodsfacilityController applicationRentFrom: " + session.toString());
		
		GoodsFacilityDto goodsFacilityApplication = rentGoodsfacilityService.insertApplicationRentForm(goodsFacilityDto);
		model.addAttribute("goodsFacilityApplication", goodsFacilityApplication);
		model.addAttribute("memberDto", memberDto);
		
		return "/rentGoodsFacility/insertApplicationGoodsFacility";
	}
	
	@RequestMapping(value="/applicationRentFrom", method=RequestMethod.POST)
	public String insertApplicationRentForm(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("RentGoodsfacilityController applicationRentFrom POST: " + rentGoodsfacilityDto.toString());
		rentGoodsfacilityService.insertApplicationRent(rentGoodsfacilityDto);
		return "redirect:/applicationRentFrom";
	}
	
	@RequestMapping(value="/viewApplicationRentForCitizen", method=RequestMethod.GET)
	public String viewApplicationRentForCitizen(Model model
												,CitizenDto citizenDto
												,RentGoodsfacilityDto rentGoodsfacilityDto
												,@RequestParam(value="currentPage", defaultValue="1") int currentPage
												,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
												,@RequestParam(value="searchOption", defaultValue="citizenId") String searchOption
												,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("RentGoodsfacilityController viewApplicationRentForCitizen GET: " + citizenDto.toString());
		Map<String, Object> map = rentGoodsfacilityService.getApplicationList(currentPage, pagePerRow, searchOption, keyword , citizenDto);
		logger.debug("viewApplicationRentForCitizen map : " + map.toString());
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/rentGoodsFacility/viewRentApplicationForCitizen";
	}
	
	@RequestMapping(value="/updateApplicationForm", method=RequestMethod.GET)
	public String updateApplicationForm(RentGoodsfacilityDto rentGoodsfacilityDto
										,Model model) {
		logger.debug("RentGoodsfacilityController updateApplicationForm GET: " + rentGoodsfacilityDto.toString());
		
		RentGoodsfacilityDto updateRentApp = rentGoodsfacilityService.updateRentApplication(rentGoodsfacilityDto);
		model.addAttribute("updateRentApp", updateRentApp);
		return "/rentGoodsFacility/updateRentApplicationForm";
	}
	
	@RequestMapping(value="/updateApplicationForm", method=RequestMethod.POST)
	public String updateApplicationForm(RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug("RentGoodsfacilityController updateApplicationForm POST: " + rentGoodsfacilityDto.toString());
		int result = rentGoodsfacilityService.updateApplication(rentGoodsfacilityDto);
				
		return "redirect:/viewApplicationRentForCitizen";
	}
		
}
