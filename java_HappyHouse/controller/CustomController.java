package com.ssafy.happyhouse.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.service.HouseDealService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/api/custom")
public class CustomController {

	private static final Logger logger = LoggerFactory.getLogger(CustomController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	private static List<Map<String, String>> cctvList, parkList, culturalFacilityList, hospitalList;
	
	
	@Autowired
	RestTemplate restTemplate;

	@Autowired
	private HouseDealService service;
	
//	// 1) 교수님께 질문 -> 이 함수명은 그대로 써야하는건가요?!?!? 함수명을 바꾸고 Model과 같은 파라미터를 넣어도 되나요
	@RequestMapping("/getcustominfo")
	public void restTemplate() {
		//cctvList = getCCTVInfo();
		//parkList = getParkInfo();
		culturalFacilityList = getCulturalFacilityInfo();
	}
	
	@ApiOperation(value = "집의 정보를 반환한다.", response = List.class)
	@GetMapping({ "/search/{dong}" })
	public ResponseEntity<List<HouseInfo>> search(Model model, HttpServletRequest req, @PathVariable String dong) {
		HousePageBean housePageBean = new HousePageBean();		
		List<HouseInfo> results = null;
		results = service.searchHouseInfo(dong);

		model.addAttribute("housedeals", results);
		
		return new ResponseEntity<List<HouseInfo>>(results, HttpStatus.OK);
	}
	
	// 2) 이거 jsp에서 받으려고 하는데 이렇게만 전달해주면 jsp에서 어떤 data로 어떻게 받아올 수 있는지!!
	@ApiOperation(value = "금천구 CCTV의 정보를 반환한다.", response = List.class)
	@GetMapping("/cctvinfo")
	public ResponseEntity<List<Map<String, String>>> retrieveCCTVInfo() throws Exception {
		logger.debug("CCTV 정보 - 호출");
		return new ResponseEntity<List<Map<String, String>>>(getCCTVInfo(), HttpStatus.OK);
	}
	
	@ApiOperation(value = "공원의 정보를 반환한다.", response = List.class)
	@GetMapping("/parkinfo")
	public ResponseEntity<List<Map<String, String>>> retrieveParkInfo() throws Exception {
		logger.debug("Park 정보 - 호출");
		return new ResponseEntity<List<Map<String, String>>>(getParkInfo(), HttpStatus.OK);
	}
	
	@ApiOperation(value = "문화 시설의 정보를 반환한다.", response = List.class)
	@GetMapping("/culturalfacilityinfo")
	public ResponseEntity<List<Map<String, String>>> retrieveCulturalFacilityInfo() throws Exception {
		logger.debug("CulturalFacility 정보 - 호출");
		return new ResponseEntity<List<Map<String, String>>>(getCulturalFacilityInfo(), HttpStatus.OK);
	}
	
	public List<Map<String, String>> getParkInfo() {
		UriComponents comp = UriComponentsBuilder.newInstance().scheme("http").host("openapi.seoul.go.kr").port("8088")
				.path("537452514c736b6337314a47515569/json/SearchParkInfoService/1/1000/").build();

		Map<String, Map<String, Object>> result = restTemplate.getForObject(comp.toUri(), Map.class);

		List<Map<String, String>> obArray = (ArrayList<Map<String, String>>) result.get("SearchParkInfoService")
				.get("row");

		System.out.println(obArray.get(1).get("P_PARK").toString());
		System.out.println(obArray.get(1).get("LATITUDE").toString());
		
		return obArray;
	}

	public List<Map<String, String>> getCCTVInfo() {
		UriComponents comp = UriComponentsBuilder.newInstance().scheme("http").host("openapi.seoul.go.kr").port("8088")
				.path("434d415347736b63393943734a7a75/json/TB_GC_VVTV_INFO_ID01/1/50/").build();

		Map<String, Map<String, Object>> result = restTemplate.getForObject(comp.toUri(), Map.class);

		List<Map<String, String>> obArray = (ArrayList<Map<String, String>>) result.get("TB_GC_VVTV_INFO_ID01")
				.get("row");

		System.out.println(obArray.get(1).get("GC_MAPNAME").toString());
		System.out.println(obArray.get(1).get("GC_MAPX").toString());

		return obArray;
	}
	
	
	// http://data.seoul.go.kr/dataList/OA-15487/S/1/datasetView.do
	public List<Map<String, String>> getCulturalFacilityInfo() {
		UriComponents comp = UriComponentsBuilder.newInstance().scheme("http").host("openapi.seoul.go.kr").port("8088")
				.path("5345467748736b6336386c4b516f65/json/culturalSpaceInfo/1/1000/").build();
		
		Map<String, Map<String, Object>> result = restTemplate.getForObject(comp.toUri(), Map.class);
		List<Map<String, String>> obArray = (ArrayList<Map<String, String>>) result.get("culturalSpaceInfo")
				.get("row");

		System.out.println(obArray.get(1).get("SUBJCODE").toString());
		System.out.println(obArray.get(1).get("ADDR").toString());
		
		String[] address = obArray.get(1).get("ADDR").toString().split(" ");
		System.out.println(address[1]);
		
		return obArray;
	}
	
}


