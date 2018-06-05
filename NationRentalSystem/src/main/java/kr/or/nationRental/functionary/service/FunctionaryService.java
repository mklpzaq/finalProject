package kr.or.nationRental.functionary.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FunctionaryService {

	@Autowired
	private FunctionaryDao functionaryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryService.class);
	
	public void insertFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryService - insertFunctionary : " + functionaryDto.toString());
		
		functionaryDao.insertFunctionary(functionaryDto);
	}
}
