package kr.or.nationRental.goodsFacility.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.adminagency.service.AdminagencyDto;
import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.district.service.DistrictDto;

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
	
	//물품시설 1차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryOne() {
		logger.info("---selectListGoodsFacilityCategoryOne");
		return goodsFacilityCategoryDao.selectListGoodsFacilityCategoryOne();
	}
	
	//물품시설 2차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryTwo() {
		logger.info("---selectListGoodsFacilityCategoryTwo");
		return goodsFacilityCategoryDao.selectListGoodsFacilityCategoryTwo();
	}
	
	//물품시설 3차 카테고리 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategoryThree() {
		logger.info("---selectListGoodsFacilityCategoryThree");
		return goodsFacilityCategoryDao.selectListGoodsFacilityCategoryThree();
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
