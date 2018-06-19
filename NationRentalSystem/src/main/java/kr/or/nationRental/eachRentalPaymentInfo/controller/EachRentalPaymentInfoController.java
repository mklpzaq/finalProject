package kr.or.nationRental.eachRentalPaymentInfo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.nationRental.eachRentalPaymentInfo.service.EachRentalPaymentInfoService;

@Controller
public class EachRentalPaymentInfoController {
	@Autowired private EachRentalPaymentInfoService eachRentalPaymentInfoService;
	private static final Logger logger = LoggerFactory.getLogger(EachRentalPaymentInfoService.class);
	
	
}
