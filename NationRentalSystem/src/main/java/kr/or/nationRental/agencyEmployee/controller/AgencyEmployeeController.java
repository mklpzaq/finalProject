package kr.or.nationRental.agencyEmployee.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;
import kr.or.nationRental.agencyEmployee.service.BusinessTypeForAgencyEmployeeDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;

@Controller
public class AgencyEmployeeController {
	@Autowired
	private AgencyEmployeeService agencyEmployeeService;
	private static final Logger logger = LoggerFactory.getLogger(AgencyEmployeeController.class);
	
	@RequestMapping(value="/insertBusinesstypeForAgencyEmployee", method=RequestMethod.GET)
	public String insertBusinesstypeForAgencyEmployee(Model model
													,@RequestParam(value="agencyEmployeeId") String agencyEmployeeId) {
		logger.debug("GET insertBusinesstypeForAgencyEmployee AgencyEmployeeController");
		logger.debug("agencyEmployeeId : " + agencyEmployeeId);
		
		BusinessTypeForAgencyEmployeeDto businessTypeForAgencyEmployeeDto = agencyEmployeeService.selectOneBusinesstypeForAgencyEmployee(agencyEmployeeId);
		
		model.addAttribute("businessTypeForAgencyEmployeeDto", businessTypeForAgencyEmployeeDto);
		return "agencyEmployee/insertBusinesstypeForAgencyEmployeeForm";
	}
	
	@RequestMapping(value="/insertBusinesstypeForAgencyEmployee", method=RequestMethod.POST)
	public String insertBusinesstypeForAgencyEmployee(Model model
												,RedirectAttributes redirectAttributes
												,BusinessTypeForAgencyEmployeeDto businessTypeForAgencyEmployeeDto) {
		logger.debug("POST insertBusinesstypeForAgencyEmployee AgencyEmployeeController");
		logger.debug(businessTypeForAgencyEmployeeDto.toString());
		logger.debug("★★★★★★★★★★★★POSTTTT★★★★★★★★★");
		for(String addAgencyBusinesstype : businessTypeForAgencyEmployeeDto.getAddAgencyBusinesstypeList()) {
			logger.debug("addAgencyBusinesstype : " + addAgencyBusinesstype);
		}
		/* 체크박스 값 들어오는 것까지 확인 */
		agencyEmployeeService.insertBusinesstypeForAgencyEmployee(businessTypeForAgencyEmployeeDto);
		
		redirectAttributes.addAttribute("agencyEmployeeId", businessTypeForAgencyEmployeeDto.getAgencyEmployeeId());
		return "redirect:/insertBusinesstypeForAgencyEmployee";
	}
	
	@RequestMapping(value="/selectListFunctionaryForAgencyEmployee", method=RequestMethod.GET)
	public String selectListFunctionaryForAgencyEmployee(Model model
														,HttpSession session
														,FunctionaryDto functionaryDto
														,@RequestParam(value="currentPage", defaultValue="1") int currentPage
														,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
														,@RequestParam(value="searchSelect", defaultValue="공무원 ID") String searchSelect
														,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListFunctionaryForAgencyEmployee AgencyEmployeeController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		Map<String, Object> map = agencyEmployeeService.selectListFunctionaryForAgencyEmployee(currentPage, pagePerRow, searchSelect, searchWord, functionaryDto);
		
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
		
		return "agencyEmployee/selectListFunctionaryForAgencyEmployee";
	}
	
	
	@RequestMapping(value="/selectListAgencyEmployee", method=RequestMethod.GET)
	public String selectListAgencyEmployee(Model model
									,HttpSession session
									,AgencyEmployeeDto agencyEmployeeDto
									,@RequestParam(value="currentPage", defaultValue="1") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
									,@RequestParam(value="searchSelect", defaultValue="직원 ID") String searchSelect
									,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListAgencyEmployee AgencyEmployeeController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("★★★★★★★★★★★agencyName이 들어왔는가?★★★★★★★★★★★★★★★★★★★★");
		logger.debug("searchWord : " + searchWord);
		logger.debug(agencyEmployeeDto.toString());
		
		Map<String, Object> map = agencyEmployeeService.selectListAgencyEmployee(currentPage, pagePerRow, searchSelect, searchWord, agencyEmployeeDto);
		
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
		
		return "agencyEmployee/selectListAgencyEmployee";
	}
	
	
	@RequestMapping(value="/deleteAgencyEmployee", method=RequestMethod.GET)
	public String updateAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto
										,HttpSession session) {
		logger.debug("deleteAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		/* 삭제시 agencyEmployee 정보를 보관해야 하므로 employee정보를 가져온다. */
		
		agencyEmployeeService.deleteAgencyEmployee(agencyEmployeeDto, session);
		
		return "signUp/leaveMember";
	}
	
	@RequestMapping(value="/updateAgencyEmployee", method=RequestMethod.GET)
	public String updateAgencyEmployee(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("updateAgencyEmployee AgencyEmployeeController");
		agencyEmployeeDto = agencyEmployeeService.selectOneAgencyEmployee(agencyEmployeeDto);
		
		 /*업데이트 시킨 후 업데이트된 정보를 회원정보 화면으로 넘긴다.*/ 
		model.addAttribute("agencyEmployeeDto", agencyEmployeeDto);
		return "agencyEmployee/updateAgencyEmployeeForm";
	}
	
	@RequestMapping(value="/updateAgencyEmployee", method=RequestMethod.POST)
	public String updateAgencyEmployee(AgencyEmployeeDto agencyEmployeeDto
										,RedirectAttributes redirectAttributes) {
		logger.debug("updateAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeService.updateAgencyEmployee(agencyEmployeeDto);
		/* spring에서 redirect시 파라메터 값을 넘길때 쓴다. */
		redirectAttributes.addAttribute("agencyEmployeeId", agencyEmployeeDto.getAgencyEmployeeId());
		return "redirect:/viewAgencyEmployeeInfo";
	}
	
	@RequestMapping(value="/viewAgencyEmployeeInfo", method=RequestMethod.GET)
	public String viewAgencyEmployeeInfo(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("GET viewAgencyEmployeeInfo AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		agencyEmployeeDto = agencyEmployeeService.selectOneAgencyEmployee(agencyEmployeeDto);
		logger.debug(agencyEmployeeDto.toString());
		model.addAttribute("agencyEmployeeDto", agencyEmployeeDto);
		return "agencyEmployee/viewAgencyEmployeeInfo";
	}
	
	
	@RequestMapping(value="/insertAgencyEmployee", method=RequestMethod.POST)
	public String insertAgencyEmployee(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST insertAgencyEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		/*
		 * result 값이 true 일경우에는 insert가 정상적으로 이루어진 경우이다.
		 * result 값이 false 인 경우에는 insert가 정상적으로 이루어지지 않은 경우이다.
		 * */
		agencyEmployeeService.insertAgencyEmployee(agencyEmployeeDto);
		return "redirect:/joinCongratulation";
	}
	
	@RequestMapping(value="/getInsertAgencyEmployeeForm", method=RequestMethod.POST)
	public String getInsertAgencyEmployeeForm(Model model
										,AgencyEmployeeDto agencyEmployeeDto) {
		logger.debug("POST insertEmployee AgencyEmployeeController");
		logger.debug(agencyEmployeeDto.toString());
		/* 
		 * getAgencyNameForInsert 매서드의 결과로 
		 * agencyEmployeeDto에는 agencyName 정보와  agencyEmployeeInjeungNum가 존재하게 되고,
		 * agencyInfo라는 이름의 key값으로 model에 담아 포워드로 
		 * insertAgencyEmployeeForm.jsp로 넘어가게 된다.
		 *  */
		agencyEmployeeDto = agencyEmployeeService.getAgencyNameForInsert(agencyEmployeeDto);
		/*logger.debug(agencyEmployeeDto.toString());*/
		model.addAttribute("agencyInfo", agencyEmployeeDto);
		return "agencyEmployee/insertAgencyEmployeeForm";
	}
	
	@RequestMapping(value="/goInjeungAgencyEmployee", method=RequestMethod.GET)
	public String goInjeungEmployee() {
		logger.debug("GET goInjeungEmployee AgencyEmployeeController");
		return "agencyEmployee/injeungAgencyemployeeForm";
	}
}











