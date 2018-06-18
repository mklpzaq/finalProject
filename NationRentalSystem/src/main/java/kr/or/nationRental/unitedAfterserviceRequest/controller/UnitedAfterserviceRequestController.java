package kr.or.nationRental.unitedAfterserviceRequest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;

@Controller
public class UnitedAfterserviceRequestController {
	@Autowired
	private UnitedAfterserviceRequestService unitedAfterserviceRequestService;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestController.class);
	
	@RequestMapping(value="/insertUnitedAfterserviceRequest", method=RequestMethod.POST)
	public String insertUnitedAfterserviceRequest(UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("POST insertUnitedAfterserviceRequest UnitedAfterserviceRequestController");
		logger.debug("★★★★★★★★★★★★★★★★★★★★★");
		logger.debug(unitedAfterserviceRequestDto.toString());
		
		
		
		
		return null;
	}
	
	@RequestMapping(value="/insertUnitedAfterserviceRequest", method=RequestMethod.GET)
	public String insertUnitedAfterserviceRequest(Model model
												,UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("GET insertUnitedAfterserviceRequest UnitedAfterserviceRequestController");
		logger.debug(unitedAfterserviceRequestDto.toString());
		String functionaryId = unitedAfterserviceRequestDto.getFunctionaryId();
		unitedAfterserviceRequestDto = unitedAfterserviceRequestService.selectOneUnitedAfterserviceRequestDtoForInsert(unitedAfterserviceRequestDto);
		List<AgencyDto> list = unitedAfterserviceRequestService.selectListAgencyDto(functionaryId);
		
		logger.debug(list.toString());
		
		model.addAttribute("unitedAfterserviceRequestDto", unitedAfterserviceRequestDto);
		model.addAttribute("agencyList", list);
		
		return "unitedAfterserviceRequest/insertUnitedAfterserviceRequestForm";
	}
	
	
	@RequestMapping(value="/selectListReturnGoodsfacilityInfoForAfterService", method=RequestMethod.GET)
	public String selectListReturnGoodsfacilityInfoForAfterService(Model model
																	,FunctionaryDto functionaryDto
																	,HttpSession session
																	,@RequestParam(value="currentPage", defaultValue="1") int currentPage
																	,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
																	,@RequestParam(value="searchSelect", defaultValue="물품/시설 반납 코드") String searchSelect
																	,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListReturnGoodsfacilityInfoForAfterService selectListReturnGoodsfacilityInfoForAfterService");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		Map<String, Object> map = unitedAfterserviceRequestService.selectListReturnGoodsfacilityInfo(currentPage, pagePerRow, searchSelect, searchWord);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchWord", searchWord);
		logger.debug("list : "+ map.get("list"));
		logger.debug("lastPage : "+ map.get("lastPage"));
		logger.debug("beginPageNumForCurrentPage : "+ map.get("beginPageNumForCurrentPage"));
		logger.debug("currentPage : "+ currentPage);
		logger.debug("pagePerRow : "+ pagePerRow);
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		/* 파일 저장루트 확인용 */
		String path = session.getServletContext().getRealPath("/resources/upload/");
		model.addAttribute("path", path);
		
		
		return "unitedAfterserviceRequest/selectListReturnGoodsfacilityInfoForAfterService";
	}
}






