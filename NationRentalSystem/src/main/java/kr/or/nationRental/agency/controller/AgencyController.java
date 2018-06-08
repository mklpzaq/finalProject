package kr.or.nationRental.agency.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
		return "redirect:/selectListAgency";
	}
	
	/*계약된 대행업체 조회
	 * 세션처리된 행정기관코드를 가지고 있는 대행업체를 모두 조회
	 * 단지 현재 계약되어있는 대행업체와 계약이 끝난 대행업체를 구분해줄 필요는 있다
	 */ 
	@RequestMapping(value="/selectListAgency", method=RequestMethod.GET)
	public String selectListAgency(AgencyDto agencyDto
									,HttpSession session) {
		logger.debug("AgencyController - insertAgency - agencyDto : " + agencyDto.toString());
		MemberDto member  = (MemberDto) session.getAttribute("member");
		String memberName = member.getMemberName();
		logger.debug("AgencyController - insertAgency - memberName : " + memberName.toString());
		
		
		return "/agency/selectListAgency";
	}
	
	
	/*대행업체 계약해지 
	 * 계약된 대행업체 조회 선행 후
	 * 계약해지를 클릭하면
	 * 대행업체 테이블에서 수정처리가 들어가며 계약해지날짜가 생성
	 * 이후 대행업체 직원이 모두 탈퇴처리가 된다
	 * 단 탈퇴처리는 다른 패키지의 기능을 끌어올수 있다
	 * */
	
	/*계약된 대행업체직원 조회
	 *계약된 대행업체 조회 선행 후
	 *현재 계약되어있는 대행업체중에 하나를 클릭하면
	 *해당 대행업체에 소속된 직원들 볼 수 있음
	 *단 해당 대행업체에 소속된 직원조회는 다른 패키지의 기능을 끌어올수 있다
	 */
}
