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
		logger.debug("selectListAdminagency :");
		int beginRow = (currentPage-1)*pagePerRow;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		logger.debug("currentPage :" + currentPage);
		logger.debug("beginRow :" + beginRow);
		logger.debug("pagePerRow :" + pagePerRow);
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		logger.debug("searchOption :" + searchOption);
		logger.debug("keyword :" + keyword);
		
		List<AdminagencyDto> list = adminagencyDao.selectListAdminagency(map);
		logger.debug("List<AdminagencyDao> : " + list);
		
		int total = adminagencyDao.totalCountAdminagency(map);
		
		int lastPage = 0;
		if(0 == total) {
			lastPage = 1;
		}else if(total%pagePerRow == 0) {
			lastPage = total/pagePerRow;
		}else {
			lastPage = total/pagePerRow + 1;
		}
		/* 페이지가 5개 단위씩 보이게 하는 계산식 */
		int temp = (currentPage - 1)/5;
		int beginPageNumForCurrentPage = temp * 5 + 1;
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("beginPageNumForCurrentPage", beginPageNumForCurrentPage);
		
		return returnMap;		
	}
	
	//행정기관 신규 등록하기
	public int insertAdminagency(AdminagencyDto adminagencyDto) {
		logger.info("---insertAdminagency");
		return adminagencyDao.insertAdminagency(adminagencyDto);
	}
}
