package kr.or.nationRental.annualfeePakage.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AnnualfeePakageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS ="kr.or.nationRental.annualfeePakage.service.AnnualfeePakageMapper.";
	private static final Logger logger = LoggerFactory.getLogger(AnnualfeePakageDao.class);
}
