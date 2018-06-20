package kr.or.nationRental.returnGoodsfacilityInfo.controller;

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

import kr.or.nationRental.login.service.MemberDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoService;
import kr.or.nationRental.returnGoodsfacilityInfo.service.StateGoodsDto;


@Controller
public class ReturnGoodsfacilityInfoController {
	
	@Autowired private ReturnGoodsfacilityInfoService returnGoodsfacilityInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReturnGoodsfacilityInfoController.class);
	
	//반납등록화면으로 이동
	@RequestMapping(value="/insertReturnGoodsfacilityInfoForm", method=RequestMethod.GET)
	public String insertReturnGoodsfacilityInfoForm(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto
													,Model model) {
		List<StateGoodsDto> list = returnGoodsfacilityInfoService.stateGoodsCode();
		model.addAttribute("adminagencyCode", returnGoodsfacilityInfoDto.getAdminagencyCode());
		model.addAttribute("list", list);
		return "/functionary/insertReturnGoodsfacilityInfoForm";
	}
	//반납등록
	@RequestMapping(value="/insertReturnGoodsfacilityInfoForm", method=RequestMethod.POST)
	public String insertReturnGoodsfacilityInfoForm(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto
													,Model model
													,HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		returnGoodsfacilityInfoDto.setFunctionaryId(member.getMemberId());
		returnGoodsfacilityInfoService.insertReturnGoodsfacilityInfo(returnGoodsfacilityInfoDto);
		return "redirect:/selectReturnGoodsfacilityInfo";
	}
	//공무원이 속한 행정기관에서 등록한 반납정보 조회
	@RequestMapping(value="/selectReturnGoodsfacilityInfo", method=RequestMethod.GET)
	public String selectReturnGoodsfacilityInfo(@RequestParam(value="currentPage", defaultValue="1") int currentPage
												,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
												,@RequestParam(value="searchOption", defaultValue="all") String searchOption
												,@RequestParam(value="keyword", defaultValue="") String keyword			
												,Model model
												,HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto = new ReturnGoodsfacilityInfoDto();
		returnGoodsfacilityInfoDto.setAdminagencyCode(member.getAdminagencyCode());
		Map<String, Object> map = returnGoodsfacilityInfoService.selectReturnGoodsfacilityInfo(returnGoodsfacilityInfoDto ,currentPage ,pagePerRow ,searchOption ,keyword);
		model.addAttribute("map", map);
		return "/functionary/selectReturnGoodsfacilityInfo";
	}
}
