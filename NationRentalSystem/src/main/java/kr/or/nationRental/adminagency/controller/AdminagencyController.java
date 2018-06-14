package kr.or.nationRental.adminagency.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nationRental.adminagency.service.AdminagencyService;

@Controller
public class AdminagencyController {
	@Autowired AdminagencyService adminagencyService;
	private static final Logger logger = LoggerFactory.getLogger(AdminagencyController.class);

	//행정기관 전체 목록 보기 및 페이징
		@RequestMapping(value="/selectListAdminagency", method=RequestMethod.GET)
		public String selectListAdminagency(Model model
									,@RequestParam(value="currentPage", defaultValue="1") int currentPage
									,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
									,@RequestParam(value="searchOption", defaultValue="citizenId") String searchOption
									,@RequestParam(value="keyword", defaultValue="") String keyword) {
			logger.debug("selectListAdminagency searchSelect : " + searchOption);
			logger.debug("selectListAdminagency  searchWord : " + keyword);
			
			Map<String, Object> map = adminagencyService.selectListAdminagency(currentPage, pagePerRow, searchOption, keyword);
			
			model.addAttribute("list", map.get("list"));
			model.addAttribute("lastPage", map.get("lastPage"));
			model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("pagePerRow", pagePerRow);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			
			logger.debug("list : "+ map.get("list"));
			logger.debug("lastPage : "+ map.get("lastPage"));
			logger.debug("beginPageNumForCurrentPage : "+ map.get("beginPageNumForCurrentPage"));
			logger.debug("currentPage : "+ currentPage);
			logger.debug("pagePerRow : "+ pagePerRow);
			logger.debug("searchOption : " + searchOption);
			logger.debug("keyword : " + keyword);
			
			
			return "adminagency/selectListAdminagency";
		}
}
