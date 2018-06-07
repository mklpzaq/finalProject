package kr.or.nationRental.functionary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FunctionaryService {

	@Autowired
	private FunctionaryDao functionaryDao;
	
	private static final Logger logger = LoggerFactory.getLogger(FunctionaryService.class);
	
	//트랜잭션 처리가 안되는것 같다
	@Transactional
	public void insertFunctionary(FunctionaryDto functionaryDto) {
		logger.debug("FunctionaryService - insertFunctionary : " + functionaryDto.toString());
		
		functionaryDao.insertFunctionary(functionaryDto);
		
		functionaryDao.insertFunctionaryMoveInout(functionaryDto);
	}
	
	public Map<String, Object> selectListFunctionary(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("FunctionaryService - selectListFunctionary - currentPage : " + currentPage);
		logger.debug("FunctionaryService - selectListFunctionary - pagePerRow  : " + pagePerRow);
		logger.debug("FunctionaryService - selectListFunctionary - searchOption  : " + searchOption);
		logger.debug("FunctionaryService - selectListFunctionary - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
			map.put("beginRow", beginRow);
			map.put("pagePerRow", pagePerRow);
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);/*
			map.put("loginMemberId", loginMemberId);*/
			List<FunctionaryDto> list = functionaryDao.selectListFunctionary(map);
			logger.debug("FunctionaryService - selectListFunctionary - list  : " + list.toString());
			int total = functionaryDao.totalCountFunctionary(map);
			logger.debug("FunctionaryService - selectListFunctionary - total  : " + total);
			
		
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
}
