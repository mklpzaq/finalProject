package kr.or.nationRental.unitedAfterserviceRequest.controller;

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

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.unitedAfterserviceRequest.service.UnitedAfterserviceRequestService;

@Controller
public class UnitedAfterserviceRequestController {
	@Autowired
	private UnitedAfterserviceRequestService unitedAfterserviceRequestService;
	private static final Logger logger = LoggerFactory.getLogger(UnitedAfterserviceRequestController.class);
	
	@RequestMapping(value="/selectListReturnGoodsfacilityInfoForAfterService", method=RequestMethod.GET)
	public String selectListReturnGoodsfacilityInfoForAfterService(Model model
																	,FunctionaryDto functionaryDto
																	,HttpSession session
																	,@RequestParam(value="currentPage", defaultValue="1") int currentPage
																	,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
																	,@RequestParam(value="searchSelect", defaultValue="boardCode") String searchSelect
																	,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListBoard BoardController");
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






