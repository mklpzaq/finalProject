package kr.or.nationRental.goodsFacility.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsFacilityCategoryService {
	@Autowired GoodsFacilityCategoryDao goodsFacilityCategoryDao;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityCategoryService.class);
	
	//물품시설 카테고리 전체목록 보기 및 페이징
	public Map<String, Object> selectListGoodsFacilityCategory(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListGoodsFacilityCategory - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategory - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategory - searchOption  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategory - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<GoodsFacilityCategoryDto> list = goodsFacilityCategoryDao.selectListGoodsFacilityCategory(map);
		logger.debug("selectListGoodsFacilityCategory - list  : " + list.toString());
		int total = goodsFacilityCategoryDao.totalCountGoodsFacilityCategory(map);
		logger.debug("selectListGoodsFacilityCategory - total  : " + total);
			
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
	
	//물품시설 1차 카테고리 목록 페이징 및 검색
	public Map<String, Object> selectListGoodsFacilityCategoryOne(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListGoodsFacilityCategoryOne - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategoryOne - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategoryOne - searchOption  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategoryOne - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<GoodsFacilityCategoryDto> list = goodsFacilityCategoryDao.selectListGoodsFacilityCategoryOne(map);
		logger.debug("selectListGoodsFacilityCategoryOne - list  : " + list.toString());
		int total = goodsFacilityCategoryDao.totalCountGoodsFacilityCategoryOne(map);
		logger.debug("selectListGoodsFacilityCategoryOne - total  : " + total);
			
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
	
	
	//물품시설 2차 카테고리 목록 페이징 및 검색
	public Map<String, Object> selectListGoodsFacilityCategoryTwo(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListGoodsFacilityCategoryTwo - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategoryTwo - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategoryTwo - searchOption  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategoryTwo - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<GoodsFacilityCategoryDto> list = goodsFacilityCategoryDao.selectListGoodsFacilityCategoryTwo(map);
		logger.debug("selectListGoodsFacilityCategoryTwo - list  : " + list.toString());
		int total = goodsFacilityCategoryDao.totalCountGoodsFacilityCategoryTwo(map);
		logger.debug("selectListGoodsFacilityCategoryTwo - total  : " + total);
			
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
	
	//물품시설 3차 카테고리 목록 페이징 및 검색
	public Map<String, Object> selectListGoodsFacilityCategoryThree(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("selectListGoodsFacilityCategoryThree - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategoryThree - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategoryThree - searchOption  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategoryThree - keyword  : " + keyword);
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<GoodsFacilityCategoryDto> list = goodsFacilityCategoryDao.selectListGoodsFacilityCategoryThree(map);
		logger.debug("selectListGoodsFacilityCategoryTwo - list  : " + list.toString());
		int total = goodsFacilityCategoryDao.totalCountGoodsFacilityCategoryThree(map);
		logger.debug("selectListGoodsFacilityCategoryTwo - total  : " + total);
			
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
	
	//1차 리스트와 2차 리스트를 조인하기 위해 새로 만듦
	//조인리스트 1차 카테고리
	public List<GoodsFacilityCategoryDto> selectJoinListGoodsFacilityCategoryOne() {
		logger.info("---selectJoinListGoodsFacilityCategoryOne");
		return goodsFacilityCategoryDao.selectJoinListGoodsFacilityCategoryOne();
	}
	
	//1차 리스트와 2차 리스트, 3차 리스트를  조인하기 위해 새로 만듦
	//조인리스트 1차 카테고리
	public List<GoodsFacilityCategoryDto> selectJoinListGoodsFacilityCategoryTwo() {
		logger.info("---selectJoinListGoodsFacilityCategoryTwo");
		return goodsFacilityCategoryDao.selectJoinListGoodsFacilityCategoryTwo();
	}
	
	
	//1차 카테고리 등록하기
	public int insertGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("---insertGoodsFacilityCategoryOne");
		return goodsFacilityCategoryDao.insertGoodsFacilityCategoryOne(goodsFacilityCategoryDto);
	}
	
	//2차 카테고리 등록하기
	public int insertGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("insertGoodsFacilityCategoryTwo");
		int row = goodsFacilityCategoryDao.insertGoodsFacilityCategoryTwo(goodsFacilityCategoryDto);
		return row;
	}
	
	//3차 카테고리 등록하기
	public int insertGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.info("insertGoodsFacilityCategoryThree");
			int row = goodsFacilityCategoryDao.insertGoodsFacilityCategoryThree(goodsFacilityCategoryDto);
			return row;
	}
	
	//1차 카테고리 삭제
	public void deleteGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsfacilityOneCode) {
		goodsFacilityCategoryDao.deleteGoodsFacilityCategoryOne(goodsfacilityOneCode);
	}
	
	//2차 카테고리 삭제
	public void deleteGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsfacilityTwoCode) {
		goodsFacilityCategoryDao.deleteGoodsFacilityCategoryTwo(goodsfacilityTwoCode);
	}
	
	//3차 카테고리 삭제
	public void deleteGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsfacilityThreeCode) {
		goodsFacilityCategoryDao.deleteGoodsFacilityCategoryThree(goodsfacilityThreeCode);
	}

}
