package kr.or.nationRental.deliveryOrderFunctionaryController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.deliveryOrderFunctionaryService.DeliveryOrderFunctionaryService;

@RestController
public class DeliveryOrderFunctionaryRestController {
	@Autowired
	private DeliveryOrderFunctionaryService deliveryOrderFunctionaryService;
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderFunctionaryController.class);
	
	/*@RequestMapping(value="/getAgencyInfoAsBusinessTypeForAjax", method=RequestMethod.GET)
	public String insertDeliveryOrderFunctionary() {
		logger.debug("insertDeliveryOrderFunctionary DeliveryOrderFunctionaryController");
		
		
		
		return "";
	}*/
	
	
	
}
