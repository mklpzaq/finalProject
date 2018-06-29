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

import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeDto;
import kr.or.nationRental.agencyEmployee.service.AgencyEmployeeService;
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
	//공무원 가입화면에서 필요한 처리
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
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="전체 검색") String searchOption
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
	@RequestMapping(value="/viewFunctionaryInfo", method=RequestMethod.GET)
	public String functionaryBasicInformation(/*@RequestParam(value="functionaryId") String functionaryId*/
											HttpSession session
											,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String functionaryId = member.getMemberId();
		logger.debug("FunctionaryController - viewFunctionaryInfo - functionaryId : " + functionaryId);
		FunctionaryDto returnfunctionaryDto = functionaryService.viewFunctionaryInfo(functionaryId);
		logger.debug("FunctionaryController - viewFunctionaryInfo - returnfunctionaryDto : " + returnfunctionaryDto.toString());
		model.addAttribute("returnfunctionaryDto", returnfunctionaryDto);
		
		return "/functionary/viewFunctionaryInfo";
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
		FunctionaryDto returnfunctionaryDto = functionaryService.viewFunctionaryInfo(functionaryId);
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
	
	
	/*탈퇴처리에 필요한 기능들
	 * 공무원 회원 정보 테이블에서 delete 처리
	 * 1번 공무원 이력관리 테이블에서 가장 최근에 등록한 데이터 수정 처리
	 * 탈퇴공무원 데이터 1년저장 테이블에 insert 처리
	 */
	@RequestMapping(value="/deleteFunctionnary", method=RequestMethod.GET)
	public String deleteFunctionnary(FunctionaryDto functionaryDto
										,HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		functionaryDto.setFunctionaryId(member.getMemberId());    
		logger.debug("FunctionaryController - deleteFunctionnary - functionaryDto : " + functionaryDto);		
		
		functionaryService.deleteFunctionnary(functionaryDto);
		session.invalidate();
		return "redirect:/";
	}
	
	//id찾기 화면으로 이동
	@RequestMapping(value="/idSelect", method=RequestMethod.GET)
	public String idSelect() {
		
		
		return "/signUp/idSelect";
	}
	
	/*id찾기
	 *id찾기의 프로세스
	 *폼에서 가입된 아이디의 이름과 전화번호, 이메일을 넘겨받는다
	 *넘겨받은 아이디와 이름, 전화번호, 이메일로
	 */
	@RequestMapping(value="/idSelect", method=RequestMethod.POST)
	public String idSelect(MemberDto memberDto
						,Model model) {
		logger.debug("FunctionaryController - idSelect - memberDto : " + memberDto.toString());	
		Map <String, Object> map = functionaryService.idSelect(memberDto);
		
		
		model.addAttribute("map", map);
		//logger.debug("FunctionaryController - idSelect - map : " + map.get("administratorDto").);	
		/*if(map.get("adminId") != null) {
		model.addAttribute("adminId", map.get("adminId"));
		}
		if( map.get("agencyEmployeeId") != null) {
		model.addAttribute("agencyEmployeeId", map.get("agencyEmployeeId"));
		}
		if(map.get("citizenId") != null) {
		model.addAttribute("citizenId", map.get("citizenId"));
		}
		if(map.get("functionaryId") != null) {
		model.addAttribute("functionaryId", map.get("functionaryId"));
		}*/
		return "/functionary/checkId";
	}
	
	/*공무원 업무조회
	 * 목표
	 * 해당 공무원이 처리한 대여물품/시설등록, 반납정보등록, AS의뢰신청, 배달의뢰신청, 기부등록, 대행업체 등록, 계약해지, 연회비/패키지 등록, 배상청구 등록등을 볼 수 있어야한다
	 * 방향 session 처리된 공무원 아이디로 select만 전부하면 된다?....
	 * 한 화면에서 다양한 업무조회를 한꺼번에 확인하려했으나 시간과 능력부족으로 페이지를 나누기로 했다
	 */
	/*공무원 대여물품/시설등록업무조회
	 *필요기능
	 *해당 아이디의 공무원이 처리한 업무 리스트, 검색, 페이징 처리
	 */
	@RequestMapping(value="/selectFunctionaryWorkGoodsfacility", method=RequestMethod.GET)
	public String selectFunctionaryWorkGoodsfacility(FunctionaryDto functionaryDto
										,Model model
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="전체 검색") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - currentPage : " + currentPage);
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - pagePerRow  : " + pagePerRow);
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - searchSelect  : " + searchOption);
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - keyword  : " + keyword);
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - functionaryDto : " + functionaryDto.toString());
		
		//검색했을때 검색되는 정보가 하나도 없을때는 currentPage가 0이 되기 때문에 defaultValue가 적용되지도 않고 0이 들어와 계산 되는 경우를 막기 위해서
		if(currentPage == 0) {
			currentPage = 1;
		}
		String functionaryId = functionaryDto.getFunctionaryId();
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - functionaryId : " + functionaryId);
		Map<String, Object> map = functionaryService.selectFunctionaryWorkGoodsfacility(functionaryId
																						,currentPage
																						,pagePerRow
																						,searchOption
																						,keyword);
		logger.debug("FunctionaryController - selectFunctionaryWorkGoodsfacility - map : " + map.toString());
		
		logger.debug("★★★★★★★★★★★★★★★★★");
		logger.debug(map.get("goodsfacilityList").toString());
		
		model.addAttribute("list", map.get("goodsfacilityList"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("functionaryId", functionaryId);
		
		return "/functionary/selectFunctionaryWorkGoodsfacility";
	}
}
