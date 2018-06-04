package kr.or.nationRental.administrator.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdministratorDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	final String NS = "kr.or.nationRental.administrator.service.AdministratorMapper.";
	
	private static final Logger logger = LoggerFactory.getLogger(AdministratorDao.class);
	
	public int insertAdmin(Administrator administrator) {
		int row = sqlsession.insert(NS+"insertAdministrator", administrator);	
		return row;
	}
}
