package com.mc.full17th2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mc.full17th2.service.WeatherService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class WeatherController {
	
//	@Autowired
//	@Qualifier("weatherService")
//	WeatherService service;

	@GetMapping("/weather")
    public String showWeatherPage() {
        return "Weather"; 
    }
	 
    @PostMapping("/weather/search")
    public String SearchWeatherPage(HttpServletRequest request, HttpSession session, Model model) {
    
       
        return "Weather";
    }
	
	

}
