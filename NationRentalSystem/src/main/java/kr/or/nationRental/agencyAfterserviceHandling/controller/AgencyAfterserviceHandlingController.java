package kr.or.nationRental.agencyAfterserviceHandling.controller;

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
import kr.or.nationRental.agencyAfterserviceHandling.service.AgencyAfterserviceHandlingService;

@Controller
public class AgencyAfterserviceHandlingController {
	@Autowired
	private AgencyAfterserviceHandlingService agencyAfterserviceHandlingService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyAfterserviceHandlingController.class);
	
	@RequestMapping(value="/selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling", method=RequestMethod.GET)
	public String selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling(Model model
																	,HttpSession session
																	,@RequestParam(value="currentPage", defaultValue="1") int currentPage
																	,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
																	,@RequestParam(value="searchSelect", defaultValue="unitedAfterserviceRequestCode") String searchSelect
																	,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListUnitedAfterserviceRequestForAgencyAfterserviceHandling AgencyAfterserviceHandlingController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		Map<String, Object> map = agencyAfterserviceHandlingService.selectListUnitedAfterserviceRequest(currentPage, pagePerRow, searchSelect, searchWord);
		
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
		
		return "agencyAfterserviceHandling/selectListUnitedAfterserviceRequestForAgencyEmployee";
	}
}
