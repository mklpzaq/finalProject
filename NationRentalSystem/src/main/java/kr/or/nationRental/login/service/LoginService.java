package kr.or.nationRental.login.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	private LoginDao loginDao;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	public int login(MemberDto memberDto) {
		logger.debug("login LoginService");
		loginDao.loginCheckAdminstrator(memberDto);
		loginDao.loginCheckCitizen(memberDto);
		loginDao.loginCheckAgencyEmployee(memberDto);
		loginDao.loginCheckFunctionary(memberDto);
		
		return 0;
	}
}
