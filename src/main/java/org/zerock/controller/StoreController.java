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
import org.zerock.domain.StoreVO;
import org.zerock.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store/*")
@AllArgsConstructor
public class StoreController {

	
	private StoreService service;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList2(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal2(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(StoreVO store, RedirectAttributes rttr) {
		
		log.info("register: " + store);
		
		service.register(store);
		
		rttr.addFlashAttribute("result", store.getT_vstng_cmpny());
		
		return "redirect:/store/list";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("t_vstng_cmpny") String t_vstng_cmpny, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("store", service.get(t_vstng_cmpny));
	}
	
	
	@PostMapping("/modify")
	public String modify(StoreVO store, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + store);
		
		if (service.modify(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/store/list" + cri.getListLink();
	}
	
	@PostMapping("/modify2")
	public String modify2(StoreVO store, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify2: " + store);
		
		if (service.modify(store)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/store/list2" + cri.getListLink();
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("t_vstng_cmpny") String t_vstng_cmpny, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + t_vstng_cmpny);
		if (service.remove(t_vstng_cmpny)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/store/list" + cri.getListLink();
	}
	
}
