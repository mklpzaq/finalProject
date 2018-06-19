package kr.or.nationRental.returnGoodsfacilityInfo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.login.service.MemberDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoDto;
import kr.or.nationRental.returnGoodsfacilityInfo.service.ReturnGoodsfacilityInfoService;
import kr.or.nationRental.returnGoodsfacilityInfo.service.StateGoodsDto;


@Controller
public class ReturnGoodsfacilityInfoController {
	
	@Autowired private ReturnGoodsfacilityInfoService returnGoodsfacilityInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(ReturnGoodsfacilityInfoController.class);
	
	@RequestMapping(value="/insertReturnGoodsfacilityInfoForm", method=RequestMethod.GET)
	public String insertReturnGoodsfacilityInfoForm(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto
													,Model model) {
		List<StateGoodsDto> list = returnGoodsfacilityInfoService.stateGoodsCode();
		model.addAttribute("adminagencyCode", returnGoodsfacilityInfoDto.getAdminagencyCode());
		model.addAttribute("list", list);
		return "/functionary/insertReturnGoodsfacilityInfoForm";
	}
	
	@RequestMapping(value="/insertReturnGoodsfacilityInfoForm", method=RequestMethod.POST)
	public String insertReturnGoodsfacilityInfoForm(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto
													,Model model
													,HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		returnGoodsfacilityInfoDto.setFunctionaryId(member.getMemberId());
		returnGoodsfacilityInfoService.insertReturnGoodsfacilityInfo(returnGoodsfacilityInfoDto);
		return "/functionary/insertReturnGoodsfacilityInfoForm";
	}
}
