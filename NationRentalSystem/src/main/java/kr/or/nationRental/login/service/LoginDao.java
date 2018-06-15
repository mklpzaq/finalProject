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
	
	public String getAgencyEmployeeAgencyName(MemberDto memberDto) {
		logger.debug("getAgencyEmployeeAgencyName LoginDao");
		return sqlSession.selectOne("getAgencyEmployeeAgencyName", memberDto);
	}
	
	public int loginCheckAdministrator(MemberDto memberDto) {
		logger.debug("loginCheckAdministrator LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckAdministrator", memberDto);
		
		return result;
	}
	
	public MemberDto selectOneAdministratorById(MemberDto memberDto) {
		logger.debug("selectOneAdministratorById LoginDao");
		memberDto =  sqlSession.selectOne(NS+"selectOneAdministratorById", memberDto);
		logger.debug(memberDto.toString());
		return memberDto;
	}
	
	public int loginCheckCitizen(MemberDto memberDto) {
		logger.debug("loginCheckCitizen LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckCitizen", memberDto);
		
		return result;
	}
	
	public MemberDto selectOneCitizenById(MemberDto memberDto) {
		logger.debug("selectOneCitizenById LoginDao");
		memberDto = sqlSession.selectOne(NS+"selectOneCitizenById", memberDto);
		logger.debug(memberDto.toString());
		return memberDto;
	}
	
	public int loginCheckAgencyEmployee(MemberDto memberDto) {
		logger.debug("loginCheckAgencyEmployee LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckAgencyEmployee", memberDto);
		
		return result;
	}
	
	public MemberDto selectOneAgencyEmployeeById(MemberDto memberDto) {
		logger.debug("selectOneAgencyEmployeeById LoginDao");
		memberDto = sqlSession.selectOne(NS+"selectOneAgencyEmployeeById", memberDto);
		logger.debug(memberDto.toString());
		return memberDto;
	}
	
	public int loginCheckFunctionary(MemberDto memberDto) {
		logger.debug("loginCheckFunctionary LoginDao");
		int result = sqlSession.selectOne(NS+"loginCheckFunctionary", memberDto);
		
		return result;
	}
	
	public MemberDto selectOneFunctionaryById(MemberDto memberDto) {
		logger.debug("selectOneFunctionaryById LoginDao");
		memberDto = sqlSession.selectOne(NS+"selectOneFunctionaryById", memberDto);
		logger.debug(memberDto.toString());
		return memberDto;
	}
}
