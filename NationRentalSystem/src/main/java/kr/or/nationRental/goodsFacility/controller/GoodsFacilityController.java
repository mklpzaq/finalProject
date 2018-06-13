package kr.or.nationRental.goodsFacility.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityRequest;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;

@Controller
public class GoodsFacilityController {
	@Autowired 
	private GoodsFacilityService goodsFacilityService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityController.class);
	
	@RequestMapping(value="/getGoodsFacilityList", method=RequestMethod.GET)
	public String getGoodsFacilityList() {
		logger.debug("GET getGoodsFacilityList GoodsFacilityController");
		
		return "rentalGoodsFacility/rentalGoodsFacilityList";
	}
	
	@RequestMapping(value="/insertGoodsFacility", method=RequestMethod.GET)
	public String insertGoodsFacility(FunctionaryDto functionaryDto
										,Model model) {
		logger.debug("GET insertGoodsFacility GoodsFacilityController" + functionaryDto.toString());
			
		functionaryDto = goodsFacilityService.selectadminagency(functionaryDto);		
		logger.debug(functionaryDto.toString());
		model.addAttribute("functionaryDto", functionaryDto);
		
		return "/rentalGoodsFacility/insertGoodsFacilityForm";
	}
	
	@RequestMapping(value="/insertGoodsFacility", method=RequestMethod.POST)
	public String insertGoodsFacility(GoodsFacilityRequest goodsFacilityRequest
										,Model model) {
		logger.debug("POST insertGoodsFacility GoodsFacilityController : " + goodsFacilityRequest.toString());
		
		List<MultipartFile> list = goodsFacilityRequest.getMultipartfile();
		logger.debug("list : " + list);
		for(MultipartFile file : list) {
			String fileType = file.getContentType();			
			logger.debug("fileType : " + fileType);
			
			if(!fileType.equals("image/jpeg") && !fileType.equals("image/jpg") && !fileType.equals("image/png") &&
				!fileType.equals("image/bmp") && fileType.equals("image/webp")) {
				
				logger.debug("fileType : " + fileType);
				logger.info("이미지 파일이 아닙니다.");
				model.addAttribute("error", "alert('이미지 파일이 아닙니다.')");
				model.addAttribute("goodsFacilityRequest", goodsFacilityRequest);
				
				
				return "/rentalGoodsFacility/insertGoodsFacilityForm";
			}			
		}
		
		
		
		return "redirect:/joinCongratulation";
	}
}
