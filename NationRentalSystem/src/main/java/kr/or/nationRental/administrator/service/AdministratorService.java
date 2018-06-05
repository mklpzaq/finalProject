package kr.or.nationRental.administrator.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.functionary.service.FunctionaryDto;

@Service
public class AdministratorService {
	@Autowired
	private AdministratorDao administratorDao;
	private static final Logger logger = LoggerFactory.getLogger(AdministratorService.class);
	
	//관리자 등록
	public int insertAdministrator(AdministratorDto administratorDto) {	
		logger.info("---insertAdministrator");
		return administratorDao.insertAdministrator(administratorDto);
	}
	
	//관리자 계정 목록
	public List<AdministratorDto> selectListAdministrator() {
		
		return administratorDao.selectListAdministrator();
	}
}