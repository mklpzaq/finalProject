package kr.or.nationRental.deliveryOrderCitizen.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.login.service.MemberDto;


@Service
public class DeliveryOrderCitizenService {
	
	@Autowired
	private DeliveryOrderCitizenDao deliveryOrderCitizenDao;
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderCitizenService.class);
	
	//배달신청등록 기능
	public void insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		deliveryOrderCitizenDao.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
	}
	
	//배달신청조회 기능
	public List<DeliveryOrderCitizenDto> selectListMyDeliveryOrderCitizen(String memberId) {
		logger.debug("DeliveryOrderCitizenService - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		
		return deliveryOrderCitizenDao.selectListMyDeliveryOrderCitizen(memberId);
	}
	
	//신청한 배달의 주소지를 수정하는 화면으로 이동
	public DeliveryOrderCitizenDto updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		return deliveryOrderCitizenDao.updateViewDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		
	}
	
	//신청한 배달의 주소지를 수정기능
	public void updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		deliveryOrderCitizenDao.updateDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);		
	}
	
	//배달신청을 취소하는 기능
	public void updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenDao.updateIsCanceledDelivery(deliveryOrderCitizenDto);		
	}
	
	//공무원이 시민의 배달신청을 조회
	public List<DeliveryOrderCitizenDto> selectListDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - selectListDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return deliveryOrderCitizenDao.selectListDeliveryOrderCitizen(deliveryOrderCitizenDto);			
	}
	
	//배달신청등록 화면으로 이동
	//배달을 신청할 때 필요한 기본정보 및 주소지를 select
	public Map<String, Object> insertDeliveryOrderCitizenSelectAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto
																				,HttpSession session) {
		logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		//반납배달
		if(deliveryOrderCitizenDto.getClassifyRentalState().equals("반납") ) {
			MemberDto member= (MemberDto) session.getAttribute("member");
			//배달을 신청하는 시민의 ID 세팅
			deliveryOrderCitizenDto.setCitizenId(member.getMemberId());
			//배달을 신청하는 시민의 주소를 보내는 사람 주소에 셋팅한다
			DeliveryOrderCitizenDto returnCitizenAddress = deliveryOrderCitizenDao.insertDeliveryOrderCitizenAddressSelect(deliveryOrderCitizenDto);
			logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + returnCitizenAddress.toString());
			//배달시킬 행정기관의 주소를 받는 사람 주소에 셋팅한다
			DeliveryOrderCitizenDto returnAdminagencyAddress = deliveryOrderCitizenDao.insertDeliveryOrderAdminagencyAddressSelect(deliveryOrderCitizenDto);
			logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + returnAdminagencyAddress.toString());
			map.put("returnCitizenAddress", returnCitizenAddress);
			map.put("returnAdminagencyAddress", returnAdminagencyAddress);
		//대여배달
		}else if(deliveryOrderCitizenDto.getClassifyRentalState().equals("대여")) {
			//returnDeliveryOrderCitizenDto = deliveryOrderCitizenDao.insertDeliveryOrderCitizenSelectAddress(deliveryOrderCitizenDto);
		}
		
		
		return map;
	}

}
