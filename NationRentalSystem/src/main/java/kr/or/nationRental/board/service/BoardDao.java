package kr.or.nationRental.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
	final String NS = "kr.or.nationRental.board.service.BoardMapper.";
	
	/*public List<BoardDto> selectListBoard(){
		logger.debug("selectListBoard BoardDao");
		return sqlSession.selectList(NS+"selectListBoard");
	}*/
	
	public int totalCountBoard(Map<String, Object> map) {
		logger.debug("totalCountBoard BoardDao");
		return sqlSession.selectOne(NS+"totalCountBoard", map);
	}
	
	public List<BoardDto> selectListBoard(Map<String, Object> map){
		logger.debug("selectListBoard BoardDao");
		return sqlSession.selectList(NS+"selectListBoard", map);
	}
	
}
