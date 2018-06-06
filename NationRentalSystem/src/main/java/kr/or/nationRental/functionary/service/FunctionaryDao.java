package kr.or.nationRental.functionary.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FunctionaryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	final String NS ="kr.or.nationRental.functionary.service.FunctionaryMapper.";
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryDao.class);
	
	public int insertFunctionary(FunctionaryDto functionaryDto) {
		
		logger.debug("FunctionaryDao - insertFunctionary - functionaryDto : " + functionaryDto);
		
		int row = sqlSession.insert(NS+"insertFunctionary", functionaryDto);
		
		return row;
	}
	
	public List<FunctionaryDto> selectListFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - selectListFunctionary - map : " + map.toString());
		
		return sqlSession.selectList(NS+"selectListFunctionary", map);
	}
	
	public int totalCountFunctionary(Map<String, Object> map) {
		//logger.debug("FunctionaryDao - totalCountFunctionary - map : " + map);
		 
		return sqlSession.selectOne(NS+"totalCountFunctionary");
	}
}
