package kr.or.nationRental.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private static final Logger logger = LoggerFactory.getLogger(LoginDao.class);
	final String NS = "kr.or.nationRental.login.service.LoginMapper.";
	
	public int loginCheckAdminstrator(MemberDto memberDto) {
		int result = sqlsession.selectOne(NS+"loginCheck", memberDto);
		
		return 0;
	}
	
	public int loginCheckCitizen(MemberDto memberDto) {
		int result = sqlsession.selectOne(NS+"loginCheck", memberDto);
		
		return 0;
	}
	
	public int loginCheckAgencyEmployee(MemberDto memberDto) {
		int result = sqlsession.selectOne(NS+"loginCheck", memberDto);
		
		return 0;
	}
	
	public int loginCheckFunctionary(MemberDto memberDto) {
		int result = sqlsession.selectOne(NS+"loginCheck", memberDto);
		
		return 0;
	}
}
