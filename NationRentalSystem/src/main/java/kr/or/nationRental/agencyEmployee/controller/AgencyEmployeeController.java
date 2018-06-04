package kr.or.nationRental.agencyEmployee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AgencyEmployeeController {
	@RequestMapping(value="/insertEmployee", method=RequestMethod.GET)
	public String insertEmployee() {
			
		return "";
	}
}
