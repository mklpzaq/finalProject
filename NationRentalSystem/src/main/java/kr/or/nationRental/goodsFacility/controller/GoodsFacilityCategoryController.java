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

import kr.or.nationRental.administrator.service.AdministratorDto;
import kr.or.nationRental.district.service.DistrictDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityCategoryService;

@Controller
public class GoodsFacilityCategoryController {
	@Autowired GoodsFacilityCategoryService goodsFacilityCategoryService;
	private static final Logger logger = LoggerFactory.getLogger(GoodsFacilityCategoryController.class);

	//물품시설 카테고리 전체 목록 보기 및 페이징
	@RequestMapping(value="/selectListGoodsFacilityCategory", method=RequestMethod.GET)
	public String selectListGoodsFacilityCategory(Model model
										,HttpSession session
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="all") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("selectListGoodsFacilityCategory - currentPage : " + currentPage);
		logger.debug("selectListGoodsFacilityCategory - pagePerRow  : " + pagePerRow);
		logger.debug("selectListGoodsFacilityCategory - searchSelect  : " + searchOption);
		logger.debug("selectListGoodsFacilityCategory - keyword  : " + keyword);
		
		Map<String, Object> map = goodsFacilityCategoryService.selectListGoodsFacilityCategory(currentPage, pagePerRow, searchOption, keyword);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		logger.debug("list : "+ map.get("list"));
		logger.debug("lastPage : "+ map.get("lastPage"));
		logger.debug("beginPageNumForCurrentPage : "+ map.get("beginPageNumForCurrentPage"));
		logger.debug("currentPage : "+ currentPage);
		logger.debug("pagePerRow : "+ pagePerRow);
		logger.debug("searchOption : " + searchOption);
		logger.debug("keyword : " + keyword);
		
		return "goodsfacilityCategory/selectListGoodsFacility";
	}
	
	//물품시설 1차 카테고리 목록 보기
	@RequestMapping(value="/selectListGoodsFacilityCategoryOne", method=RequestMethod.GET)
	public String selectListGoodsFacilityCategoryOne(Model model) {
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList = goodsFacilityCategoryService.selectListGoodsFacilityCategoryOne();
		model.addAttribute("goodsFacilityCategoryDtoList", goodsFacilityCategoryDtoList);
		logger.debug("---selectListGoodsFacilityCategoryOne" + goodsFacilityCategoryDtoList);
		return "goodsfacilityCategory/selectListGoodsFacilityOne";
	}
	
	//물품시설 2차 카테고리 목록 보기
	@RequestMapping(value="/selectListGoodsFacilityCategoryTwo", method=RequestMethod.GET)
	public String selectListGoodsFacilityCategoryTwo(Model model) {
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList = goodsFacilityCategoryService.selectListGoodsFacilityCategoryTwo();
		model.addAttribute("goodsFacilityCategoryDtoList", goodsFacilityCategoryDtoList);
		logger.debug("---selectListGoodsFacilityCategoryTwo" + goodsFacilityCategoryDtoList);
		return "goodsfacilityCategory/selectListGoodsFacilityTwo";
	}
	
	//물품시설 3차 카테고리 목록 보기
	@RequestMapping(value="/selectListGoodsFacilityCategoryThree", method=RequestMethod.GET)
	public String selectListGoodsFacilityCategoryThree(Model model) {
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList = goodsFacilityCategoryService.selectListGoodsFacilityCategoryThree();
		model.addAttribute("goodsFacilityCategoryDtoList", goodsFacilityCategoryDtoList);
		logger.debug("---selectListGoodsFacilityCategoryThree" + goodsFacilityCategoryDtoList);
		return "goodsfacilityCategory/selectListGoodsFacilityThree";
	}
	
	//1차 카테고리 폼 불러오기
	@RequestMapping(value = "/insertGoodsFacilityCategoryOne", method = RequestMethod.GET)
	public String insertGoodsFacilityCategoryOne() {
		logger.debug("---insertGoodsFacilityCategoryOne");
   		return "goodsfacilityCategory/insertGoodsFacilityOne";
	}

	//1차 카테고리 등록 POST 호출
	@RequestMapping(value = "/insertGoodsFacilityCategoryOne", method = RequestMethod.POST)
	public String insertGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.debug("insertGoodsFacilityCategoryOne");
		goodsFacilityCategoryService.insertGoodsFacilityCategoryOne(goodsFacilityCategoryDto);
   		return "redirect:/selectListGoodsFacilityCategoryOne";
	}
		
	//2차 카테고리 폼 불러오기
	//1차 카테고리 리스트를 가져와야  조인할 수 있다.
	@RequestMapping(value = "/insertGoodsFacilityCategoryTwo", method = RequestMethod.GET)
	public String insertGoodsFacilityCategoryTwo(Model model) {
		logger.debug("---insertGoodsFacilityCategoryTwo");
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList = goodsFacilityCategoryService.selectListGoodsFacilityCategoryOne(); //1차카테고리 불러오기
		logger.debug("---goodsFacilityCategoryDtoList" + goodsFacilityCategoryDtoList);
		model.addAttribute("goodsFacilityCategoryDtoList", goodsFacilityCategoryDtoList);
   		return "goodsfacilityCategory/insertGoodsFacilityTwo";
	}
	
	//2차 카테고리  등록 post호출
	@RequestMapping(value="/insertGoodsFacilityCategoryTwo",  method = RequestMethod.POST)
	public String insertGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.debug(goodsFacilityCategoryDto.toString());
		int row = goodsFacilityCategoryService.insertGoodsFacilityCategoryTwo(goodsFacilityCategoryDto);
		return "redirect:/selectListGoodsFacilityCategoryTwo";
	}
	
	//3차 카테고리  등록 불러오기
	//1차 카테고리 리스트와 2차 카테고리 리스트를  가져와야 조인할 수 있다.
	@RequestMapping(value = "/insertGoodsFacilityCategoryThree", method = RequestMethod.GET)
	public String insertGoodsFacilityCategoryThree(Model model) {
		logger.debug("---insertGoodsFacilityCategoryThree");
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList = goodsFacilityCategoryService.selectListGoodsFacilityCategoryOne(); //1차 카테고리 불러오기
		List<GoodsFacilityCategoryDto> goodsFacilityCategoryDtoList2 = goodsFacilityCategoryService.selectListGoodsFacilityCategoryTwo(); //2차 카테고리 불러오기
		logger.debug("---districtDtoList 1차 카테고리 리스트" + goodsFacilityCategoryDtoList);
		logger.debug("---districtDtoList2 2차 카테고리 리스트" + goodsFacilityCategoryDtoList2);
		model.addAttribute("goodsFacilityCategoryDtoList", goodsFacilityCategoryDtoList);
		model.addAttribute("goodsFacilityCategoryDtoList2", goodsFacilityCategoryDtoList2);
   		return "goodsfacilityCategory/insertGoodsFacilityThree";
	}
		
	//3차 카테고리  등록 post호출
	@RequestMapping(value="/insertGoodsFacilityCategoryThree",  method = RequestMethod.POST)
	public String insertGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsFacilityCategoryDto) {
		logger.debug(goodsFacilityCategoryDto.toString());
		int row = goodsFacilityCategoryService.insertGoodsFacilityCategoryThree(goodsFacilityCategoryDto);
		return "redirect:/selectListGoodsFacilityCategoryThree";
	}
	
	//1차 카테고리 삭제
	@RequestMapping(value = "/deleteGoodsFacilityCategoryOne", method= RequestMethod.GET)
	public String deleteGoodsFacilityCategoryOne(GoodsFacilityCategoryDto goodsfacilityOneCode) {
		goodsFacilityCategoryService.deleteGoodsFacilityCategoryOne(goodsfacilityOneCode);
		return "redirect:/selectListGoodsFacilityCategoryOne";
	}
	
	//2차 카테고리 삭제
	@RequestMapping(value = "/deleteGoodsFacilityCategoryTwo", method= RequestMethod.GET)
	public String deleteGoodsFacilityCategoryTwo(GoodsFacilityCategoryDto goodsfacilityTwoCode) {
		goodsFacilityCategoryService.deleteGoodsFacilityCategoryTwo(goodsfacilityTwoCode);
		return "redirect:/selectListGoodsFacilityCategoryTwo";
	}
	
	//3차 카테고리 삭제
	@RequestMapping(value = "/deleteGoodsFacilityCategoryThree", method= RequestMethod.GET)
	public String deleteGoodsFacilityCategoryThree(GoodsFacilityCategoryDto goodsfacilityThreeCode) {
		goodsFacilityCategoryService.deleteGoodsFacilityCategoryThree(goodsfacilityThreeCode);
		return "redirect:/selectListGoodsFacilityCategoryThree";
	}
	
}
