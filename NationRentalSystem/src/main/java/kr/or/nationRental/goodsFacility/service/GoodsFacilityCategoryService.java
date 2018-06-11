package kr.or.nationRental.goodsFacility.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.district.service.DistrictDto;

@Service
public class GoodsFacilityCategoryService {
	@Autowired GoodsFacilityCategoryDao goodsFacilityCategoryDao;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityCategoryService.class);

	//행정구역 전체 목록 보기
	public List<GoodsFacilityCategoryDto> selectListGoodsFacilityCategory() {
		logger.info("---selectListGoodsFacilityCategory");
		return goodsFacilityCategoryDao.selectListGoodsFacilityCategory();
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
}
