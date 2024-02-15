package com.mc.full17th2.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

public class MuseumDTO {
		private int id;
		private String fcltyNm;
	    private String fcltyType;
	    private String rdnmadr;
	    private String lnmadr;
	    private double latitude; // double 타입으로 변경
	    private double longitude; // double 타입으로 변경
	    private String operPhoneNumber;
	    private String operInstitutionNm;
	    private String homepageUrl;
	    private String fcltyInfo;
	    private String weekdayOperOpenHhmm;
	    private String weekdayOperColseHhmm;
	    private String holidayOperOpenHhmm;
	    private String holidayCloseOpenHhmm;
	    private String rstdeInfo;
	    private String adultChrge;
	    private String yngbgsChrge;
	    private String childChrge;
	    private String etcChrgeInfo;
	    private String fcltyIntrcn;
	    private String trnsportInfo;
	    private String phoneNumber;
	    private String institutionNm;
	    private Date referenceDate; // Date 타입으로 변경
	    private String insttCode;
	
		public MuseumDTO(Map<String, Object> fieldValues) {
			 this.fcltyNm =  (String)fieldValues.get("fcltyNm");
		        this.fcltyType = (String)fieldValues.get("fcltyType");
		        this.rdnmadr =  (String)fieldValues.get("rdnmadr");
		        this.lnmadr =  (String)fieldValues.get("lnmadr");
		        this.latitude =  (double)fieldValues.get("latitude");
		        this.longitude =  (double)fieldValues.get("longitude");
		        this.operPhoneNumber = (String)fieldValues.get("operPhoneNumber");
		        this.operInstitutionNm = (String)fieldValues.get("operInstitutionNm");
		        this.homepageUrl = (String)fieldValues.get("homepageUrl");
		        this.fcltyInfo = (String)fieldValues.get("fcltyInfo");
		        this.weekdayOperOpenHhmm = (String)fieldValues.get("weekdayOperOpenHhmm");
		        this.weekdayOperColseHhmm = (String)fieldValues.get("weekdayOperColseHhmm");
		        this.holidayOperOpenHhmm = (String)fieldValues.get("holidayOperOpenHhmm");
		        this.holidayCloseOpenHhmm = (String)fieldValues.get("holidayCloseOpenHhmm");
		        this.rstdeInfo = (String)fieldValues.get("rstdeInfo");
		        this.adultChrge = (String)fieldValues.get("adultChrge");
		        this.yngbgsChrge = (String)fieldValues.get("yngbgsChrge");
		        this.childChrge = (String)fieldValues.get("childChrge");
		        this.etcChrgeInfo = (String)fieldValues.get("etcChrgeInfo");
		        this.fcltyIntrcn = (String)fieldValues.get("fcltyIntrcn");
		        this.trnsportInfo = (String)fieldValues.get("trnsportInfo");
		        this.phoneNumber = (String)fieldValues.get("phoneNumber");
		        this.institutionNm = (String)fieldValues.get("institutionNm");
		        // referenceDate 필드를 Date로 변환
		        String referenceDateString = (String) fieldValues.get("referenceDate");
		        if (referenceDateString != null && !referenceDateString.isEmpty()) {
		            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식에 맞게 포맷 설정
					try {
						Date referenceDate = dateFormat.parse(referenceDateString);
						this.referenceDate = referenceDate;
					} catch (ParseException e) {
						  // ParseException이 발생한 경우에 대한 예외 처리
						e.printStackTrace();// 또는 다른 예외 처리 방식을 선택
					}
		        }
		        this.insttCode = (String)fieldValues.get("insttCode");
	
	
	
}
		public String toString() {
		    return "MuseumDTO{" +
		            "fcltyNm='" + fcltyNm + '\'' +
		            ", fcltyType='" + fcltyType + '\'' +
		            ", rdnmadr='" + rdnmadr + '\'' +
		            ", lnmadr='" + lnmadr + '\'' +
		            ", latitude='" + latitude + '\'' +
		            ", longitude='" + longitude + '\'' +
		            ", operPhoneNumber='" + operPhoneNumber + '\'' +
		            ", operInstitutionNm='" + operInstitutionNm + '\'' +
		            ", homepageUrl='" + homepageUrl + '\'' +
		            ", fcltyInfo='" + fcltyInfo + '\'' +
		            ", weekdayOperOpenHhmm='" + weekdayOperOpenHhmm + '\'' +
		            ", weekdayOperColseHhmm='" + weekdayOperColseHhmm + '\'' +
		            ", holidayOperOpenHhmm='" + holidayOperOpenHhmm + '\'' +
		            ", holidayCloseOpenHhmm='" + holidayCloseOpenHhmm + '\'' +
		            ", rstdeInfo='" + rstdeInfo + '\'' +
		            ", adultChrge='" + adultChrge + '\'' +
		            ", yngbgsChrge='" + yngbgsChrge + '\'' +
		            ", childChrge='" + childChrge + '\'' +
		            ", etcChrgeInfo='" + etcChrgeInfo + '\'' +
		            ", fcltyIntrcn='" + fcltyIntrcn + '\'' +
		            ", trnsportInfo='" + trnsportInfo + '\'' +
		            ", phoneNumber='" + phoneNumber + '\'' +
		            ", institutionNm='" + institutionNm + '\'' +
		            ", referenceDate='" + referenceDate + '\'' +
		            ", insttCode='" + insttCode + '\'' +
		            '}';
		}
		public MuseumDTO() {
			super();
			// TODO Auto-generated constructor stub
		}
		public MuseumDTO(int id, String fcltyNm, String fcltyType, String rdnmadr, String lnmadr, double latitude,
				double longitude, String operPhoneNumber, String operInstitutionNm, String homepageUrl,
				String fcltyInfo, String weekdayOperOpenHhmm, String weekdayOperColseHhmm, String holidayOperOpenHhmm,
				String holidayCloseOpenHhmm, String rstdeInfo, String adultChrge, String yngbgsChrge, String childChrge,
				String etcChrgeInfo, String fcltyIntrcn, String trnsportInfo, String phoneNumber, String institutionNm,
				Date referenceDate, String insttCode) {
			this.id = id;
			this.fcltyNm = fcltyNm;
			this.fcltyType = fcltyType;
			this.rdnmadr = rdnmadr;
			this.lnmadr = lnmadr;
			this.latitude = latitude;
			this.longitude = longitude;
			this.operPhoneNumber = operPhoneNumber;
			this.operInstitutionNm = operInstitutionNm;
			this.homepageUrl = homepageUrl;
			this.fcltyInfo = fcltyInfo;
			this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
			this.weekdayOperColseHhmm = weekdayOperColseHhmm;
			this.holidayOperOpenHhmm = holidayOperOpenHhmm;
			this.holidayCloseOpenHhmm = holidayCloseOpenHhmm;
			this.rstdeInfo = rstdeInfo;
			this.adultChrge = adultChrge;
			this.yngbgsChrge = yngbgsChrge;
			this.childChrge = childChrge;
			this.etcChrgeInfo = etcChrgeInfo;
			this.fcltyIntrcn = fcltyIntrcn;
			this.trnsportInfo = trnsportInfo;
			this.phoneNumber = phoneNumber;
			this.institutionNm = institutionNm;
			this.referenceDate = referenceDate;
			this.insttCode = insttCode;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getFcltyNm() {
			return fcltyNm;
		}
		public void setFcltyNm(String fcltyNm) {
			this.fcltyNm = fcltyNm;
		}
		public String getFcltyType() {
			return fcltyType;
		}
		public void setFcltyType(String fcltyType) {
			this.fcltyType = fcltyType;
		}
		public String getRdnmadr() {
			return rdnmadr;
		}
		public void setRdnmadr(String rdnmadr) {
			this.rdnmadr = rdnmadr;
		}
		public String getLnmadr() {
			return lnmadr;
		}
		public void setLnmadr(String lnmadr) {
			this.lnmadr = lnmadr;
		}
		public double getLatitude() {
			return latitude;
		}
		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}
		public double getLongitude() {
			return longitude;
		}
		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}
		public String getOperPhoneNumber() {
			return operPhoneNumber;
		}
		public void setOperPhoneNumber(String operPhoneNumber) {
			this.operPhoneNumber = operPhoneNumber;
		}
		public String getOperInstitutionNm() {
			return operInstitutionNm;
		}
		public void setOperInstitutionNm(String operInstitutionNm) {
			this.operInstitutionNm = operInstitutionNm;
		}
		public String getHomepageUrl() {
			return homepageUrl;
		}
		public void setHomepageUrl(String homepageUrl) {
			this.homepageUrl = homepageUrl;
		}
		public String getFcltyInfo() {
			return fcltyInfo;
		}
		public void setFcltyInfo(String fcltyInfo) {
			this.fcltyInfo = fcltyInfo;
		}
		public String getWeekdayOperOpenHhmm() {
			return weekdayOperOpenHhmm;
		}
		public void setWeekdayOperOpenHhmm(String weekdayOperOpenHhmm) {
			this.weekdayOperOpenHhmm = weekdayOperOpenHhmm;
		}
		public String getWeekdayOperColseHhmm() {
			return weekdayOperColseHhmm;
		}
		public void setWeekdayOperColseHhmm(String weekdayOperColseHhmm) {
			this.weekdayOperColseHhmm = weekdayOperColseHhmm;
		}
		public String getHolidayOperOpenHhmm() {
			return holidayOperOpenHhmm;
		}
		public void setHolidayOperOpenHhmm(String holidayOperOpenHhmm) {
			this.holidayOperOpenHhmm = holidayOperOpenHhmm;
		}
		public String getHolidayCloseOpenHhmm() {
			return holidayCloseOpenHhmm;
		}
		public void setHolidayCloseOpenHhmm(String holidayCloseOpenHhmm) {
			this.holidayCloseOpenHhmm = holidayCloseOpenHhmm;
		}
		public String getRstdeInfo() {
			return rstdeInfo;
		}
		public void setRstdeInfo(String rstdeInfo) {
			this.rstdeInfo = rstdeInfo;
		}
		public String getAdultChrge() {
			return adultChrge;
		}
		public void setAdultChrge(String adultChrge) {
			this.adultChrge = adultChrge;
		}
		public String getYngbgsChrge() {
			return yngbgsChrge;
		}
		public void setYngbgsChrge(String yngbgsChrge) {
			this.yngbgsChrge = yngbgsChrge;
		}
		public String getChildChrge() {
			return childChrge;
		}
		public void setChildChrge(String childChrge) {
			this.childChrge = childChrge;
		}
		public String getEtcChrgeInfo() {
			return etcChrgeInfo;
		}
		public void setEtcChrgeInfo(String etcChrgeInfo) {
			this.etcChrgeInfo = etcChrgeInfo;
		}
		public String getFcltyIntrcn() {
			return fcltyIntrcn;
		}
		public void setFcltyIntrcn(String fcltyIntrcn) {
			this.fcltyIntrcn = fcltyIntrcn;
		}
		public String getTrnsportInfo() {
			return trnsportInfo;
		}
		public void setTrnsportInfo(String trnsportInfo) {
			this.trnsportInfo = trnsportInfo;
		}
		public String getPhoneNumber() {
			return phoneNumber;
		}
		public void setPhoneNumber(String phoneNumber) {
			this.phoneNumber = phoneNumber;
		}
		public String getInstitutionNm() {
			return institutionNm;
		}
		public void setInstitutionNm(String institutionNm) {
			this.institutionNm = institutionNm;
		}
		public Date getReferenceDate() {
			return referenceDate;
		}
		public void setReferenceDate(Date referenceDate) {
			this.referenceDate = referenceDate;
		}
		public String getInsttCode() {
			return insttCode;
		}
		public void setInsttCode(String insttCode) {
			this.insttCode = insttCode;
		}
		
}	