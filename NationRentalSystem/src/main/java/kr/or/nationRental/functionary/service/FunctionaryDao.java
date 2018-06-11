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
	
	public int insertFunctionaryMoveInout(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertFunctionaryMoveInout - functionaryDto : " + functionaryDto);
		int row = sqlSession.insert(NS+"insertFunctionaryMoveInout", functionaryDto);
		return row;
	}
	
	public List<FunctionaryDto> selectListFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - selectListFunctionary - map : " + map.toString());
		return sqlSession.selectList(NS+"selectListFunctionary", map);
	}
	
	public int totalCountFunctionary(Map<String, Object> map) {
		logger.debug("FunctionaryDao - totalCountFunctionary - map : " + map);
		return sqlSession.selectOne(NS+"totalCountFunctionary", map);
	}
	
	public FunctionaryDto functionaryBasicInformation(String functionaryId) {
		logger.debug("FunctionaryDao - functionaryBasicInformation - functionaryId : " + functionaryId);
		return sqlSession.selectOne(NS+"functionaryBasicInformation", functionaryId);
	}
	
	public int updateFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - updateFunctionnary - functionaryDto : " + functionaryDto);
		return sqlSession.update(NS+"updateFunctionnary", functionaryDto);
	}
	
	public List<FunctionaryDto> selectAdminagency(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - selectAdminagency - functionaryDto : " + functionaryDto);
		return sqlSession.selectList(NS+"selectAdminagency", functionaryDto);		
	}
	
	public FunctionaryDto selectFunctionaryMoveInout(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectFunctionaryMoveInout - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectFunctionaryMoveInout", fuctionaryId);
	}

	public void updateFuctionaryMoveInout(FunctionaryDto returnfunctionaryMoveInoutCode) {
		logger.debug("FunctionaryDao - updateFuctionaryMoveInout - returnfunctionaryMoveInoutCode : " + returnfunctionaryMoveInoutCode);
		sqlSession.update(NS+"updateFuctionaryMoveInout", returnfunctionaryMoveInoutCode);
	}

	public void deleteFunctionnary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - deleteFunctionnary - functionaryDto : " + functionaryDto);
		sqlSession.delete(NS+"deleteFunctionnary", functionaryDto);
	}

	public void insertStorageFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryDao - insertStorageFunctionary - functionaryDto : " + functionaryDto);
		sqlSession.insert(NS+"insertStorageFunctionary", functionaryDto);
	}

	/*public FunctionaryDto selectForStorageFunctionary(String fuctionaryId) {
		logger.debug("FunctionaryDao - selectForStorageFunctionary - fuctionaryId : " + fuctionaryId);
		return sqlSession.selectOne(NS+"selectForStorageFunctionary", fuctionaryId);
	}*/
}
