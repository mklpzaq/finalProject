package kr.or.nationRental.login.service;

import java.util.HashMap;
import java.util.Map;

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
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;

		}else if(1 == loginDao.loginCheckCitizen(memberDto)) {
			logger.debug("시민 로그인 성공");
			memberDto = loginDao.selectOneCitizenById(memberDto);
			memberDto.setMemberLevel("시민");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;
			
		}else if(1 == loginDao.loginCheckAgencyEmployee(memberDto)) {
			/*
			 * 나중에 agencyCode를 세팅해 주어야 한다. JOIN을 통해서 .....
			 * */
			logger.debug("대행업체 직원 로그인 성공");
			memberDto = loginDao.selectOneAgencyEmployeeById(memberDto);
			memberDto.setMemberLevel("직원");
			String agencyName = loginDao.getAgencyEmployeeAgencyName(memberDto);
			memberDto.setAgencyName(agencyName);
			logger.debug("★★★★★★★★★★★★★★★★★★");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;
	
		}else if(1 == loginDao.loginCheckFunctionary(memberDto)) {
			/*
			 * 공무원의 경우 로그인 정보에 adminagencyCode(행정기관 코드)가 더 추가된다.
			 * */
			logger.debug("공무원 로그인 성공");
			memberDto = loginDao.selectOneFunctionaryById(memberDto);
			memberDto.setMemberLevel("공무원");
			logger.debug(memberDto.toString());
			
			session.setAttribute("member", memberDto);
			// 세션 유지시간 1시간
		    session.setMaxInactiveInterval(60*60) ;
			
		}else {
			logger.debug("로그인 실패");
		}
		
		
		/*loginDao.loginCheckCitizen(memberDto);
		loginDao.loginCheckAgencyEmployee(memberDto);
		loginDao.loginCheckFunctionary(memberDto);*/
		
	}
	
	//id찾기
		public Map <String, Object> idSelect(MemberDto memberDto) {
			String adminId = null;
			String agencyEmployeeId = null;
			String citizenId = null;
			String functionaryId = null;
			Map <String, Object> map = new HashMap<String, Object>();
			if(loginDao.administratorIdCheck(memberDto) == 1) {
				 adminId = loginDao.administratorIdSelect(memberDto);
				 map.put("adminId", adminId);
			}
			
			if(loginDao.agencyEmployeeIdCheck(memberDto) == 1) {
				 agencyEmployeeId = loginDao.agencyEmployeeIdSelect(memberDto);
				 map.put("agencyEmployeeId", agencyEmployeeId);
			}
			
			if(loginDao.citizenIdCheck(memberDto) == 1) {
				 citizenId = loginDao.citizenIdSelect(memberDto);
				 map.put("citizenId", citizenId);
			}
			
			if(loginDao.functionaryIdCheck(memberDto) == 1) {
				 functionaryId = loginDao.functionaryIdSelect(memberDto);
				 map.put("functionaryId", functionaryId);
			}
			
			return map;
		}
}
