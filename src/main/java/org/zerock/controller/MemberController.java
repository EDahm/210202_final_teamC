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
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	
	private MemberService service;
	
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
	public String register(MemberVO member, RedirectAttributes rttr) {
		
		log.info("register: " + member);
		
		service.register(member);;
		
		rttr.addFlashAttribute("result", member.getM_num());
		
		return "redirect:/member/list";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("m_num") String m_num, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("member", service.get(m_num));
	}
	
	
	@PostMapping("/modify")
	public String modify(MemberVO member, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: " + member);
		
		if (service.modify(member)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/member/list" + cri.getListLink();
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("m_num") String m_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + m_num);
		if (service.remove(m_num)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/member/list" + cri.getListLink();
	}
	
}
