package kr.or.nationRental.citizen.service;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CitizenDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	final String NS ="com.test.mall2.member.service.MemberMapper.";
	
	public int insertCitizen(String citizenDto) {
		
		return 0;
	}

}
