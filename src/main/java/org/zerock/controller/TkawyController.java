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
import org.zerock.domain.TkawyVO;
import org.zerock.service.TkawyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/tkawy/*")
@AllArgsConstructor
public class TkawyController {

	
	private TkawyService service;
	
	
	@GetMapping("/main")
	public void tkawyMain() {
		
	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(TkawyVO tkawy, RedirectAttributes rttr) {
		
		log.info("register: " + tkawy);
		
		service.register(tkawy);
		
		rttr.addFlashAttribute("result", tkawy.getT_bno());
		
		return "redirect:/tkawy/list";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("tkawy", service.get(t_bno));
	}
	
	
	@PostMapping("/modify")
	public String modify(TkawyVO tkawy, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + tkawy);
		
		if (service.modify(tkawy)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/tkawy/list" + cri.getListLink();
	}
	
	@PostMapping("/modifycanceled")
	public String modifyCanceled(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modifyCanceled..." + t_bno);
		if (service.modifyCanceled(t_bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/tkawy/list" + cri.getListLink();
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("t_bno") String t_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + t_bno);
		if (service.remove(t_bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/tkawy/list" + cri.getListLink();
	}
	
}
