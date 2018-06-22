package kr.or.nationRental.rentalTotalPayment.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;
import kr.or.nationRental.rentalTotalPayment.service.RentalTotalPaymentDto;
import kr.or.nationRental.rentalTotalPayment.service.RentalTotalPaymentService;

@Controller
public class RentalTotalPaymentController {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentController.class);
	@Autowired RentalTotalPaymentService rentalTotalPaymentService;
	@Autowired GoodsFacilityService goodsFacilityService;
	
	//예약 화면에서 선택된 정보를 가지고 와 셋팅한다.
	@RequestMapping(value="/selectListRentalTotalPayment", method=RequestMethod.POST)
	public String selectListRentalTotalPayment(Model model, RentGoodsfacilityDto rentGoodsfacilityDto) {
		logger.debug(rentGoodsfacilityDto.toString());
		rentalTotalPaymentService.insertRentGoodsfacility(rentGoodsfacilityDto);
		model.addAttribute("rentGoodsfacilityDto", rentGoodsfacilityDto);
		return "rentalTotalPayment/selectRentalTotalPaymentForm";
		
	}
	@RequestMapping(value="/insertRentalTotalPayment", method=RequestMethod.POST)
	public String insertRentalTotalPayment(RentGoodsfacilityDto rentGoodsfacilityDto
											, RentalTotalPaymentDto rentalTotalPaymentDto
											, RedirectAttributes redirectAttributes) {
		logger.debug(rentGoodsfacilityDto.toString());
		logger.debug(rentalTotalPaymentDto.toString());
		
		rentalTotalPaymentService.insertRentalTotalPayment(rentalTotalPaymentDto);
		rentalTotalPaymentService.insertRentGoodsfacility(rentGoodsfacilityDto);
		String citizenId = rentGoodsfacilityDto.getCitizenId();
		
		logger.debug("★★★★★★citizenId★★★★★★★★★★★★★★★");
		logger.debug("citizenId : " + citizenId);
		redirectAttributes.addAttribute("citizenId", citizenId);
		return "redirect:/viewApplicationRentForCitizen"; 
	}
	
	
}
