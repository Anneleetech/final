package com.mc.full17th2.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mc.full17th2.dao.MuseumDAO;
import com.mc.full17th2.dto.MuseumDTO;
import com.mc.full17th2.dto.MuseumDTOList;

@Service
public class MuseumService {
	@Autowired
	MuseumDAO dao;

	@Value("${museum.openapi.service-key}")
	 private String museumServiceKey;

	private String jsonData;
	
	private String refreshDataFromAPI() {
	//public void buildUrl(int idx) throws IOException { 
		 try {// API에서 데이터 가져오기
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_museum_artgr_info_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode(museumServiceKey, "UTF-8")); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
       // urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(Integer.toString(idx), "UTF-8")); //페이지 번호
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("2261", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*XML/JSON 여부*/

        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        jsonData = sb.toString();
        
        return jsonData;
     
		 } catch (Exception e) {
	            e.printStackTrace();
	            //logger.error("Error occurred while refreshing data from API", e);
	            return null;
	        }
	
	    }
	
	 public List<MuseumDTO> processAndSaveMuseumData() {
		jsonData = refreshDataFromAPI();
		List<MuseumDTO> museumDTOList = new ArrayList<>();
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            JsonNode jsonNode = objectMapper.readTree(jsonData);
	            JsonNode itemsNode = jsonNode.path("response").path("body").path("items");
	         // itemsNode의 유형을 출력
	            System.out.println("itemsNode의 유형: " + itemsNode.getNodeType());
	         // itemsNode가 배열인 경우에 대한 처리
	            if (itemsNode.isArray()) {
	                // items 배열 반복 처리
	            for (JsonNode itemNode : itemsNode) {
;
	                // 필요한 값 추출
	                Iterator<Map.Entry<String, JsonNode>> fields = itemNode.fields();
	                Map<String, Object> fieldValues = new HashMap<>();
	          
	                while (fields.hasNext()) {
	                    Map.Entry<String, JsonNode> field = fields.next();
	                    fieldValues.put(field.getKey(), field.getValue().asText());
	                }
	                try {
	             // MuseumDTO 생성 및 리스트에 추가
	                MuseumDTO museumDTO =  convertJsonToDTO(fieldValues);
	                museumDTOList.add(museumDTO);
	                } catch (Exception e) {
	                	System.out.println("MuseumDTO 생성 및 리스트에 추가시 오류");
	                    e.printStackTrace();
	                    // 예외 발생 시 로그에 출력하고 다른 처리 방식을 선택.
	                }
	            }
	            } else {
	                System.out.println("No items found in the API response.");
	            }
	            
	            // 리스트가 비어있는지 확인
	            if (museumDTOList.isEmpty()) {
	                System.out.println("No items found in the API response.");
	                return museumDTOList;
	            }
	         // 결과 값 출력
	            for (MuseumDTO museumDTO : museumDTOList) {
	            	  System.out.println(museumDTO);
	            }
	         // 전체 결과 값 출력
	            System.out.println("Entire MuseumDTO List:");
	            System.out.println(museumDTOList.toString());
	         // 데이터베이스에 추가
	            if (!museumDTOList.isEmpty()) {
	            	   // 수정된 부분: MuseumDTOList를 생성하여 전달
	                MuseumDTOList MuseumDTOList = new MuseumDTOList();
	                MuseumDTOList.setMuseumDTOList(museumDTOList);
	                dao.insertMuseumInfo(MuseumDTOList);
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            // 예외 처리
	        }
	        return museumDTOList;
			
	    }



	 public MuseumDTO convertJsonToDTO(Map<String, Object> fieldValues) throws ParseException {
	        MuseumDTO museumDTO = new MuseumDTO();
	        try {
	        museumDTO.setFcltyNm((String)fieldValues.get("fcltyNm"));
	        museumDTO.setFcltyType((String)fieldValues.get("fcltyType"));
	        museumDTO.setRdnmadr((String)fieldValues.get("rdnmadr"));
	        museumDTO.setLnmadr((String)fieldValues.get("lnmadr"));
	     // latitude와 longitude의 값이 String으로 들어오는 경우를 처리
	        if (fieldValues.get("latitude") instanceof String) {
	            museumDTO.setLatitude(Double.parseDouble((String) fieldValues.get("latitude")));
	        } else {
	            museumDTO.setLatitude((Double) fieldValues.get("latitude"));
	        }
	        if (fieldValues.get("longitude") instanceof String) {
	            museumDTO.setLongitude(Double.parseDouble((String) fieldValues.get("longitude")));
	        } else {
	            museumDTO.setLongitude((Double) fieldValues.get("longitude"));
	        }

	        museumDTO.setOperPhoneNumber((String)fieldValues.get("operPhoneNumber"));
	        museumDTO.setOperInstitutionNm((String)fieldValues.get("operInstitutionNm"));
	        museumDTO.setHomepageUrl((String)fieldValues.get("homepageUrl"));
	        museumDTO.setFcltyInfo((String)fieldValues.get("fcltyInfo"));
	        museumDTO.setWeekdayOperOpenHhmm((String)fieldValues.get("weekdayOperOpenHhmm"));
	        museumDTO.setWeekdayOperColseHhmm((String)fieldValues.get("weekdayOperColseHhmm"));
	        museumDTO.setHolidayOperOpenHhmm((String)fieldValues.get("holidayOperOpenHhmm"));
	        museumDTO.setHolidayCloseOpenHhmm((String)fieldValues.get("holidayCloseOpenHhmm"));
	        museumDTO.setRstdeInfo((String)fieldValues.get("rstdeInfo"));
	        museumDTO.setAdultChrge((String)fieldValues.get("adultChrge"));
	        museumDTO.setYngbgsChrge((String)fieldValues.get("yngbgsChrge"));
	        museumDTO.setChildChrge((String)fieldValues.get("childChrge"));
	        museumDTO.setEtcChrgeInfo((String)fieldValues.get("etcChrgeInfo"));
	        museumDTO.setFcltyIntrcn((String)fieldValues.get("fcltyIntrcn"));
	        museumDTO.setTrnsportInfo((String)fieldValues.get("trnsportInfo"));
	        museumDTO.setPhoneNumber((String)fieldValues.get("phoneNumber"));
	        museumDTO.setInstitutionNm((String)fieldValues.get("institutionNm"));
	     // referenceDate 필드를 Date로 변환
	        String referenceDateString = (String) fieldValues.get("referenceDate");
	        if (referenceDateString != null && !referenceDateString.isEmpty()) {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식에 맞게 포맷 설정
	            Date referenceDate = dateFormat.parse(referenceDateString);
	            museumDTO.setReferenceDate(referenceDate);
	        }
	        museumDTO.setInsttCode((String)fieldValues.get("insttCode"));
	        } catch (Exception e) {
	        	 System.err.println("Error while converting JSON to DTO. Field values: " + fieldValues);
	            e.printStackTrace();
	            // 예외 발생 시 로그에 출력하고 빈 MuseumDTO 반환 또는 다른 예외 처리 방식을 선택
	            throw e;
	        }

	        return museumDTO;
	    }
	


	public List<MuseumDTO> getMuseumsByAddress(String address) {
	    // 데이터가 없거나 갱신이 필요할 때만 API에서 데이터를 가져와서 저장
	    if (dao.selectAllCnt() <1) {
	    	
	    	processAndSaveMuseumData();
	    }
	    // 주소에 해당하는 미술관 목록을 반환
	    List<MuseumDTO> result= dao.selectByAddr(address);
	    System.out.println(result);
	    return result;
	}



}
