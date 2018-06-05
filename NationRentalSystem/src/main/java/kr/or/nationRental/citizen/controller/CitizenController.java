package kr.or.nationRental.citizen.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.citizen.service.CitizenService;

@Controller
public class CitizenController {
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.GET)
	public String insertCitizen() {
			
		return "citizen/insertCitizenForm";
	}
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.POST)
	public String insertCitizen(HttpSession session
								,CitizenDto citizenDto
								,Model model) {
		 
		int row = CitizenService.addCitizen(citizenDto);
		   
		return "ddf"; 
	}
}
