package kr.or.nationRental.functionary.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.functionary.service.FunctionaryService;

@RestController
public class FunctionaryRestController {
	
	@Autowired
	private FunctionaryService functionaryService;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryRestController.class);
		
	@RequestMapping(value="/selectAdminagency", method=RequestMethod.POST)
	public List<FunctionaryDto> selectAdminagency(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryRestController - selectAdminagency - functionaryDto : " + functionaryDto.toString());
			
		List<FunctionaryDto> list = functionaryService.selectAdminagency(functionaryDto);
		logger.debug("FunctionaryRestController - selectAdminagency - list : " + list.toString());
		return list;
	}
	
	
}
