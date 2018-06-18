package kr.or.nationRental.rentGoodsFacility.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.goodsFacility.controller.GoodsFacilityController;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.login.service.MemberDto;
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
}
