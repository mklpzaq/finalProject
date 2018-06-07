package kr.or.nationRental.district.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DistrictService {
	@Autowired
	private DistrictDao districtDao;
	
	private static final Logger logger = LoggerFactory.getLogger(DistrictService.class);
	
	//행정구역 목록
		public List<DistrictDto> selectListDistrict() {
			logger.info("---selectListDistrict");
			return districtDao.selectListDistrict();
		}
}
