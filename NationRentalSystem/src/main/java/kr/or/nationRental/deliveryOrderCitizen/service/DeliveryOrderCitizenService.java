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

	public void insertDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		deliveryOrderCitizenDao.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
	}

	public List<DeliveryOrderCitizenDto> selectListMyDeliveryOrderCitizen(String memberId) {
		logger.debug("DeliveryOrderCitizenService - selectListMyDeliveryOrderCitizen - memberId : " + memberId.toString());
		
		return deliveryOrderCitizenDao.selectListMyDeliveryOrderCitizen(memberId);
	}

	public DeliveryOrderCitizenDto updateViewDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateViewDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		return deliveryOrderCitizenDao.updateViewDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);
		
	}

	public void updateDeliveryOrderCitizenAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateDeliveryOrderCitizenAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		
		deliveryOrderCitizenDao.updateDeliveryOrderCitizenAddress(deliveryOrderCitizenDto);		
	}

	public void updateIsCanceledDelivery(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - updateIsCanceledDelivery - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		deliveryOrderCitizenDao.updateIsCanceledDelivery(deliveryOrderCitizenDto);		
	}

	public List<DeliveryOrderCitizenDto> selectListDeliveryOrderCitizen(DeliveryOrderCitizenDto deliveryOrderCitizenDto) {
		logger.debug("DeliveryOrderCitizenService - selectListDeliveryOrderCitizen - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		return deliveryOrderCitizenDao.selectListDeliveryOrderCitizen(deliveryOrderCitizenDto);			
	}

	public Map<String, Object> insertDeliveryOrderCitizenSelectAddress(DeliveryOrderCitizenDto deliveryOrderCitizenDto
																				,HttpSession session) {
		logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + deliveryOrderCitizenDto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		if(deliveryOrderCitizenDto.getClassifyRentalState().equals("반납") ) {
			MemberDto member= (MemberDto) session.getAttribute("member");
			deliveryOrderCitizenDto.setCitizenId(member.getMemberId());   		
			DeliveryOrderCitizenDto returnCitizenAddress = deliveryOrderCitizenDao.insertDeliveryOrderCitizenAddressSelect(deliveryOrderCitizenDto);
			logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + returnCitizenAddress.toString());
			DeliveryOrderCitizenDto returnAdminagencyAddress = deliveryOrderCitizenDao.insertDeliveryOrderAdminagencyAddressSelect(deliveryOrderCitizenDto);
			logger.debug("DeliveryOrderCitizenService - insertDeliveryOrderCitizenSelectAddress - deliveryOrderCitizenDto : " + returnAdminagencyAddress.toString());
			map.put("returnCitizenAddress", returnCitizenAddress);
			map.put("returnAdminagencyAddress", returnAdminagencyAddress);
		}else if(deliveryOrderCitizenDto.getClassifyRentalState().equals("대여")) {
			//returnDeliveryOrderCitizenDto = deliveryOrderCitizenDao.insertDeliveryOrderCitizenSelectAddress(deliveryOrderCitizenDto);
		}
		
		
		return map;
	}

}
