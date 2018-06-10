package kr.or.nationRental.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.nationRental.board.service.BoardDto;
import kr.or.nationRental.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value="/selectListBoard", method=RequestMethod.GET)
	public String selectListBoard(Model model) {
		logger.debug("GET viewAgencyEmployeeInfo AgencyEmployeeController");
		List<BoardDto> list = boardService.selectListBoard();
		logger.debug(list.toString());
		model.addAttribute("boardList", list);
		
		return "board/selectListBoard";
	}
}
