package com.mc.full17th2.dto;

import org.springframework.stereotype.Component;

@Component
public class ImageDTO2 {

	private String originalFilename;
	//int post_id;

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public Object getImageFile() {
	
		return originalFilename;
	}



}