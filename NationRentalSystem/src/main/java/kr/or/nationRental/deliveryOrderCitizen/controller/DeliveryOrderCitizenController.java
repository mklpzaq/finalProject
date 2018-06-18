package kr.or.nationRental.deliveryOrderCitizen.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenDto;
import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenService;
import kr.or.nationRental.login.service.MemberDto;

@Controller
public class DeliveryOrderCitizenController {
	
	@Autowired
	private DeliveryOrderCitizenService deliveryOrderCitizenService;
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderCitizenController.class);
	
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.GET)
	public String insertDeliveryOrderCitizen() {
		
				
		return "/citizen/insertDeliveryOrderCitizenform";
	}
	
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.POST)
	public String insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto
											,HttpSession session) {
		logger.debug("DeliveryOrderCitizenController - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		MemberDto member = (MemberDto) session.getAttribute("member");
		deliveryOrderCitizenDto.setCitizenId(member.getMemberId());   
		deliveryOrderCitizenService.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	
	@RequestMapping(value="/selectListMyDeliveryOrderCitizen", method=RequestMethod.GET)
	public String selectListMyDeliveryOrderCitizen(HttpSession session
													,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberId = member.getMemberId();   
		List<DeliveryOrderCitizenDto> list = deliveryOrderCitizenService.selectListMyDeliveryOrderCitizen(memberId);
		model.addAttribute("list", list);
		return "/citizen/selectListMyDeliveryOrderCitizen";
	} 
}
