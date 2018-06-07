package kr.or.nationRental.citizen.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.citizen.service.CitizenService;


@Controller
public class CitizenController {
	
	@Autowired
	private CitizenService citizenService;
	
	private static final Logger logger = LoggerFactory.getLogger(CitizenController.class);
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.GET)
	public String insertCitizen() {
			
		return "citizen/insertCitizenForm";
	}
	
	@RequestMapping(value="/insertCitizen", method=RequestMethod.POST)
	public String insertCitizen(CitizenDto citizenDto) {
		logger.debug("CitizenController insertCitizen Post : " + citizenDto.toString()); 
		citizenService.insertCitizen(citizenDto);
		   
		return "/home"; 
	}
}
