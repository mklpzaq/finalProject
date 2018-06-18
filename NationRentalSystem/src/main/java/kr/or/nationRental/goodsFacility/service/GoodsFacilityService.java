package kr.or.nationRental.goodsFacility.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.nationRental.citizen.service.CitizenDto;
import kr.or.nationRental.functionary.service.FunctionaryDto;

@Service
public class GoodsFacilityService {
	
	@Autowired
	private GoodsFacilityDao goodsFacilityDao;
	@Autowired
	private GoodsFacilityFileDao goodsFacilityFileDao;
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityService.class);
	
	public FunctionaryDto selectadminagency(FunctionaryDto functionaryDto) {
		logger.debug("GoodsFacilityService selectadminagency :");
		functionaryDto = goodsFacilityDao.selectadminagency(functionaryDto);
		return functionaryDto;
	}

	public void insertGoodsFacility(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("GoodsFacilityService insertGoodsFacility :");
		
		goodsFacilityDao.insertGoodsFacility(goodsFacilityDto);
		
	}
	
	@Transactional
	public void insertGoodsFacility(GoodsFacilityRequest goodsFacilityRequest, String path) {
		logger.debug("GoodsFacilityService insertGoodsFacility :" + goodsFacilityRequest.toString());
		List<MultipartFile> multipartFileList = goodsFacilityRequest.getMultipartfile();
		
		GoodsFacilityDto goodsFacilityDto = new GoodsFacilityDto();
		goodsFacilityDto.setGoodsfacilityCode(goodsFacilityRequest.getGoodsfacilityCode());
		goodsFacilityDto.setGoodsfacilityThreeCode(goodsFacilityRequest.getGoodsfacilityThreeCode());
		goodsFacilityDto.setGoodsfacilityName(goodsFacilityRequest.getGoodsfacilityName());
		goodsFacilityDto.setGoodsfacilityPurchaseprice(goodsFacilityRequest.getGoodsfacilityPurchaseprice());
		goodsFacilityDto.setGoodsfacilityPriceRental(goodsFacilityRequest.getGoodsfacilityPriceRental());
		goodsFacilityDto.setGoodsfacilityTextSangse(goodsFacilityRequest.getGoodsfacilityTextSangse());
		goodsFacilityDto.setAdminagencyCode(goodsFacilityRequest.getAdminagencyCode());
		goodsFacilityDto.setSigunguName(goodsFacilityRequest.getSigunguName());
		goodsFacilityDto.setSidoName(goodsFacilityRequest.getSidoName());
		goodsFacilityDto.setEupmyeonName(goodsFacilityRequest.getEupmyeonName());
		goodsFacilityDto.setGoodsfacilityAddressSangse(goodsFacilityRequest.getGoodsfacilityAddressSangse());
		goodsFacilityDto.setFunctionaryId(goodsFacilityRequest.getFunctionaryId());
		goodsFacilityDto.setGoodsfacilityClassifyGoodsfacility(goodsFacilityRequest.getGoodsfacilityClassifyGoodsfacility());
		goodsFacilityDto.setGoodsfacilityClassifyDonationpurchase(goodsFacilityRequest.getGoodsfacilityClassifyDonationpurchase());
		goodsFacilityDto.setGoodsfacilityIsExtra(goodsFacilityRequest.getGoodsfacilityIsExtra());
		goodsFacilityDto.setGoodsfacilityIsPossibleDelivery(goodsFacilityRequest.getGoodsfacilityStateAfterservice());
		goodsFacilityDto.setGoodsfacilityIsPossibleRental(goodsFacilityRequest.getGoodsfacilityIsPossibleRental());
		
		for(MultipartFile multipartFile : multipartFileList) {
			
			//16진수 유효아이디가 만들어진다?
			UUID uuid = UUID.randomUUID();
			String filename = uuid.toString();
			logger.debug("String filename : " + filename);
			//-문자를 찾아 없에고 문자열을 반환한다. 
			filename = filename.replace("-", "");
			//2.파일 확장자
			//lastIndexOf()문자열에서 마지막 문자열을 반환한다.
			//getOriginalFilename() 올린 파일의 전체 이름
			int doIndex = multipartFile.getOriginalFilename().lastIndexOf(".");
			logger.info("int doIndex : " + doIndex);
			String fileExt = multipartFile.getOriginalFilename().substring(doIndex+1);
			logger.info("String fileExt : " + fileExt);
			
			//3.파일 컨텐트 타입
			String fileType = multipartFile.getContentType();
			logger.info("String fileType : " + fileType);		
			
			//4.파일 사이즈
			long fileSize = multipartFile.getSize();
			//5.파일 저장(매개변수 path를 이용)
			File file = new File(path+filename+"."+fileExt);
			
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {			
				e.printStackTrace();
			} catch (IOException e) {			
				e.printStackTrace();
			}
			
			GoodsFacilityFile goodsFacilityFile = new GoodsFacilityFile();
			goodsFacilityFile.setGoodsfacilityFileName(filename);
			goodsFacilityFile.setGoodsfacilityFileExt(fileExt);
			goodsFacilityFile.setGoodsfacilityFileType(fileType);
			goodsFacilityFile.setGoodsfacilityFileSize(doIndex);
			logger.debug("goodsFacilityFile :" + goodsFacilityFile);
			goodsFacilityDto.getGoodsFacilityFile().add(goodsFacilityFile);
			
		}
			logger.debug("goodsFacilityDto : " + goodsFacilityDto);
			goodsFacilityDao.insertGoodsFacility(goodsFacilityDto);
			
			int goodsFacilityCode = goodsFacilityDto.getGoodsfacilityCode();
			logger.debug("goodsFacilityCode :" + goodsFacilityCode);
			for(GoodsFacilityFile goodsFacilityFile : goodsFacilityDto.getGoodsFacilityFile()) {				
				goodsFacilityFile.setGoodsfacilityCode(goodsFacilityCode);
				goodsFacilityFileDao.insertGoodsFacilityFile(goodsFacilityFile);
			}
		}	

	public Map<String, Object> getGoodsFacilityList(int currentPage, int pagePerRow, String searchOption, String keyword) {
		logger.debug("GoodsFacilityService getGoodsFacilityList : ");
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
		
		List<GoodsFacilityDto> list = goodsFacilityDao.getGoodsFacilityList(map);
		logger.debug("List<GoodsFacilityDto> : " + list);
		
		int total = goodsFacilityDao.totalCountGoodsFacility(map);
		
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

	public Map<String, Object> viewImageGoodsFacility(int currentPage, int pagePerRow, String searchOption,	String keyword) {
		logger.debug("GoodsFacilityService viewImageGoodsFacility : ");
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
		
		List<GoodsFacilityDto> list = goodsFacilityDao.viewImageGoodsFacility(map);
		logger.debug("viewImageGoodsFacility : " + list);
		
		int total = goodsFacilityDao.totalCountGoodsFacility(map);
		
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

	public GoodsFacilityDto viewImageDetail(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("GoodsFacilityService viewImageDetail : " + goodsFacilityDto.toString());		
		GoodsFacilityDto viewImageOne = goodsFacilityDao.viewImageDetail(goodsFacilityDto);		
		logger.debug("GoodsFacilityService viewImageOne : " + viewImageOne.toString());
		
		return viewImageOne;
	}

}
