package org.zerock.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class MainController {
	
	@GetMapping("/main")
	public void main() {
		
		
	}
	
	@GetMapping("/mypages")
	public void mypages() {
		
		
	}
	
	@GetMapping("/storelocation")
	public void storeLocation() {
		
		
	}
	

	@GetMapping("/about_zerowaste")
	public void about_zerowaste() {
		
		
	}
	
	@GetMapping("/intro")
	public void intro() {
		
		
	}
	
	@GetMapping("/contactUs")
	public void contactUs() {
		
		
	}
	
	

}














