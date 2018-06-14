package kr.or.nationRental.adminagency.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminagencyService {
	@Autowired AdminagencyDao adminagencyDao;
	private static final Logger logger = LoggerFactory.getLogger(AdminagencyService.class);
	
	//행정기관 전체목록 보기 및 페이징
	public Map<String, Object> selectListAdminagency(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListAdminagency - currentPage : " + currentPage);
		logger.debug("selectListAdminagency - pagePerRow  : " + pagePerRow);
		logger.debug("selectListAdminagency - searchOption  : " + searchOption);
		logger.debug("selectListAdminagency - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<AdminagencyDto> list = adminagencyDao.selectListAdminagency(map);
		logger.debug("selectListAdminagency - list  : " + list.toString());
		int total = adminagencyDao.totalCountAdminagency(map);
		logger.debug("selectListAdminagency - total  : " + total);
			
		int lastPage = 0;
		if(total%pagePerRow == 0) {
			lastPage = total/pagePerRow;
		}else {
			lastPage = total/pagePerRow + 1;
		}
		
		int pageView = 5;
		int startPage = ((currentPage-1)/5)*5+1; 
		int endPage = startPage + pageView -1; 
		if(endPage>lastPage) {
			endPage=lastPage;
		}
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("list", list);
		returnmap.put("lastPage", lastPage);
		returnmap.put("startPage", startPage);
		returnmap.put("endPage", endPage);
		
		return returnmap;
	}
	
	//행정기관 신규 등록하기
	public int insertAdminagency(AdminagencyDto adminagencyDto) {
		logger.info("---insertAdminagency");
		return adminagencyDao.insertAdminagency(adminagencyDto);
	}
}
