package kr.or.nationRental.totalRentalPaymentInfo.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityDto;
import kr.or.nationRental.rentGoodsFacility.service.RentGoodsfacilityService;
import kr.or.nationRental.totalRentalPaymentInfo.service.TotalRentalPaymentInfoDto;
import kr.or.nationRental.totalRentalPaymentInfo.service.TotalRentalPaymentInfoService;

@Controller
public class TotalRentalPaymentInfoController {
	@Autowired private TotalRentalPaymentInfoService totalRentalPaymentInfoService;
	@Autowired private RentGoodsfacilityService rentGoodsfacilityService;
	private static final Logger logger = LoggerFactory.getLogger(TotalRentalPaymentInfoController.class);
	
	//먼저 총결제코드를 생성해야한다. 코드 외에 나머지 값은 null로 시작한다.
	@RequestMapping(value="/insertTotalRentalPaymentInfo", method=RequestMethod.GET)
	public String insertTotalRentalPaymentInfo(TotalRentalPaymentInfoDto totalRentalPaymentInfoDto) {
		logger.info("---insertTotalRentalPaymentInfo");
		totalRentalPaymentInfoService.insertTotalRentalPaymentInfo(totalRentalPaymentInfoDto);
		return "redirect:/updateTotalRentalPaymentInfo";
		
	}
	
	//예약 목록에서 결제를 누르면 예약 목록을 불러오고, 총결제 목록도 가져와야한다.
	@RequestMapping(value="/selectTotalRentalPaymentInfo", method=RequestMethod.GET)
	public String selectTotalRentalPaymentInfo(Model model) {
		List<RentGoodsfacilityDto> rentGoodsfacilityDtoList = rentGoodsfacilityService.값을 넣어야합니다아아아();
		List<TotalRentalPaymentInfoDto> totalRentalPaymentInfoDtoList = totalRentalPaymentInfoService.selectTotalRentalPaymentInfo();
		model.addAttribute("rentGoodsfacilityDtoList", rentGoodsfacilityDtoList);
		model.addAttribute("totalRentalPaymentInfoDtoList", totalRentalPaymentInfoDtoList);
		return "totalRentalPaymentInfo/selectTotalRentalPaymentInfo";
	}
	
	//총결제 목록 값을 update시켜서 예약목록의 데여가격을 더해줘야한다. 근데 어떻게 해야할지 모르겠다.
	@RequestMapping(value="/updateTotalRentalPaymentInfo", method=RequestMethod.GET)
	public String updateTotalRentalPaymentInfo(Model model
												, TotalRentalPaymentInfoDto totalRentalPaymentInfoDto) {
		logger.debug("---updateTotalRentalPaymentInfo GET" + totalRentalPaymentInfoDto);
		TotalRentalPaymentInfoDto totalRentalPaymentInfoUpdate = totalRentalPaymentInfoService.updateTotalRentalPaymentInfo(totalRentalPaymentInfoDto);
		model.addAttribute("totalRentalPaymentInfoUpdate", totalRentalPaymentInfoUpdate);
		return "totalRentalPaymentInfo/selectTotalRentalPaymentInfo";
	}
	
	@RequestMapping(value = "/updateTotalRentalPaymentInfo", method = RequestMethod.POST)
	public String updateAdministrator(TotalRentalPaymentInfoDto totalRentalPaymentInfoDto) {
		logger.debug("---updateTotalRentalPaymentInfo POST" + totalRentalPaymentInfoDto);
		int row = totalRentalPaymentInfoService.updateTotalRentalPaymentInfo(totalRentalPaymentInfoDto);
		return "redirect:/selectListAdministrator";
	}

}
