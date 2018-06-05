package kr.or.nationRental.administrator.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class InjeungDao {
	private static final Logger logger = LoggerFactory.getLogger(InjeungDao.class);	
	@Autowired
 	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.administrator.service.InjeungMapper.";

	public InjeungDto selectInjeung(InjeungDto injeungDto) {		
		return sqlSession.selectOne(NS+"selectInjeung", injeungDto);
	}
}
