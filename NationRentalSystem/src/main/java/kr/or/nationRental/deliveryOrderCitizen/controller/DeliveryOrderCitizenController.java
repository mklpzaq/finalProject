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
		
		logger.debug("DeliveryOrderCitizenController - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		List<DeliveryOrderCitizenDto> list = deliveryOrderCitizenService.selectListMyDeliveryOrderCitizen(memberId);
		model.addAttribute("list", list);
		model.addAttribute("memberLevel", member.getMemberLevel());
		return "/citizen/selectListMyDeliveryOrderCitizen";
	} 
	
	@RequestMapping(value="/updateViewDeliveryOrderCitizenAddress", method=RequestMethod.GET)
	public String updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto
													,Model model) {
		logger.debug("DeliveryOrderCitizenController - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		DeliveryOrderCitizenDto returndeliveryOrderCitizenDto = deliveryOrderCitizenService.updateViewDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		model.addAttribute("returndeliveryOrderCitizenDto", returndeliveryOrderCitizenDto);
		return "/citizen/updateViewDeliveryOrderCitizenAddress";
	}
	
	@RequestMapping(value="/updateDeliveryOrderCitizenAddress", method=RequestMethod.POST)
	public String updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenController - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenService.updateDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	
	@RequestMapping(value="/updateIsCanceledDelivery", method=RequestMethod.GET)
	public String updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenController - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenService.updateIsCanceledDelivery(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	//공무원이 시민의 배달신청을 조회
	@RequestMapping(value="/selectListDeliveryOrderCitizen", method=RequestMethod.GET)
	public String selectListDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto
												,Model model
												,HttpSession session) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberLevel = member.getMemberLevel();
		logger.debug("DeliveryOrderCitizenController - selectListDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.getAdminagencyCode());
		List<DeliveryOrderCitizenDto> list= deliveryOrderCitizenService.selectListDeliveryOrderCitizen(deliveryOrderCitizenDto);
		model.addAttribute("list", list);
		model.addAttribute("memberLevel", memberLevel);
		return "/citizen/selectListMyDeliveryOrderCitizen";
	}
	
}
