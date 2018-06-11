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
	@Autowired private DistrictService districtService;	
	private static final Logger logger = LoggerFactory.getLogger(DistrictController.class);

	//행정구역 전체 목록 보기
	@RequestMapping(value="/selectListDistrict", method=RequestMethod.GET)
	public String selectListDistrict(Model model) {
		List<DistrictDto> districtDtoList = districtService.selectListDistrict();
		model.addAttribute("districtDtoList", districtDtoList);
		logger.debug("---selectListDistrict" + districtDtoList);
		return "administrativeDistrict/selectListDistrict";
	}
		
	//시도 목록보기
	@RequestMapping(value="/selectListSido", method=RequestMethod.GET)
	public String selectListSido(Model model) {
		List<DistrictDto> districtDtoList = districtService.selectListSido();
		model.addAttribute("districtDtoList", districtDtoList);
		logger.debug("---selectListSido" + districtDtoList);
		return "administrativeDistrict/selectListSido";
	}
	
	//시군구 목록보기
	@RequestMapping(value="/selectListSigungu", method=RequestMethod.GET)
	public String selectListSigungu(Model model) {
		List<DistrictDto> districtDtoList = districtService.selectListSigungu();
		model.addAttribute("districtDtoList", districtDtoList);
		logger.debug("---selectListSigungu" + districtDtoList);
		return "administrativeDistrict/selectListSigungu";
	}
	
	//읍면동 목록보기
	@RequestMapping(value="/selectListEupmyeon", method=RequestMethod.GET)
	public String selectListEupmyeon(Model model) {
		List<DistrictDto> districtDtoList = districtService.selectListEupmyeon();
		model.addAttribute("districtDtoList", districtDtoList);
		logger.debug("---selectListEupmyeon" + districtDtoList);
		return "administrativeDistrict/selectListEupmyeon";
	}
	
	//시도 등록 폼 불러오기
	@RequestMapping(value = "/insertSido", method = RequestMethod.GET)
	public String insertSido() {
		logger.debug("---insertSido");
   		return "administrativeDistrict/insertSido";
	}

	//시도 등록하기
	@RequestMapping(value = "/insertSido", method = RequestMethod.POST)
	public String insertSido(DistrictDto districtDto) {
		logger.debug("insertSido");
		districtService.insertSido(districtDto);
   		return "redirect:/selectListSido";
	}
		
	//시군구  등록 불러오기
	//시도 리스트를 가져와야 시군구 리스트와 조인할 수 있다.
	@RequestMapping(value = "/insertSigungu", method = RequestMethod.GET)
	public String insertSigungu(Model model) {
		logger.debug("---insertSigungu");
		List<DistrictDto> districtDtoList = districtService.selectListSido();
		logger.debug("---districtDtoList" + districtDtoList);
		model.addAttribute("districtDtoList", districtDtoList);
   		return "administrativeDistrict/insertSigungu";
	}
	
	//시군구  등록 post호출
	@RequestMapping(value="/insertSigungu",  method = RequestMethod.POST)
	public String insertSigungu(DistrictDto districtDto) {
		logger.debug(districtDto.toString());
		districtDto.setSigunguCode(districtDto.getSidoCode() + districtDto.getSigunguMiddleCode());		
		logger.debug("insertSigungu");
		int row = districtService.insertSigungu(districtDto);
		return "redirect:/selectListSigungu";
	}
	
	//읍면동  등록 불러오기
		//시도 리스트와 시군구 리스트를  가져와야 시군구 리스트와 조인할 수 있다.
		@RequestMapping(value = "/insertEupmyeon", method = RequestMethod.GET)
		public String insertEupmyeon(Model model) {
			logger.debug("---insertEupmyeon");
			List<DistrictDto> districtDtoList = districtService.selectListSido(); //시도리스트
			List<DistrictDto> districtDtoList2 = districtService.selectListSigungu(); //시군구리스트
			logger.debug("---districtDtoList 시도 리스트" + districtDtoList);
			logger.debug("---districtDtoList2 시군구 리스트" + districtDtoList2);
			model.addAttribute("districtDtoList", districtDtoList);
			model.addAttribute("districtDtoList2", districtDtoList2);
	   		return "administrativeDistrict/insertEupmyeon";
		}
		
	//읍면동  등록 post호출
	@RequestMapping(value="/insertEupmyeon",  method = RequestMethod.POST)
	public String insertEupmyeon(DistrictDto districtDto) {
		logger.debug(districtDto.toString());
		districtDto.setEupmyeonCode(districtDto.getSigunguCode() + districtDto.getEupmyeonMiddleCode());
		logger.debug("---insertEupmyeonCode" + districtDto.getEupmyeonCode());
		logger.debug("insertEupmyeon");
		int row = districtService.insertEupmyeon(districtDto);
		return "redirect:/selectListEupmyeon";
	}
	
}



