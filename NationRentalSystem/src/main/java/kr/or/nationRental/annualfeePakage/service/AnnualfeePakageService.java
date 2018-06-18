package kr.or.nationRental.annualfeePakage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class AnnualfeePakageService {
	
	@Autowired
	private AnnualfeePakageDao annualfeePakageDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AnnualfeePakageService.class);
	
	@Transactional
	public void insertAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageService - insertannualfeePakage - annualfeePakageDto : " + annualfeePakageDto.toString());
				
		annualfeePakageDao.insertAnnualfeePakage(annualfeePakageDto);
		
		if(annualfeePakageDto.getAdminagencyCode() != null) {
			for(int i= 0; i<annualfeePakageDto.getAdminagencyCode().size(); i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("adminagencyCode", annualfeePakageDto.getAdminagencyCode().get(i));
				map.put("annualfeePakageCode", annualfeePakageDto.getAnnualfeePakageCode());
				annualfeePakageDao.insertAnnualfeePakageAuthority(map);				
			}	
		}
	}

	
	public Map<String, Object> selectListFunctionary(int currentPage, int pagePerRow, String searchOption,
			String keyword) {
		
		int beginRow = (currentPage-1)*pagePerRow; 

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("pagePerRow", pagePerRow);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);/*
		map.put("loginMemberId", loginMemberId);*/
		
		List<AnnualfeePakageDto> list = annualfeePakageDao.selectListAnnualfeePakage(map);
		logger.debug("AnnualfeePakageService - selectListAnnualfeePakage - list  : " + list.toString());
		int total = annualfeePakageDao.totalCountAnnualfeePakage(map);
		logger.debug("AnnualfeePakageService - totalCountAnnualfeePakage - total  : " + total);
			
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

	//상세보기화면에 뿌려줄 데이터들 select
	public AnnualfeePakageDto annualfeePakageSangse(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageService - annualfeePakageSangse - annualfeePakageDto  : " + annualfeePakageDto.toString());
		AnnualfeePakageDto returnAnnualfeePakageDto = annualfeePakageDao.annualfeePakageSangse(annualfeePakageDto);
		logger.debug("AnnualfeePakageService - annualfeePakageSangse - returnAnnualfeePakageDto  : " + returnAnnualfeePakageDto.toString());
		return returnAnnualfeePakageDto;
	}

	
	@Transactional
	public void deleteAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		//annualfeePakage삭제처리
		annualfeePakageDao.deleteAnnualfeePakage(annualfeePakageDto);
		
		//annualfeePakageAuthority삭제처리
		annualfeePakageDao.deleteAnnualfeePakageAuthority(annualfeePakageDto);
		
	}


	public AnnualfeePakageDto updateVeiwAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
	//annualfeePakageSangse메서드에서 이미 selectOne메서드가 있기때문에 해당 매서드로 updateform 구성
		return annualfeePakageDao.annualfeePakageSangse(annualfeePakageDto);
	}

	
	public void updateAnnualfeePakage(AnnualfeePakageDto annualfeePakageDto) {
		
		logger.debug("AnnualfeePakageService - updateAnnualfeePakage - annualfeePakageDto  : " + annualfeePakageDto.toString());
		//annualfee_pakage테이블의 데이터 update 처리
		annualfeePakageDao.updateAnnualfeePakage(annualfeePakageDto);
		
		//annualfee_pakage_authority테이블의 데이터 delete 처리
		//위에 deleteAnnualfeePakageAuthority는 해당 패키지내에 적용 행정기관을 모두 삭제하는 것이고
		//이번에 것은 선택된 행정기관만 삭제하는 것이다
		if(annualfeePakageDto.getAnnualfeePakageAuthorityCode() != null) {
			for(int i=0; i<annualfeePakageDto.getAnnualfeePakageAuthorityCode().size(); i++) {
					annualfeePakageDao.deleteCheckAnnualfeePakageAuthority(annualfeePakageDto.getAnnualfeePakageAuthorityCode().get(i));
			}
		}
		
		//annualfee_pakage_authority테이블의 데이터 insert 처리
		if(annualfeePakageDto.getAdminagencyCode() != null) {
			for(int i= 0; i<annualfeePakageDto.getAdminagencyCode().size(); i++) {
				Map<String, Integer> map = new HashMap<String, Integer>();
				map.put("adminagencyCode", annualfeePakageDto.getAdminagencyCode().get(i));
				map.put("annualfeePakageCode", annualfeePakageDto.getAnnualfeePakageCode());
				annualfeePakageDao.insertAnnualfeePakageAuthority(map);				
			}
		}
		
	}


	public void insertAnnualfeePakageOwnership(AnnualfeePakageDto annualfeePakageDto) {
		logger.debug("AnnualfeePakageService - insertAnnualfeePakageOwnership - annualfeePakageDto  : " + annualfeePakageDto.toString());
		annualfeePakageDao.insertAnnualfeePakageOwnership(annualfeePakageDto);
		
	}


	public List<AnnualfeePakageDto> selectListAnnualfeePakageOwnership(String memeberId) {
		logger.debug("AnnualfeePakageService - selectListAnnualfeePakageOwnership - memeberId  : " + memeberId);
		return annualfeePakageDao.selectListAnnualfeePakageOwnership(memeberId);		
	}


	

}
