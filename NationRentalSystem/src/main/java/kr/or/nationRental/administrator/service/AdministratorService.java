package kr.or.nationRental.administrator.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdministratorService {
	@Autowired private AdministratorDao administratorDao;
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
	
	//관리자 계정정보 보기
	public AdministratorDto viewAdminInfo(AdministratorDto administratorDto)  {	
		logger.info("viewAdminInfo");
		return administratorDao.viewAdminInfo(administratorDto); 
	}
	
	//관리자 정보 수정화면 불러오기
	public AdministratorDto updateAdministratorForm(AdministratorDto administratorDto)  {	
		logger.info("updateAdministratorForm");
		return administratorDao.updateAdministratorForm(administratorDto); 
	}
	
	//관리자 정보 수정하기
	public int updateAdministrator(AdministratorDto administratorDto)  {	
		logger.info("updateAdministrator");
		return administratorDao.updateAdministrator(administratorDto);
	}
	
	//관리자 권한 삭제
	public void deleteAdministrator(AdministratorDto adminId) {
		administratorDao.deleteAdministrator(adminId);
	}
}
