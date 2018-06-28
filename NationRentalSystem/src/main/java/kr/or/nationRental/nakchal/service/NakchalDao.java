package kr.or.nationRental.nakchal.service;

import java.util.List;
import java.util.Map;

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
	
	public int totalCountAgencyNakchalInfo(Map<String, Object> map) {
		logger.debug("totalCountAgencyNakchalInfo NakchalDao");
		return sqlSession.selectOne(NS+"totalCountAgencyNakchalInfo", map);
	}
	
	public List<NakchalDto> selectListAgencyNakchalInfo(Map<String, Object> map) {
		logger.debug("selectListAgencyNakchalInfo NakchalDao");
		return sqlSession.selectList(NS+"selectListAgencyNakchalInfo", map);
	}
}
