package kr.or.nationRental.nakchal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.nakchal.service.NakchalDto;
import kr.or.nationRental.nakchal.service.NakchalService;

@Controller
public class NakchalController {
	/*@Autowired
	private NakchalService nakchalService;*/
	private static final Logger logger = LoggerFactory.getLogger(NakchalService.class);
	
	@RequestMapping(value="/selectListAgencyNakchalInfo", method=RequestMethod.GET)
	public String selectListAgencyNakchalInfo(NakchalDto nakchalDto) {
		logger.debug("selectListAgencyNakchalInfo NakchalController");
		logger.debug(nakchalDto.toString());
		logger.debug("jsp페이지 넘어간것 확인함");
		
		
		return "nakchal/selectListAgencyNakchalInfo";
	}
}
