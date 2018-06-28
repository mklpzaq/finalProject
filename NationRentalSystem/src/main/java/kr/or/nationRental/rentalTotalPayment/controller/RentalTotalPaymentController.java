package kr.or.nationRental.rentalTotalPayment.controller;


import java.util.List;

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
import kr.or.nationRental.rentalTotalPayment.service.RequestRefundDto;

@Controller
public class RentalTotalPaymentController {
	private static final Logger logger = LoggerFactory.getLogger(RentalTotalPaymentController.class);
	@Autowired RentalTotalPaymentService rentalTotalPaymentService;
	@Autowired GoodsFacilityService goodsFacilityService;
	
	
	//결제화면에서 예약정보와 결제 정보를 바탕으로 db에 저장한 후 시민대여예약리스트에 보여준다.
	@RequestMapping(value="/insertRentalTotalPayment", method=RequestMethod.POST)
	public String insertRentalTotalPayment(RentGoodsfacilityDto rentGoodsfacilityDto
											, RentalTotalPaymentDto rentalTotalPaymentDto
											, RedirectAttributes redirectAttributes) {
		logger.debug(rentGoodsfacilityDto.toString());
		logger.debug(rentalTotalPaymentDto.toString());
		
		rentalTotalPaymentService.insertRentalTotalPayment(rentalTotalPaymentDto);
		rentalTotalPaymentService.insertRentGoodsfacility(rentGoodsfacilityDto);
		String citizenId = rentGoodsfacilityDto.getCitizenId();
		
		logger.debug("citizenId : " + citizenId);
		redirectAttributes.addAttribute("citizenId", citizenId);
		return "redirect:/viewApplicationRentForCitizen"; 
	}
	
	//결제완료리스트
	@RequestMapping(value="/selectListRentalTotalPayment", method=RequestMethod.GET)
	public String selectListRentalTotalPayment(Model model, RentalTotalPaymentDto rentalTotalPaymentDto) {
		logger.debug(rentalTotalPaymentDto.toString());
		List <RentalTotalPaymentDto> rentalTotalPaymentDtoList = rentalTotalPaymentService.selectListRentalTotalPayment();
		model.addAttribute("rentalTotalPaymentDtoList", rentalTotalPaymentDtoList);
		return "rentalTotalPayment/selectListRentalTotalPayment";
		
	}
	
	//환불신청 리스트
	@RequestMapping(value="/selectListRequestRefund", method=RequestMethod.GET)
	public String selectListRequestRefund(Model model, RequestRefundDto requestRefundDto) {
		logger.debug(requestRefundDto.toString());
		List <RequestRefundDto> requestRefundDtoList = rentalTotalPaymentService.selectListRequestRefund();
		model.addAttribute("requestRefundDtoList", requestRefundDtoList);
		return "rentalTotalPayment/selectListRequestRefund";
	}
	
		
}
