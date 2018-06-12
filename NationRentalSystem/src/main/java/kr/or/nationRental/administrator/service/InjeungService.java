package kr.or.nationRental.administrator.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InjeungService {
	@Autowired
	private InjeungDao InjeungDao;
	private static final Logger logger = LoggerFactory.getLogger(InjeungService.class);
	
	public InjeungDto selectInjeung(InjeungDto injeungDto) {
		logger.info("---selectInjeung");
		return InjeungDao.selectInjeung(injeungDto);
	}
	
}
