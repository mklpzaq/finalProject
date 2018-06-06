package kr.or.nationRental.login.service;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	private LoginDao loginDao;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public void login(MemberDto memberDto, HttpSession session) {
		logger.debug("login LoginService");
		
		/*
		 * 아이디가 존재할 경우 해당 check에서 결과값으로 1이 리턴될것이다.
		 * 아이디가 존재하지 않을 경우 해당 check에서 결과값으로 0이 리턴될 것이다.
		 * */
		
		if(1 == loginDao.loginCheckAdministrator(memberDto)) {
			logger.debug("관리자 로그인 성공");
			memberDto = loginDao.selectOneAdministratorById(memberDto);
			memberDto.setMemberLevel("관리자");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			
		}else if(1 == loginDao.loginCheckCitizen(memberDto)) {
			logger.debug("시민 로그인 성공");
			memberDto = loginDao.selectOneCitizenById(memberDto);
			memberDto.setMemberLevel("시민");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			
		}else if(1 == loginDao.loginCheckAgencyEmployee(memberDto)) {
			logger.debug("대행업체 직원 로그인 성공");
			memberDto = loginDao.selectOneAgencyEmployeeById(memberDto);
			memberDto.setMemberLevel("직원");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
	
		}else if(1 == loginDao.loginCheckFunctionary(memberDto)) {
			logger.debug("공무원 로그인 성공");
			memberDto = loginDao.selectOneFunctionaryById(memberDto);
			memberDto.setMemberLevel("공무원");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			
		}else {
			logger.debug("로그인 실패");
		}
		
		
		/*loginDao.loginCheckCitizen(memberDto);
		loginDao.loginCheckAgencyEmployee(memberDto);
		loginDao.loginCheckFunctionary(memberDto);*/
		
	}
}
