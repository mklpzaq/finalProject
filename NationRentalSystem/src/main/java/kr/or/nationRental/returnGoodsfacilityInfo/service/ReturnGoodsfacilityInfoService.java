package kr.or.nationRental.returnGoodsfacilityInfo.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;

@Service
public class ReturnGoodsfacilityInfoService {
	
	@Autowired private ReturnGoodsfacilityInfoDao returnGoodsfacilityInfoDao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReturnGoodsfacilityInfoService.class);

	public ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoCheck(GoodsFacilityDto goodsFacilityDto) {
		logger.debug("ReturnGoodsfacilityInfoService - returnGoodsfacilityInfoCheck - goodsFacilityDto : " + goodsFacilityDto.toString());
		
		//대여/예약정보 셋팅, 반납등록품목 물품인지 시설인지 셋팅
		ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto = returnGoodsfacilityInfoDao.returnGoodsfacilityInfoCheck(goodsFacilityDto);
		logger.debug("ReturnGoodsfacilityInfoService - returnGoodsfacilityInfoCheck - returnGoodsfacilityInfoDto : " + returnGoodsfacilityInfoDto.toString());
		
		//이미 반납된 물품인지 확인하기 위해 대여/예약코드로 반납 데이터베이스에 등록된 정보가 있는지 확인
		int checkreturnGoodsfacilityInfo = returnGoodsfacilityInfoDao.checkreturnGoodsfacilityInfo(returnGoodsfacilityInfoDto);
		logger.debug("ReturnGoodsfacilityInfoService - returnGoodsfacilityInfoCheck - checkreturnGoodsfacilityInfo : " + checkreturnGoodsfacilityInfo);
		if(checkreturnGoodsfacilityInfo == 0) {
			//배달반납 신청유무가 반납등록에 왜 필요한지 모르겠다
			int IsOrderedDelivery = returnGoodsfacilityInfoDao.selectOneGoodsfacilityRentalIsOrderedDelivery(returnGoodsfacilityInfoDto.getGoodsfacilityRentalCode());
			if(IsOrderedDelivery == 0) {
				returnGoodsfacilityInfoDto.setIsRequestedToReturnAsDelivery("배달반납신청안함");
			}else {
				returnGoodsfacilityInfoDto.setIsRequestedToReturnAsDelivery("배달반납신청");
			}
			
			//연체날짜 계산식
			//근데 월별마다 30일 ,31일로 달라서 문제다
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd", Locale.KOREA );
			Date currentTime = new Date ();
			String NowTime = mSimpleDateFormat.format( currentTime );
			int NowTimeYear = Integer.parseInt(NowTime.substring(0, 4));
			int NowTimeMonth = Integer.parseInt(NowTime.substring(4, 6));
			int NowTimeDay = Integer.parseInt(NowTime.substring(6, 8));
			System.out.println("NowTimeYear" + NowTimeYear);
			System.out.println("NowTimeMonth" + NowTimeMonth);
			System.out.println("NowTimeDay" + NowTimeDay);
			
			Date GoodsfacilityRentalDayEnd = returnGoodsfacilityInfoDto.getGoodsfacilityRentalDayEnd();
			String huTime = mSimpleDateFormat.format( GoodsfacilityRentalDayEnd );
			int huTimeYear = Integer.parseInt(huTime.substring(0, 4));
			int huTimeMonth = Integer.parseInt(huTime.substring(4, 6));
			int huTimeDay = Integer.parseInt(huTime.substring(6, 8));
			System.out.println("huTimeYear" + huTimeYear);
			System.out.println("huTimeMonth" + huTimeMonth);
			System.out.println("huTimeDay" + huTimeDay);
			
			
			
			int Year = NowTimeYear-huTimeYear;
			int Month = NowTimeMonth-huTimeMonth;
			int Day = NowTimeDay-huTimeDay;
			
			
			System.out.println("huTimeYear" + (Year*365) + (Month*31) + Day);
			int OverdueDays = (Year*365) + (Month*30) + Day;
			
			
			if(OverdueDays>0) {
				returnGoodsfacilityInfoDto.setOverdueDays(OverdueDays);
			}else {
				returnGoodsfacilityInfoDto.setOverdueDays(0);
			}		
		
		}else {
			returnGoodsfacilityInfoDto = null;
		}
		
		
		
		return returnGoodsfacilityInfoDto;
	}
	
	//반납상태리스트
	public List<StateGoodsDto> stateGoodsCode() {
		return returnGoodsfacilityInfoDao.stateGoodsCode();
	}
	//반납등록
	public void insertReturnGoodsfacilityInfo(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto) {
		returnGoodsfacilityInfoDao.insertReturnGoodsfacilityInfo(returnGoodsfacilityInfoDto);
		
	}
	//등록된 반납정보 조회
	public Map<String, Object> selectReturnGoodsfacilityInfo(ReturnGoodsfacilityInfoDto returnGoodsfacilityInfoDto
																			, int currentPage
																			, int pagePerRow
																			, String searchOption
																			, String keyword
																			, DateDto dateDto) {
		logger.debug("ReturnGoodsfacilityInfoService - selectReturnGoodsfacilityInfo - keyword : " + keyword);
		logger.debug("ReturnGoodsfacilityInfoService - selectReturnGoodsfacilityInfo - dateDto : " + dateDto.toString());
		int beginRow = (currentPage-1)*pagePerRow; 
		int adminagencyCode = returnGoodsfacilityInfoDto.getAdminagencyCode();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ReturnGoodsfacilityInfoDto> list = null;
		if(dateDto.getEndDate() != null) {
			map.put("dateDto", dateDto);
			map.put("keyword", keyword);
			map.put("adminagencyCode", adminagencyCode);
			map.put("beginRow", beginRow);
			map.put("pagePerRow", pagePerRow);
			map.put("searchOption", searchOption);
			list = returnGoodsfacilityInfoDao.selectReturnGoodsfacilityInfo(map);
		}else{
			searchOption = "all";
			map.put("keyword", keyword);
			map.put("adminagencyCode", adminagencyCode);
			map.put("beginRow", beginRow);
			map.put("pagePerRow", pagePerRow);
			map.put("searchOption", searchOption);
			list = returnGoodsfacilityInfoDao.selectReturnGoodsfacilityInfo(map);
		}
		
		
		
		
		/*map.put("loginMemberId", loginMemberId);*/
		
		
		logger.debug("ReturnGoodsfacilityInfoService - selectReturnGoodsfacilityInfo - list  : " + list.toString());
		int total = returnGoodsfacilityInfoDao.totalCountSelectReturnGoodsfacilityInfo(map);
		logger.debug("ReturnGoodsfacilityInfoService - selectReturnGoodsfacilityInfo - total  : " + total);
			
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
