package kr.or.nationRental.board.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository 
public class BoardDao {
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
	final String NS = "kr.or.nationRental.board.service.BoardMapper.";
	
	public void updateBoard(BoardDto boardDto) {
		logger.debug("updateBoard BoardDao");
		sqlSession.update(NS+"updateBoard", boardDto);
	}
	
	public void deleteBoard(BoardDto boardDto) {
		logger.debug("deleteBoard BoardDao");
		sqlSession.delete(NS+"deleteBoard", boardDto);
	}
	
	public BoardDto selectOneDetailBoard(BoardDto boardDto) {
		logger.debug("selectOneDetailBoard BoardDao");
		return sqlSession.selectOne(NS+"selectOneDetailBoard", boardDto);
	}
	
	public int getBoardCategoryCode(BoardDto boardDto) {
		logger.debug("getBoardCategoryCode BoardDao");
		return sqlSession.selectOne(NS+"getBoardCategoryCode", boardDto);
	}
	
	@Transactional
	public void insertBoard(BoardDto boardDto) {
		logger.debug("insertBoard BoardDao");
		sqlSession.insert(NS+"insertBoard", boardDto);
	}
	
	public List<BoardCategoryDto> getBoardCategory(){
		logger.debug("getBoardCategory BoardDao");
		return sqlSession.selectList(NS+"getBoardCategory");
	}
	
	public int totalCountBoard(Map<String, Object> map) {
		logger.debug("totalCountBoard BoardDao");
		return sqlSession.selectOne(NS+"totalCountBoard", map);
	}
	
	public List<BoardDto> selectListBoard(Map<String, Object> map){
		logger.debug("selectListBoard BoardDao");
		return sqlSession.selectList(NS+"selectListBoard", map);
	}
	
}
