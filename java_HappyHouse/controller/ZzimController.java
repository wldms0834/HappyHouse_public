package com.ssafy.happyhouse.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.dto.PageNavigation;
import com.ssafy.happyhouse.dto.QnA;
import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.dto.Zzim;
import com.ssafy.happyhouse.service.ZzimService;

import io.swagger.annotations.ApiOperation;

@Controller
public class ZzimController extends HttpServlet{
    private static final long serialVersionUID = 1L;

    

	static Logger logger = LoggerFactory.getLogger(ZzimController.class);
	@Autowired
	private ZzimService service;

	@RequestMapping(value = "/zzim", method = RequestMethod.GET)
	public String zzim(Locale locale, Model model, HttpServletRequest req, HttpSession session) {
		UserInfo user =(UserInfo) session.getAttribute("userinfo");
		//List<Zzim> zzims =service.selectZzim(user.getId());
		List<Zzim> zzims = service.selectZzimJoin(user.getId());
		model.addAttribute("zzims", zzims);
		return "zzim/zzimlist";
	}
	

	@ApiOperation(value = "번호에 해당하는 찜의 정보를 반환한다.", response = Zzim.class)
	@GetMapping("{zzimNo}")
	public ResponseEntity<Zzim> detailZzim(@PathVariable int zzimNo, Model model) {
		ResponseEntity<Zzim> zzim = new ResponseEntity<Zzim>(service.selectZzimByNo(zzimNo), HttpStatus.OK);
		logger.debug("detailZzim 호출");
	//	model.addAttribute("zzimNo",zzim.getBody().getNo());
	//	logger.debug(String.valueOf(zzim.getBody().getNo()));
		return zzim;
	}

	@GetMapping({"/addzzim"})
	public String addZzim(Model model, @ModelAttribute Zzim dto, HttpSession session, HttpServletRequest req) {
		String id = req.getParameter("id"); // 검색 조건 - 번호, 동, 아파트명인지
		String no = req.getParameter("no"); // 검색할 단어 - 검색하려는 단어 문자열
		System.out.println(id +" " + no);
		Zzim zzim = new Zzim(id, no, dto.getZzimDatetime());

        try {
        	boolean result = service.insertZzim(zzim);
        	if(!result) {
        		logger.debug("찜 등록에 실패하였습니다.");
        		req.setAttribute("msg", "찜 등록에 실패하였습니다.");
        		
        	}else {
	        	session.setAttribute("Zzim", zzim);
        		logger.debug("찜 등록이 성공적으로 완료되었습니다.");
        		req.setAttribute("msg", "찜 등록이 성공적으로 완료되었습니다.");
        	}
        }catch (Exception e) {
			e.printStackTrace();
			logger.debug(e.getMessage());
			req.setAttribute("msg", e.getMessage());
		}
       
        return "housedeal/housedeallist";
	}
	
	@GetMapping({"/deleteZzim/detail"})
	public String deleteZzimdetail(Model model, @ModelAttribute Zzim dto, HttpSession session, HttpServletRequest req) {
        try{
        	String id = req.getParameter("id");
        	String no = req.getParameter("no"); 
        	boolean result=service.deleteZzimdetail(no,id);
        	if(!result) {
        		req.setAttribute("msg", "찜 삭제 중 문제가 발생하였습니다.");
        	}else {
        		req.setAttribute("msg", "찜 삭제가 완료되었습니다.");

        	}
        }catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
		}

        return "redirect:/zzim";	
	}
	
	
	@GetMapping({"/deleteZzim"})
	public String deleteZzim(Model model, @ModelAttribute Zzim dto, HttpSession session, HttpServletRequest req) {
        try{
        	int zzimNo = Integer.parseInt(req.getParameter("zzimNo")); 
        	boolean result=service.deleteZzim(zzimNo);
        	if(!result) {
        		req.setAttribute("msg", "찜 삭제 중 문제가 발생하였습니다.");
        	}else {
        		req.setAttribute("msg", "찜 삭제가 완료되었습니다.");

        	}
        }catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", e.getMessage());
		}

        return "redirect:/zzim";	
	}
	

}
