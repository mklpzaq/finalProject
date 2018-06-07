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

	//행정구역 목록 및 등록시작 페이지
		@RequestMapping(value="/selectListDistrict", method=RequestMethod.GET)
		public String selectListDistrict(Model model) {
			List<DistrictDto> districtDtoList = districtService.selectListDistrict();
			model.addAttribute("sidoSigunguEupmyeonDtoList", districtDtoList);
			return "administrativeDistrict/selectListDistrict";
		}
}
