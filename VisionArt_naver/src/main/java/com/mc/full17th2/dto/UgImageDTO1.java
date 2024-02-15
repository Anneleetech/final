package com.mc.full17th2.dto;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
@Component
public class UgImageDTO1{

	    private MultipartFile imageFile;
	   
	    private List<MultipartFile> imageFiles;

	    public List<MultipartFile> getImageFiles() {
	        return imageFiles;
	    }

	    public void setImageFiles(List<MultipartFile> imageFiles) {
	        this.imageFiles = imageFiles;
	    }
	    
	    public MultipartFile getImageFile() {
	        return imageFile;
	    }

	    public void setImageFile(MultipartFile imageFile) {
	        this.imageFile = imageFile;
	    }

		
	}
