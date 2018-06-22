package kr.or.nationRental.deliveryOrderCitizen.controller;

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

import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenDto;
import kr.or.nationRental.deliveryOrderCitizen.service.DeliveryOrderCitizenService;
import kr.or.nationRental.login.service.MemberDto;

@Controller
public class DeliveryOrderCitizenController {
	
	@Autowired
	private DeliveryOrderCitizenService deliveryOrderCitizenService;
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderCitizenController.class);
	
	//배달신청등록 화면으로 이동
	//배달을 신청할 때 필요한 기본정보 및 주소지를 셋팅한다
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.GET)
	public String insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto
											,HttpSession session
											,Model model) {
		logger.debug("DeliveryOrderCitizenController - insertDeliveryOrderCitizen - GET - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
			
		
		Map<String, Object> map = deliveryOrderCitizenService.insertDeliveryOrderCitizenSelectAddress(deliveryOrderCitizenDto, session);
		
		model.addAttribute("deliveryOrderCitizenDto", deliveryOrderCitizenDto);
		model.addAttribute("map", map);
		
		
		return "/deliveryOrder/insertDeliveryOrderCitizenform";
	}
	
	//배달신청등록 기능
	//넘어온 데이터들을 간단하게 insert 하는 기능
	@RequestMapping(value="/insertDeliveryOrderCitizen", method=RequestMethod.POST)
	public String insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto
											,HttpSession session) {
		logger.debug("DeliveryOrderCitizenController - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		MemberDto member = (MemberDto) session.getAttribute("member");
		deliveryOrderCitizenDto.setCitizenId(member.getMemberId());   
		deliveryOrderCitizenService.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	
	//배달신청조회 기능
	//권한에 따라 다른 화면을 보여줘야하므로 세션처리된 Level을 같이 셋팅해준다
	@RequestMapping(value="/selectListMyDeliveryOrderCitizen", method=RequestMethod.GET)
	public String selectListMyDeliveryOrderCitizen(HttpSession session
													,Model model) {
		MemberDto member = (MemberDto) session.getAttribute("member");
		String memberId = member.getMemberId();
		
		logger.debug("DeliveryOrderCitizenController - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		List<DeliveryOrderCitizenDto> list = deliveryOrderCitizenService.selectListMyDeliveryOrderCitizen(memberId);
		model.addAttribute("list", list);
		model.addAttribute("memberLevel", member.getMemberLevel());
		return "/deliveryOrder/selectListMyDeliveryOrderCitizen";
	} 
	
	//신청한 배달의 주소지를 수정하는 화면으로 이동
	//수정할 배달정보의 기존정보를 select해준다
	@RequestMapping(value="/updateViewDeliveryOrderCitizenAddress", method=RequestMethod.GET)
	public String updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto
													,Model model) {
		logger.debug("DeliveryOrderCitizenController - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		DeliveryOrderCitizenDto returndeliveryOrderCitizenDto = deliveryOrderCitizenService.updateViewDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		model.addAttribute("returndeliveryOrderCitizenDto", returndeliveryOrderCitizenDto);
		return "/deliveryOrder/updateViewDeliveryOrderCitizenAddress";
	}
	
	//신청한 배달의 주소지를 수정기능
	@RequestMapping(value="/updateDeliveryOrderCitizenAddress", method=RequestMethod.POST)
	public String updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenController - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenService.updateDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	
	//배달신청을 취소하는 기능
	//신청을 취소했다는 정보를 공무원에게 전해줘야하기때문에 기본적으로 delete가 아닌 update로 만든다
	@RequestMapping(value="/updateIsCanceledDelivery", method=RequestMethod.GET)
	public String updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenController - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenService.updateIsCanceledDelivery(deliveryOrderCitizenDto);
		
		return "redirect:/selectListMyDeliveryOrderCitizen";
	}
	
	//공무원이 시민의 배달신청을 조회
	//권한에 따라 다른 화면을 보여줘야하므로 세션처리된 Level을 같이 셋팅해준다
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
		return "/deliveryOrder/selectListMyDeliveryOrderCitizen";
	}
	
}
