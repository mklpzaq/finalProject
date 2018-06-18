package kr.or.nationRental.deliveryOrderCitizen.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenDto;
import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenService;

@Controller
public class DeliveryOrderCitizenController {
	
	@Autowired
	private DeliveryOrderCitizenService deliveryOrderCitizenService;
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderCitizenController.class);
	
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.GET)
	public String insertDeliveryOrderCitizen() {
		
				
		return "/citizen/insertDeliveryOrderCitizenform";
	}
	
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.POST)
	public String insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenController - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenService.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
		return "/citizen/insertDeliveryOrderCitizenform";
	} 
}
