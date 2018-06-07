package kr.or.nationRental.district.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.district.service.DistrictDto;
import kr.or.nationRental.district.service.DistrictService;

@Controller
public class DistrictController {
	@Autowired
	private DistrictService districtService;
	private DistrictDto districtDto;
	
	private static final Logger logger = LoggerFactory.getLogger(DistrictController.class);

	//행정구역 전체 목록 보기
	@RequestMapping(value="/selectListDistrict", method=RequestMethod.GET)
	public String selectListDistrict(Model model) {
		List<DistrictDto> districtDtoList = districtService.selectListDistrict();
		model.addAttribute("districtDtoList", districtDtoList);
		logger.info("---selectListDistrict" + districtDtoList);
		return "administrativeDistrict/selectListDistrict";
	}
		
	//시도 목록보기
	@RequestMapping(value="/selectListSido", method=RequestMethod.GET)
	public String selectListSido(Model model) {
		List<DistrictDto> sidoList = districtService.selectListSido();
		model.addAttribute("sidoList", sidoList);
		logger.info("---selectListSido" + sidoList);
		return "administrativeDistrict/selectListSido";
	}
	
	//시군구 목록보기
	@RequestMapping(value="/selectListSigungu", method=RequestMethod.GET)
	public String selectListSigungu(Model model) {
		List<DistrictDto> sigunguList = districtService.selectListSigungu();
		model.addAttribute("sigunguList", sigunguList);
		logger.info("---selectListSigungu" + sigunguList);
		return "administrativeDistrict/selectListSigungu";
	}
}
