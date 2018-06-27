package kr.or.nationRental.nakchal.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NakchalDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(NakchalDao.class);
	final String NS = "kr.or.nationRental.nakchal.service.NakchalMapper.";
	
	public List<NakchalDto> selectListAgencyNakchalInfo(NakchalDto nakchalDto) {
		logger.debug("selectListAgencyNakchalInfo NakchalDao");
		return sqlSession.selectList(NS+"selectListAgencyNakchalInfo", nakchalDto);
	}
}
