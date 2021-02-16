package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;
import org.zerock.service.auctionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/auc/*")
@AllArgsConstructor
public class AuctionController {

	private auctionService service;
	
	//진행페이지
	@GetMapping("/now")
	public void now(Model model) {
		
		log.info("now");
		model.addAttribute("now", service.nowGetList());
		
	}
	
	//경매 전체 조회
		@GetMapping("/now_list")
		public void nowList(Model model) {
			
			log.info("nowList");
			model.addAttribute("now_list", service.nowGetList());
			
		}
	
	//진행 등록
	@PostMapping("/now_regi")
	public String apply(auctionVO auctionvo, RedirectAttributes rttr) {
		
		log.info("register: " + auctionvo);
		
		service.nowRegi(auctionvo);
		
		rttr.addFlashAttribute("result", auctionvo.getA_bno());
		
		return "redirect:/auc/apply_list";
	}
	
	//진행 조회
	@GetMapping({"/now_get", "/now_mod"})
	public void get(@RequestParam("a_bno") String a_bno, Model model) {
		
		log.info("/now_get or now_mod");
		model.addAttribute("nowlist", service.nowGet(a_bno));
		
	}
	
	//진행 수정
	@PostMapping("/now_mod")
	public String modify(auctionVO auctionvo, RedirectAttributes rttr) {
		log.info("modify:" + auctionvo);
		
		if(service.nowMod(auctionvo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/now_list";
		
	}
	
	//진행 삭제
	@PostMapping("/now_rem")
	public String remove(@RequestParam("a_bno") String a_bno, RedirectAttributes rttr) {
		
		log.info("remove..." + a_bno);
		
		if(service.nowRemove(a_bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/now_list";
		
	}
	
	//신청 목록
	@GetMapping("/apply_list")
	public void applyList(Model model) {
		
		log.info("apply_list");
		model.addAttribute("apply_list", service.applyGetList());
		
	}
	
	//신청 등록페이지
	@GetMapping("/apply_regi")
	public void applyRegi() {
		
	}
	
	@PostMapping("/apply_regi")
	public String applyRegi(aucApplyVO aucapplyvo, RedirectAttributes rttr) {
		
		log.info("register: " + aucapplyvo);
		
		service.applyIns(aucapplyvo);
		
		rttr.addFlashAttribute("result", aucapplyvo.getAa_bno());
		
		return "redirect:/auc/apply_list";
	}
	//신청 수정
	@PostMapping("/apply_mod")
	public String applyMod(aucApplyVO aucapplyvo, RedirectAttributes rttr) {
		log.info("modify:" + aucapplyvo);
		
		if(service.applyMod(aucapplyvo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/apply_list";
		
	}
	//신청 삭제
	@PostMapping("/apply_rem")
	public String applyRemove(@RequestParam("aa_bno") String aa_bno, RedirectAttributes rttr) {
		
		log.info("remove..." + aa_bno);
		
		if(service.applyRem(aa_bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		return "redirect:/auc/apply_list";
		
	}
	
	//신청 조회
		@GetMapping({"/apply_get", "/apply_mod"})
		public void applyGet(@RequestParam("aa_bno") String aa_bno, Model model) {
			
			log.info("/apply_get or apply_mod");
			model.addAttribute("applyget", service.applyGet(aa_bno));
			
		}
	
	//진행 등록페이지
	@GetMapping("/now_regi")
	public void nowRegi() {
	}
	
	//배송 전체 조회
	@GetMapping("/ship_list")
	public void shipList(Model model) {
		
		log.info("shipList");
		model.addAttribute("ship_list", service.shipGetList());
		
	}

	//배송 등록페이지
	@GetMapping("/ship_regi")
	public void shipRegi() {
		
	}
	
	@PostMapping("/ship_regi")
	public String shipRegi(aucShipVO aucshipvo, RedirectAttributes rttr) {
		
		log.info("register: " + aucshipvo);
		
		service.shipIns(aucshipvo);
		
		rttr.addFlashAttribute("result", aucshipvo.getA_bno());
		
		return "redirect:/auc/now";
	}
	
	//배송 단일 조회
		@GetMapping({"/ship_get", "/ship_mod"})
		public void shipGet(@RequestParam("a_bno") String a_bno, Model model) {
			
			log.info("/ship_get or ship_mod");
			model.addAttribute("shipget", service.shipGet(a_bno));
			
		}
	//배송 수정
		@PostMapping("/ship_mod")
		public String shipMod(aucShipVO aucshipvo, RedirectAttributes rttr) {
			log.info("modify:" + aucshipvo);
			
			if(service.shipMod(aucshipvo)) {
				rttr.addFlashAttribute("result","success");
			}
			
			return "redirect:/auc/ship_list" ;
			
		}
		
	//배송 삭제
		@PostMapping("/ship_rem")
		public String shipRemove(@RequestParam("a_bno") String a_bno, RedirectAttributes rttr) {
			
			log.info("remove..." + a_bno);
			
			if(service.shipRem(a_bno)) {
				rttr.addFlashAttribute("result","success");
			}
			
			return "redirect:/auc/ship_list";
			
		}
}
