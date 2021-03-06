package kr.or.nationRental.district.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.administrator.service.AdministratorDto;

@Service
public class DistrictService {
	@Autowired
	private DistrictDao districtDao;
	
	private static final Logger logger = LoggerFactory.getLogger(DistrictService.class);
	
	//행정구역 전체 목록 보기
	public List<DistrictDto> selectListDistrict() {
		logger.info("---selectListDistrict");
		return districtDao.selectListDistrict();
	}
	
	//행정구역 시도 목록 보기
	public List<DistrictDto> selectListSido() {
		logger.info("---selectListSido");
		return districtDao.selectListSido();
	}
	
	//행정구역 시군구 목록 보기
	public List<DistrictDto> selectListSigungu() {
		logger.info("---selectListSigungu");
		return districtDao.selectListSigungu();
	}
	
	//행정구역 읍면동 목록 보기
	public List<DistrictDto> selectListEupmyeon() {
		logger.info("---selectListEupmyeon");
		return districtDao.selectListEupmyeon();
	}
	
	//시도 등록하기
	public int insertSido(DistrictDto districtDto) {
		logger.info("---insertSido");
		return districtDao.insertSido(districtDto);
	}
	
	//시군구 등록하기
	public int insertSigungu(DistrictDto districtDto) {
		logger.info("insertSigungu");
		int row = districtDao.insertSigungu(districtDto);
		return row;
	}
	
	//읍면동 등록하기
	public int insertEupmyeon(DistrictDto districtDto) {
		logger.info("insertEupmyeon");
		int row = districtDao.insertEupmyeon(districtDto);
		return row;
	}
	
	
	
}
