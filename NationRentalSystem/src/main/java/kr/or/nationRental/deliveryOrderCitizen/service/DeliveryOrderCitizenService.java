package kr.or.nationRental.deliveryOrderCitizen.service;

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
		deliveryOrderCitizenDao.insertDeliveryOrderCitizen(deliveryOrderCitizenDto);
		
	}

}
