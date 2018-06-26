package kr.or.nationRental.donation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.donation.service.DonationDto;
import kr.or.nationRental.donation.service.DonationService;



@Controller
public class DonationController {
	@Autowired DonationService donationService;
	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);


	//회원 : 기부 신청 폼 불러오기
	@RequestMapping(value="/insertDonation", method=RequestMethod.GET)
	public String insertDonation() {
		logger.debug("insertDonation");
		return "donation/insertDonationForm";
	}
	
	//회원 : 기부 신청하기
	@RequestMapping(value = "/insertDonation", method = RequestMethod.POST)
	public String insertDonation(DonationDto donationDto) {
		logger.debug("insertDonation");
		donationService.insertDonation(donationDto);
   		return "redirect:/selectListDonation";
		}	
	
	
	//회원 : 기부신청 리스트
	
	//회원 : 기부 취소
	
	//공무원 : 기부 신청 리스트
	
	//공무원 : 기부 승인
	
	//공무원 : 기부 반려
	
	//기부 완료 리스트( 모든 회원이 볼 수 있음)
	
	
}
