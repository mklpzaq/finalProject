package kr.or.nationRental.board.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	final String NS = "kr.or.nationRental.board.service.AgencyEmployeeMapper.";
	
	public List<BoardDto> selectListBoard(){
		logger.debug("selectListBoard BoardService");
		return boardDao.selectListBoard();
	}
}
