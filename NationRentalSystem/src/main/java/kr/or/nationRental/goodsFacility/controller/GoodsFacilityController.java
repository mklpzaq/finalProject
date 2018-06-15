package kr.or.nationRental.goodsFacility.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityRequest;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;

@Controller
public class GoodsFacilityController {
	@Autowired 
	private GoodsFacilityService goodsFacilityService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityController.class);
	
	@RequestMapping(value="/getGoodsFacilityList", method=RequestMethod.GET)
	public String getGoodsFacilityList() {
		logger.debug("GET getGoodsFacilityList GoodsFacilityController");
		
		return "rentalGoodsFacility/rentalGoodsFacilityList";
	}
	
	@RequestMapping(value="/insertGoodsFacility", method=RequestMethod.GET)
	public String insertGoodsFacility(FunctionaryDto functionaryDto
										,Model model) {
		logger.debug("GET insertGoodsFacility GoodsFacilityController" + functionaryDto.toString());
			
		functionaryDto = goodsFacilityService.selectadminagency(functionaryDto);		
		logger.debug(functionaryDto.toString());
		model.addAttribute("functionaryDto", functionaryDto);
		
		return "/rentalGoodsFacility/insertGoodsFacilityForm";
	}
	
	@RequestMapping(value="/insertGoodsFacility", method=RequestMethod.POST)
	public String insertGoodsFacility(GoodsFacilityRequest goodsFacilityRequest
										,Model model
										,HttpSession session) {
		
		logger.debug("POST insertGoodsFacility GoodsFacilityController : " + goodsFacilityRequest.toString());	
		List<MultipartFile> list = goodsFacilityRequest.getMultipartfile();
		logger.debug("list : " + list);
		
		for(MultipartFile file : list) {
			String fileType = file.getContentType();			
			logger.debug("fileType : " + fileType);
			
			if(!fileType.equals("image/jpeg") && !fileType.equals("image/jpg") && !fileType.equals("image/png") &&
				!fileType.equals("image/bmp") && fileType.equals("image/webp")) {
				
				logger.debug("fileType : " + fileType);
				logger.info("이미지 파일이 아닙니다.");
				model.addAttribute("error", "alert('이미지 파일이 아닙니다.')");
				model.addAttribute("goodsfacilityCode", goodsFacilityRequest.getGoodsfacilityCode());
				model.addAttribute("goodsfacilityThreeCode", goodsFacilityRequest.getGoodsfacilityThreeCode());
				model.addAttribute("goodsfacilityName", goodsFacilityRequest.getGoodsfacilityName());
				model.addAttribute("goodsfacilityPurchaseprice", goodsFacilityRequest.getGoodsfacilityPurchaseprice());
				model.addAttribute("goodsfacilityPriceRental", goodsFacilityRequest.getGoodsfacilityPriceRental());
				model.addAttribute("goodsfacilityTextSangse", goodsFacilityRequest.getGoodsfacilityTextSangse());
				model.addAttribute("adminagencyCode", goodsFacilityRequest.getAdminagencyCode());
				model.addAttribute("sigunguName", goodsFacilityRequest.getSigunguName());
				model.addAttribute("sidoName", goodsFacilityRequest.getSidoName());
				model.addAttribute("eupmyeonName", goodsFacilityRequest.getEupmyeonName());
				model.addAttribute("goodsfacilityAddressSangse", goodsFacilityRequest.getGoodsfacilityAddressSangse());
				model.addAttribute("functionaryId", goodsFacilityRequest.getFunctionaryId());
				model.addAttribute("goodsfacilityClassifyGoodsfacility", goodsFacilityRequest.getGoodsfacilityClassifyGoodsfacility());
				model.addAttribute("goodsfacilityClassifyDonationpurchase", goodsFacilityRequest.getGoodsfacilityClassifyDonationpurchase());
				model.addAttribute("goodsfacilityIsExtra", goodsFacilityRequest.getGoodsfacilityIsExtra());
				model.addAttribute("goodsfacilityIsPossibleDelivery", goodsFacilityRequest.getGoodsfacilityIsPossibleDelivery());
				model.addAttribute("goodsfacilityStateAfterservice", goodsFacilityRequest.getGoodsfacilityStateAfterservice());
				model.addAttribute("goodsfacilityIsPossibleRental", goodsFacilityRequest.getGoodsfacilityIsPossibleRental());
				
				return "/rentalGoodsFacility/insertGoodsFacilityForm";
			}			
		}
		String path = session.getServletContext().getRealPath("/resources/image/goodsFacilityImage/");		
		logger.debug("path : " + path);
		goodsFacilityService.insertGoodsFacility(goodsFacilityRequest, path);		
		
		return "redirect:/selectGoodsFacilityList";
	}
	
	@RequestMapping(value="/selectGoodsFacilityList", method=RequestMethod.GET)
	public String getGoodsFacilityList(Model model
			,HttpSession session
			,@RequestParam(value="currentPage", defaultValue="1") int currentPage
			,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
			,@RequestParam(value="searchOption", defaultValue="") String searchOption
			,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("GoodsFacilityController GoodsFacilityList GET : ");
		
		Map<String, Object> map = goodsFacilityService.getGoodsFacilityList(currentPage, pagePerRow, searchOption, keyword);
	
		logger.debug("★★★★★★★★★★★★★★★★★★★★★");
		logger.debug(map.get("list").toString());
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword); 
		
		String path = session.getServletContext().getRealPath("/resources/image/goodsFacilityImage/");		
		logger.debug("path : " + path);
		model.addAttribute("path", path);
		
		return "/rentalGoodsFacility/goodsFacilityList";
	}
	
	@RequestMapping(value="/selectGoodsFacilityImage", method=RequestMethod.GET)
	public String selectGoodsFacilityImage(GoodsFacilityDto goodsFacilityDto
											,HttpSession session
											,Model model) {
		logger.debug("GoodsFacilityController selectGoodsFacilityImage GET : " + goodsFacilityDto+toString());
		
		GoodsFacilityDto goodsFacilityImage = goodsFacilityService.selectGoodsFacilityImage(goodsFacilityDto);
		model.addAttribute("goodsFacilityImage", goodsFacilityImage);	
		String path = session.getServletContext().getRealPath("/resources/image/goodsFacilityImage/");
		model.addAttribute("ImgPath", path);
		model.addAttribute("dot", ".");
		
		return "/rentalGoodsFacility/rentalGoodsFacilityList";
	}
}
