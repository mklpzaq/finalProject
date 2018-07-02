package kr.or.nationRental.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.nationRental.board.service.BoardCategoryDto;
import kr.or.nationRental.board.service.BoardDto;
import kr.or.nationRental.board.service.BoardService;
import kr.or.nationRental.login.service.MemberDto;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public String updateBoard(BoardDto boardDto
							,RedirectAttributes redirectAttributes) {
		logger.debug("POST updateBoard BoardController");
		
		logger.debug(boardDto.toString());
		
		boardService.updateBoard(boardDto);
		
		redirectAttributes.addAttribute("boardCode", boardDto.getBoardCode());
		logger.debug("★★★★★★★★★★updateBoard★★★★★★★★★★★★★★★");
		return "redirect:selectOneDetailBoard";
	}
	
	@RequestMapping(value="/updateBoard", method=RequestMethod.GET)
	public String updateBoard(Model model
							,BoardDto boardDto) {
		logger.debug("GET updateBoard updateBoard");
		logger.debug(boardDto.toString());
		boardDto = boardService.selectOneDetailBoard(boardDto);
		model.addAttribute("boardDto", boardDto);
		return "board/updateBoardForm";
	}
	
	@RequestMapping(value="/deleteBoard", method=RequestMethod.GET)
	public String deleteBoard(BoardDto boardDto) {
		logger.debug("GET deleteBoard boardService");
		logger.debug(boardDto.toString());
		boardService.deleteBoard(boardDto);
		
		return "redirect:/selectListBoard";
	}
	
	@RequestMapping(value="/selectOneDetailBoard", method=RequestMethod.GET)
	public String selectOneDetailBoard(Model model
										,BoardDto boardDto) {
		logger.debug("GET selectOneDetailBoard BoardController");
		logger.debug(boardDto.toString());
		/* 조회수 증가 */
		boardService.updateBoardHits(boardDto);
		/* 해당 게시글 정보 가져오기 */
		boardDto = boardService.selectOneDetailBoard(boardDto);
		/* model에 객체를 담아 board/detailBoard로 포워딩 */
		model.addAttribute("boardDto", boardDto);
		return "board/detailBoard";
	}
	
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public String insertBoardForm(BoardDto boardDto) {
		logger.debug("POST insertBoardForm BoardController");
		logger.debug(boardDto.toString());
		boardService.insertBoard(boardDto);
		
		return "redirect:/selectListBoard";
	}
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.GET)
	public String insertBoardForm(Model model
								,MemberDto memberDto) {
		logger.debug("GET insertBoardForm BoardController");
		logger.debug(memberDto.toString());
		/* 아이디가 안들어오는 경우는 GUEST계정일 경우이다. */
		if(memberDto.getMemberId().equals("")) {
			memberDto = boardService.setGuestId(memberDto);
		}
		
		List<BoardCategoryDto> boardCategoryList = boardService.getBoardCategory();
		logger.debug("★★★★★★★★★★★★★★★★★★★");
		logger.debug(boardCategoryList.toString());
		
		model.addAttribute("memberId", memberDto.getMemberId());
		model.addAttribute("boardCategoryList", boardCategoryList);
		return "board/insertBoardForm";
	}
	
	@RequestMapping(value="/selectListBoard", method=RequestMethod.GET)
	public String selectListBoard(Model model
									,HttpSession session
									,@RequestParam(value="currentPage", defaultValue="1") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
									,@RequestParam(value="searchSelect", defaultValue="게시글 코드") String searchSelect
									,@RequestParam(value="searchWord", defaultValue="") String searchWord) {
		logger.debug("GET selectListBoard BoardController");
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		Map<String, Object> map = boardService.selectListBoard(currentPage, pagePerRow, searchSelect, searchWord);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("searchWord", searchWord);
		logger.debug("list : "+ map.get("list"));
		logger.debug("lastPage : "+ map.get("lastPage"));
		logger.debug("beginPageNumForCurrentPage : "+ map.get("beginPageNumForCurrentPage"));
		logger.debug("currentPage : "+ currentPage);
		logger.debug("pagePerRow : "+ pagePerRow);
		logger.debug("searchSelect : " + searchSelect);
		logger.debug("searchWord : " + searchWord);
		
		/* 파일 저장루트 확인용 */
		String path = session.getServletContext().getRealPath("/resources/upload/");
		model.addAttribute("path", path);
		
		return "board/selectListBoard";
	}
}
