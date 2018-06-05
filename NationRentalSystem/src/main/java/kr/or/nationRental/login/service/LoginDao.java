package kr.or.nationRental.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);
	final String NS = "kr.or.nationRental.login.service.LoginMapper.";
	
	public int loginCheckAdminstrator(MemberDto memberDto) {
		logger.debug("loginCheckAdminstrator LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckAdministrator", memberDto);
		logger.debug("★★★★★★★★★★★★★★★★★★★★★★★★★");
		return result;
	}
	
	public void selectOneAdministratorById(MemberDto memberDto) {
		logger.debug("selectOneAdministratorById LoginDao");
		sqlSession.selectOne(NS+"selectOneAdministratorById", memberDto);
	}
	
	public int loginCheckCitizen(MemberDto memberDto) {
		logger.debug("loginCheckCitizen LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckCitizen", memberDto);
		
		return result;
	}
	
	public void selectOneCitizenById(MemberDto memberDto) {
		logger.debug("selectOneCitizenById LoginDao");
		sqlSession.selectOne(NS+"selectOneCitizenById", memberDto);
	}
	
	public int loginCheckAgencyEmployee(MemberDto memberDto) {
		logger.debug("loginCheckAgencyEmployee LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckAgencyEmployee", memberDto);
		
		return result;
	}
	
	public void selectOneAgencyEmployeeById(MemberDto memberDto) {
		logger.debug("selectOneAgencyEmployeeById LoginDao");
		sqlSession.selectOne(NS+"selectOneAgencyEmployeeById", memberDto);
	}
	
	public int loginCheckFunctionary(MemberDto memberDto) {
		logger.debug("loginCheckFunctionary LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckFunctionary", memberDto);
		
		return result;
	}
	
	public void selectOneFunctionaryById(MemberDto memberDto) {
		logger.debug("selectOneFunctionaryById LoginDao");
		sqlSession.selectOne(NS+"selectOneFunctionaryById", memberDto);
	}
}
