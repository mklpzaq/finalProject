package kr.or.nationRental.agencyAfterserviceHandling.controller;

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

import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingDto;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingService;
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyBusinesstypeDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestDto;

@Controller
public class AgencyAfterserviceHandlingController {
	@Autowired
	private AgencyAfterserviceHandlingService agencyAfterserviceHandlingService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingController.class);
	
	@RequestMapping(value="/selectListAgencyAfterserviceHandling", method=RequestMethod.GET)
	public String selectListAgencyAfterserviceHandling(Model model
													,HttpSession session
													,AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto
													,@RequestParam(value="currentPage", defaultValue="1") int currentPage
													,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
													,@RequestParam(value="searchSelect", defaultValue="직원 AS 수락 코드") String searchSelect
													,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListAgencyAfterserviceHandling AgencyAfterserviceHandlingController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		logger.debug(agencyAfterserviceHandlingDto.toString());
		Map<String, Object> map = agencyAfterserviceHandlingService.selectListAgencyAfterserviceHandling(currentPage, pagePerRow, searchSelect, searchWord, agencyAfterserviceHandlingDto);
		
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
		
		return "agencyAfterserviceHandling/selectListAgencyAfterserviceHandling";
	}
	
	@RequestMapping(value="/insertAgencyAfterserviceHandling", method=RequestMethod.POST)
	public String insertAgencyAfterserviceHandling(AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto) {
		logger.debug("POST insertAgencyAfterserviceHandling AgencyAfterserviceHandlingController");
		logger.debug(agencyAfterserviceHandlingDto.toString());
		agencyAfterserviceHandlingService.insertAgencyAfterserviceHandling(agencyAfterserviceHandlingDto);
		return "redirect:/selectListAgencyAfterserviceHandling";
	}
	
	@RequestMapping(value="/insertAgencyAfterserviceHandling", method=RequestMethod.GET)
	public String insertAgencyAfterserviceHandling(Model model
													,UnitedAfterserviceRequestDto unitedAfterserviceRequestDto) {
		logger.debug("GET insertAgencyAfterserviceHandling AgencyAfterserviceHandlingController");
		logger.debug(unitedAfterserviceRequestDto.toString());
		
		String agencyEmployeeId = unitedAfterserviceRequestDto.getAgencyEmployeeId();
		int agencyBusinesstypeCode = unitedAfterserviceRequestDto.getAgencyBusinesstypeCode();
		/* 현재 로그인 되어 있는 직원이 소속된 대행업체 코드, 대행업체 이름을 가져온다. */
		AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto = new AgencyAfterserviceHandlingDto();
		agencyAfterserviceHandlingDto.setAgencyEmployeeId(agencyEmployeeId);
		/*agencyAfterserviceHandlingDto.setAgencyBusinesstypeCode(agencyBusinesstypeCode);*/
		logger.debug("★★★★★★★★★★AAAAjjjjj★★★★★★★★★★★★★★★★");
		logger.debug(agencyAfterserviceHandlingDto.toString());
		List<AgencyAfterserviceHandlingDto> listAgencyAfterserviceHandlingDto = agencyAfterserviceHandlingService.selectOneAgencyAfterserviceHandlingDtoForAgencyEmployee(agencyAfterserviceHandlingDto);
		logger.debug("★★★★★★★★★★jjjjj★★★★★★★★★★★★★★★★");
		logger.debug(unitedAfterserviceRequestDto.toString());
		logger.debug(listAgencyAfterserviceHandlingDto.toString());
		/* 대행업체 업종 리스트를 가져온다. */
		
		List<AgencyBusinesstypeDto> list = agencyAfterserviceHandlingService.selectListAgencyBusinesstypeDto(unitedAfterserviceRequestDto);
		/* 통합 AS요청 정보를 가져온다. */
		unitedAfterserviceRequestDto = agencyAfterserviceHandlingService.selectOneUnitedAfterserviceRequestDto(unitedAfterserviceRequestDto);
		unitedAfterserviceRequestDto.setAgencyEmployeeId(agencyEmployeeId);
		logger.debug(unitedAfterserviceRequestDto.toString());
		
		model.addAttribute("unitedAfterserviceRequestDto", unitedAfterserviceRequestDto);
		model.addAttribute("listAgencyBusinesstypeDto", list);
		model.addAttribute("listAgencyAfterserviceHandlingDto", listAgencyAfterserviceHandlingDto);
		return "agencyAfterserviceHandling/insertAgencyAfterServiceHandlingForm";
	}
	
	
	@RequestMapping(value="/selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling", method=RequestMethod.GET)
	public String selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling(Model model
																	,HttpSession session
																	,AgencyAfterserviceHandlingDto agencyAfterserviceHandlingDto
																	,@RequestParam(value="currentPage", defaultValue="1") int currentPage
																	,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
																	,@RequestParam(value="searchSelect", defaultValue="AS 코드") String searchSelect
																	,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling AgencyAfterserviceHandlingController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		logger.debug(agencyAfterserviceHandlingDto.toString());
		
		Map<String, Object> map = agencyAfterserviceHandlingService.selectListUnitedAfterserviceRequest(currentPage, pagePerRow, searchSelect, searchWord, agencyAfterserviceHandlingDto);
		
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
		
		return "agencyAfterserviceHandling/selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling";
	}
}
