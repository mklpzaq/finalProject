package kr.or.nationRental.functionary.controller;

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

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.functionary.service.FunctionaryService;
import kr.or.nationRental.login.service.MemberDto;

@Controller
public class FunctionaryController {
	
	@Autowired 
	private FunctionaryService functionaryService;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryController.class);
	
	//공무원 가입 화면으로 이동
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.GET)
	public String insertFunctionary() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	//공무원 가입화면에서 입력받은 데이터로 공무원기본정보테이블과 공무원이력관리테이블 두곳에 insert
	@RequestMapping(value="/insertFunctionary", method=RequestMethod.POST)
	public String insertFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryController - insertFunctionary - functionaryDto : " + functionaryDto.toString());
		
		functionaryService.insertFunctionary(functionaryDto);
		
		return "redirect:/selectListFunctionary";
	}
	
	@RequestMapping(value="/idcehck", method=RequestMethod.GET)
	public String idcehck() {
			
		return "/functionary/insertFunctionaryForm";
	}
	
	@RequestMapping(value="/selectListFunctionary", method=RequestMethod.GET)
	public String selectListFunctionary(Model model
										,HttpSession session
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="all") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("FunctionaryController - selectListFunctionary - currentPage : " + currentPage);
		logger.debug("FunctionaryController - selectListFunctionary - pagePerRow  : " + pagePerRow);
		logger.debug("FunctionaryController - selectListFunctionary - searchSelect  : " + searchOption);
		logger.debug("FunctionaryController - selectListFunctionary - keyword  : " + keyword);
		
		Map<String, Object> map = functionaryService.selectListFunctionary(currentPage, pagePerRow, searchOption, keyword);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/functionary/selectListFunctionary";
	}
		
	//공무원 기본정보조회
	@RequestMapping(value="/functionaryBasicInformation", method=RequestMethod.GET)
	public String functionaryBasicInformation(/*@RequestParam(value="functionaryId") String functionaryId*/
											HttpSession session
											,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String functionaryId = member.getMemberId();
		logger.debug("FunctionaryController - functionaryBasicInformation - functionaryId : " + functionaryId);
		FunctionaryDto returnfunctionaryDto = functionaryService.functionaryBasicInformation(functionaryId);
		logger.debug("FunctionaryController - functionaryBasicInformation - returnfunctionaryDto : " + returnfunctionaryDto.toString());
		model.addAttribute("returnfunctionaryDto", returnfunctionaryDto);
		
		return "/functionary/functionaryBasicInformation";
	}
	
	/*공무원 정보 수정
	 * 프로세스 목표
	 * 공무원 기본정보를 수정하고
	 * 만약 행정기관코드를 수정하면
	 * 이력관리 테이블에 직전까지 존재하던 데이터를 수정하고
	 * 새롭게 등록한 행정기관코드로 새 이력을 등록한다
	 * 매서드 방향
	 * 콘트롤러에서 서비스로 수정한 데이터 전송
	 * 서비스에서 먼저 해당 아이디로 이력관리테이블 조회
	 * 조회해서 가장 근래에 등록된 행정기관코드가 현재 등록코드와 같은지 비교
	 * 같지 않다면 이력관리테이블에 가장 근래에 등록된 데이터를 수정하여 전출날짜와 현재 상태를 전출로 수정
	 * 이후 기본정보데이터 수정과 새로운 이력관리 데이터 등록
	 * 공무원 기본정보조회로 리다이렉트
	 * */
	@RequestMapping(value="/updateFunctionnary", method=RequestMethod.GET)
	public String updateFunctionnary(@RequestParam(value="functionaryId") String functionaryId
												,Model model) {
		logger.debug("FunctionaryController - updateFunctionnary - get - functionaryId : " + functionaryId.toString());
		FunctionaryDto returnfunctionaryDto = functionaryService.functionaryBasicInformation(functionaryId);
		logger.debug("FunctionaryController - updateFunctionnary - get - returnfunctionaryDto : " + returnfunctionaryDto.toString());
		model.addAttribute("returnfunctionaryDto", returnfunctionaryDto);
		
		return "/functionary/updateFunctionnaryForm";
	}
	
	@RequestMapping(value="/updateFunctionnary", method=RequestMethod.POST)
	public String updateFunctionnary(FunctionaryDto functionaryDto
											,Model model) {
		logger.debug("FunctionaryController - updateFunctionnary - post - functionaryDto : " + functionaryDto.toString());
		functionaryService.updateFunctionnary(functionaryDto);
		
		return "redirect:/functionaryBasicInformation";
	}
}
