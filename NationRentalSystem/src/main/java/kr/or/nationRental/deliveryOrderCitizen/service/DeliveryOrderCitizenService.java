package kr.or.nationRental.deliveryOrderCitizen.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


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

}
