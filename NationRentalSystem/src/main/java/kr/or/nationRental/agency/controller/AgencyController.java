package kr.or.nationRental.agency.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AgencyController {
	
	
	/*@Autowired 
	private AgencyService agencyService;*/
	
	private static final Logger logger = LoggerFactory.getLogger(AgencyController.class);
	
	//대행업체 등록 화면으로 이동
	@RequestMapping(value="/insertAgencyForm", method=RequestMethod.GET)
	public String insertAgencyForm() {
			
		return "/agency/insertAgencyForm";
	}
	
}
