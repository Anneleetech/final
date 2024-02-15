package com.mc.full17th2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.mc.full17th2.dto.MuseumDTO;
import com.mc.full17th2.dto.MuseumDTOList;
import com.mc.full17th2.service.MuseumService;

@Controller
public class MuseumController {

	@Autowired
	@Qualifier("museumService")
	MuseumService service;
	//박람회 지도 
	@GetMapping("/ex")
	public String start() {
		return "Museum";
		
		
	}
	// 지도 검색
	@PostMapping("/ex/search")
	@ResponseBody
	public List<MuseumDTO> getMuseumInfo(@RequestParam String address) throws JsonMappingException, JsonProcessingException{		
		return service.getMuseumsByAddress(address);
		
	}
	
	
}
