package kr.or.nationRental.donation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.agency.service.AgencyDto;
import kr.or.nationRental.donation.service.DonationDto;
import kr.or.nationRental.donation.service.DonationRequest;
import kr.or.nationRental.donation.service.DonationService;
import kr.or.nationRental.login.service.MemberDto;



@Controller
public class DonationController {
	@Autowired DonationService donationService;
	private static final Logger logger = LoggerFactory.getLogger(DonationController.class);


	//회원 : 기부 신청 폼 불러오기
	@RequestMapping(value="/insertDonation", method=RequestMethod.GET)
	public String insertDonation(Model model
								, MemberDto memberDto
								, HttpSession session) {
		logger.debug("insertDonation : " + memberDto);
		logger.debug("insertDonation : " + session);
		session.getAttribute("member");
		model.addAttribute("member", session.getAttribute("member"));
		return "donation/insertDonationForm";
	}
	
	//회원 : 기부 신청하기
	@RequestMapping(value = "/insertDonation", method = RequestMethod.POST)
	public String insertDonation(DonationDto donationDto
									, DonationRequest donationRequest
									, HttpSession session) {
		logger.debug("insertDonation");
		logger.debug("donationRequest");
		donationService.insertDonation(donationDto);
		return "redirect:/selectListDonation";
	}	
	
	//회원 : 기부신청 리스트
	@RequestMapping(value="/selectListDonation", method=RequestMethod.GET)
	public String selectListDonation(Model model
									, HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberId = member.getMemberId();
		List<DonationDto> donationDtoList = donationService.selectListDonation(memberId);
		model.addAttribute("donationDtoList", donationDtoList);
		logger.debug("---donationDtoList" + donationDtoList);
	
		/* 파일 저장루트 확인용 */
		String path = session.getServletContext().getRealPath("/resources/upload/");
		model.addAttribute("path", path);
		
		return "donation/selectListDonation";
	}	
	
	//회원 : 기부신청 1개 게시글 보기
	@RequestMapping(value="/viewDonation", method=RequestMethod.GET)
	public String viewDonation(DonationDto donationDto, Model model) {
		logger.debug("viewDonation");
		DonationDto viewDonation = donationService.viewDonation(donationDto);
		model.addAttribute("viewDonation", viewDonation);
		return "donation/viewDonation";	
	}
	
	//회원 : 기부 내용 수정
	
	//회원 : 기부 취소(삭제)
	
	//공무원 : 기부 승인대기 리스트
	@RequestMapping(value="/approvalListDonation", method=RequestMethod.GET)
	public String approvalListDonation(Model model) {
		logger.debug("---approvalListDonation");
		List<DonationDto> approvalList = donationService.approvalListDonation();
		model.addAttribute("approvalList", approvalList);
		return "donation/approvalListDonation";
	}	
	
	//공무원 : 기부 승인대기 1개 게시물 보기
	@RequestMapping(value="/viewApprovalDonation", method=RequestMethod.GET)
	public String viewApprovalDonation(DonationDto donationDto, Model model) {
		logger.debug("viewApprovalDonation");
		DonationDto viewDonation = donationService.viewDonation(donationDto);
		model.addAttribute("viewDonation", viewDonation);
		return "donation/viewApprovalDonation";	
	}
	
	//공무원 : 기부 승인(업데이트)
	@RequestMapping(value = "/updateApprovalDonation", method=RequestMethod.POST)
	public String updateApprovalDonation(DonationDto donationDto) {
		logger.info("---updateApprovalDonation POST" + donationDto);
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		logger.debug(donationDto.toString());
		int result = donationService.updateApprovalDonation(donationDto);
		return "redirect:/approvalListDonation";
	}

	//기부 완료 리스트( 모든 회원이 볼 수 있음)
	
	
}
