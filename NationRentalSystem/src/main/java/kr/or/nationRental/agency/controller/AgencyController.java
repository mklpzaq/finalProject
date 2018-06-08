package kr.or.nationRental.agency.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.agency.service.AgencyService;
import kr.or.nationRental.login.service.MemberDto;


@Controller
public class AgencyController {
	
	
	@Autowired
	private AgencyService agencyService;
	
	private static final Logger logger = LoggerFactory.getLogger(AgencyController.class);
	
	//대행업체 등록 화면으로 이동
	@RequestMapping(value="/insertAgencyForm", method=RequestMethod.GET)
	public String insertAgencyForm() {
			
		return "/agency/insertAgencyForm";
	}
	
	//대행업체 등록
	//소속 행정기관코드와 등록공무원명은 세션에서 가져올 예정
	//하지만 아직 행정기관코드는 세션처리가 안됐으므로 만들것으로 가정하고 만든다 
	@RequestMapping(value="/insertAgency", method=RequestMethod.POST)
	public String insertAgency(AgencyDto agencyDto
									,HttpSession session) {
		logger.debug("AgencyController - insertAgency - agencyDto : " + agencyDto.toString());
		MemberDto member  = (MemberDto) session.getAttribute("member");
		String memberName = member.getMemberName();
		int adminagencyCode = member.getAdminagencyCode();
		logger.debug("AgencyController - insertAgency - memberName : " + memberName.toString());
		logger.debug("AgencyController - insertAgency - adminagencyCode : " + adminagencyCode);
		
		agencyService.insertAgency(agencyDto, memberName, adminagencyCode);
		
		return "redirect:/selectListContractAgency";
	}
	
	/*계약된 대행업체 조회
	 * 세션처리된 행정기관코드를 가지고 있는 대행업체를 모두 조회
	 * 단지 현재 계약되어있는 대행업체와 계약이 끝난 대행업체를 구분해줄 필요는 있다
	 * 계약되어있는 대행업체는 계약해지날짜가 null
	 * 계약되어있는 대행업체는 계약해지날짜가 notnull
	 * 결국에 페이징, 검색처리를 생각하면 결국에 form을 나눠줘야할 것 같다
	 * 계약되어있는 대행업체는 언제나 소수임으로 페이징과 검색을 넣어주지 않고
	 * 계약해지된 대행업체들을 쌓이고 쌓일수 있음으로 페이징과 검색을 넣어준다
	 * 계약되어 있는 대행업체들을 해지될 수 있다
	 */ 
	@RequestMapping(value="/selectListContractAgency", method=RequestMethod.GET)
	public String selectListContractAgency(HttpSession session
									,Model model) {
		MemberDto member  = (MemberDto) session.getAttribute("member");
		int adminagencyCode = member.getAdminagencyCode();
		logger.debug("AgencyController - selectListContractAgency - adminagencyCode : " + adminagencyCode);
		List<AgencyDto> List = agencyService.selectListContractAgency(adminagencyCode);
		model.addAttribute("List", List);
		
		return "/agency/selectListContractAgency";
	}
	
	//계약해지된 대행업체
	@RequestMapping(value="/selectListContractClosedAgency", method=RequestMethod.GET)
	public String selectListContractClosedAgency(HttpSession session
									,Model model) {
		MemberDto member  = (MemberDto) session.getAttribute("member");
		int adminagencyCode = member.getAdminagencyCode();
		logger.debug("AgencyController - selectListContractClosedAgency - adminagencyCode : " + adminagencyCode);
		List<AgencyDto> List = agencyService.selectListContractClosedAgency(adminagencyCode);
		model.addAttribute("List", List);
		
		return "/agency/selectListContractClosedAgency";
	}
	
	
	/*대행업체 계약해지 
	 * 계약된 대행업체 조회 선행 후
	 * 계약해지를 클릭하면
	 * 대행업체 테이블에서 수정처리가 들어가며 계약해지날짜가 생성
	 * 이후 대행업체 직원이 모두 탈퇴처리가 된다
	 * 단 탈퇴처리는 다른 패키지의 기능을 끌어올수 있다
	 * 이 수정처리는 수정폼이 필요가 없기 때문에 select를 할 필요도 없다
	 * */
	@RequestMapping(value="/updateAgencyContractClosed", method=RequestMethod.GET)
	public String updateAgencyContractClosed(AgencyDto agencyDto) {
		logger.debug("AgencyController - updateAgencyContractClosed - agencyDto : " + agencyDto.toString());
		agencyService.updateAgencyContractClosed(agencyDto);
		
		return "redirect:/selectListContractClosedAgency";
	}
	
	/*계약된 대행업체직원 조회
	 *계약된 대행업체 조회 선행 후
	 *현재 계약되어있는 대행업체중에 하나를 클릭하면
	 *해당 대행업체에 소속된 직원들 볼 수 있음
	 *단 해당 대행업체에 소속된 직원조회는 다른 패키지의 기능을 끌어올수 있다
	 */
}
