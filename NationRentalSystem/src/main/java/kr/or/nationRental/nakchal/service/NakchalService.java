package kr.or.nationRental.nakchal.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NakchalService {
	@Autowired
	private NakchalDao nakchalDao;
	private static final Logger logger = LoggerFactory.getLogger(NakchalService.class);
	
	public List<NakchalDto> selectListAgencyNakchalInfo(NakchalDto nakchalDto) {
		logger.debug("selectListAgencyNakchalInfo NakchalService");
		return nakchalDao.selectListAgencyNakchalInfo(nakchalDto);
	}
}
