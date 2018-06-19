package kr.or.nationRental.goodsFacility.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.nationRental.functionary.service.FunctionaryDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityDto;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityRequest;
import kr.or.nationRental.goodsFacility.service.GoodsFacilityService;
import kr.or.nationRental.login.service.MemberDto;

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
			
		Map<String, Object> map = goodsFacilityService.selectadminagency(functionaryDto);		
		logger.debug(map.toString());
		
		model.addAttribute("functionaryDto", map.get("functionaryDto"));
		model.addAttribute("list", map.get("list"));
		
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
	
	@RequestMapping(value="/downloadFile", method=RequestMethod.GET)
	public void download(@RequestParam("goodsfacilityName") String goodsfacilityName
						,@RequestParam("goodsfacilityFileExt") String goodsfacilityFileExt
						,HttpServletRequest request
						, HttpServletResponse response
						,HttpSession session) throws Exception{
			String fullPath = session.getServletContext().getRealPath("/resources/image/goodsFacilityImage/") + goodsfacilityName + "." + goodsfacilityFileExt;
			logger.debug("GoodsFacilityController download fullPath" +fullPath.toString());
			File file = new File(fullPath);
			
			response.setContentType("application/download; utf-8");
			response.setContentLength((int)file.length());
			String userAgent = request.getHeader("User-Agent");
			boolean ie = userAgent.indexOf("MSIE") > -1;
			String fileName = null;
			
			if(ie){            
				fileName = URLEncoder.encode(file.getName(), "utf-8");
			} else {            
				fileName = new String(file.getName().getBytes("utf-8"));
			}        
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
				response.setHeader("Content-Transfer-Encoding", "binary");
				OutputStream out = response.getOutputStream();	        
				FileInputStream fis = null;
			
			try {            
				fis = new FileInputStream(file);
				FileCopyUtils.copy(fis, out);
			} catch(Exception e){            
				e.printStackTrace();             
			}finally{             
				if(fis != null){                 
				    try{
				        fis.close();
				    }catch(Exception e){}
				}
					out.flush();
			}    
		}
	@RequestMapping(value="/viewImageGoodsFacility", method=RequestMethod.GET)
	public String viewImageGoodsFacility(Model model			
										,@RequestParam(value="currentPage", defaultValue="1") int currentPage
										,@RequestParam(value="pagePerRow", defaultValue="10", required=true) int pagePerRow
										,@RequestParam(value="searchOption", defaultValue="") String searchOption
										,@RequestParam(value="keyword", defaultValue="") String keyword) {
		logger.debug("GoodsFacilityController viewImageGoodsFacility GET : ");
		
		Map<String, Object> map = goodsFacilityService.viewImageGoodsFacility(currentPage, pagePerRow, searchOption, keyword);
		logger.debug("viewImageGoodsFacility map : " + map.toString());
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginPageNumForCurrentPage", map.get("beginPageNumForCurrentPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pagePerRow", pagePerRow);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword); 
		
		return "/rentalGoodsFacility/viewImageGoodsFacility";		
	}
	
	@RequestMapping(value="/viewImageDetail", method=RequestMethod.GET)
	public String viewImageDetail(Model model
										,GoodsFacilityDto goodsFacilityDto) {
		logger.debug("GoodsFacilityController viewImageGoodsFacility GET : " + goodsFacilityDto.toString());		
		GoodsFacilityDto viewImageDetailOne = goodsFacilityService.viewImageDetail(goodsFacilityDto);
		logger.debug("GoodsFacilityController viewImageDetailOne GET : " + viewImageDetailOne.toString());
		
		model.addAttribute("viewImageDetailOne", viewImageDetailOne);
		model.addAttribute("GoodsFacilityFile", viewImageDetailOne.getGoodsFacilityFile());
		logger.debug("GoodsFacilityController viewImageDetailOne.getGoodsFacilityFile() : " + viewImageDetailOne.getGoodsFacilityFile().toString());
		
		return "rentalGoodsFacility/viewDetailGoodsFacility";
	}
}
