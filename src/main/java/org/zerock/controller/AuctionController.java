package org.zerock.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AucAttachVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucComVO;
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
	public void now(Criteria cri, Model model) {
		
		log.info("now");
		model.addAttribute("now", service.nowStateList());
		model.addAttribute("countBid", service.getCountBid(cri));
		model.addAttribute("bestmember", service.nowBestMember());
	}
	
	//경매 전체 조회
		@GetMapping("/now_list")
		public void nowList(Criteria cri, Model model) {
			
			log.info("nowList");
			model.addAttribute("now_list", service.nowGetList(cri));
			
			int total = service.getTotalNow(cri);
			
			log.info("total: "+ total);
			
			model.addAttribute("pageMaker", new PageDTO(cri, total));
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
	public void get(@RequestParam("a_bno") String a_bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/now_get or now_mod");
		model.addAttribute("nowlist", service.nowGet(a_bno));
		
	}
	
	//진행 수정
	@PostMapping("/now_mod")
	public String modify(auctionVO auctionvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + auctionvo);
		
		if(service.nowMod(auctionvo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/auc/now_list";
		
	}
	
	//진행 삭제
	@PostMapping("/now_rem")
	public String remove(@RequestParam("a_bno") String a_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + a_bno);
		
		if(service.nowRemove(a_bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/auc/now_list";
		
	}

	//진행 등록페이지
	@GetMapping("/now_regi")
	public void nowRegi() {
	}
	
	
	
	////////////////////////////////////////////////////////////////////
	
	//신청 목록
	@GetMapping("/apply_list")
	public void applyList(Criteria cri, Model model) {
		
		log.info("list:" + cri);
		model.addAttribute("apply_list", service.applyGetList(cri));
		
		int total = service.getTotalApply(cri);
		
		log.info("total: "+ total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		
	}
	
	//신청 등록페이지
	@GetMapping("/apply_regi")
	public void applyRegi() {
	
	}
	
	@PostMapping("/apply_regi")
	public String applyRegi(aucApplyVO aucapplyvo, RedirectAttributes rttr) {
		
		log.info("register: " + aucapplyvo);
		
		if(aucapplyvo.getAttachList() != null) {
			
			aucapplyvo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.applyIns(aucapplyvo);
		
		rttr.addFlashAttribute("result", aucapplyvo.getAa_bno());
		
		return "redirect:/auc/apply_list";
	}
	//신청 수정
	@PostMapping("/apply_mod")
	public String applyMod(aucApplyVO aucapplyvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify:" + aucapplyvo);
		
		if(service.applyMod(aucapplyvo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/auc/apply_list";
		
	}
	//신청 삭제
	@PostMapping("/apply_rem")
	public String applyRemove(@RequestParam("aa_bno") String aa_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("remove..." + aa_bno);
		
		List<AucAttachVO> attachList = service.getAttachList(aa_bno);
				
		if(service.applyRem(aa_bno)) {
			
			//delete Attach Files
			aucDeleteFiles(attachList);
			
			rttr.addFlashAttribute("result","success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/auc/apply_list";
		
	}
	
	//신청 첨부파일 삭제
	private void aucDeleteFiles(List<AucAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files.....................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getAa_upload_path()+"\\" + attach.getAa_uuid()+"_"+attach.getAa_file_name());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("c:\\upload\\" + attach.getAa_upload_path()+"\\s_" + attach.getAa_uuid()+"_"+attach.getAa_file_name());
					
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
		
	}
	
	//신청 조회
		@GetMapping({"/apply_get", "/apply_mod"})
		public void applyGet(@RequestParam("aa_bno") String aa_bno, @ModelAttribute("cri") Criteria cri, Model model) {
			
			log.info("/apply_get or apply_mod");
			model.addAttribute("applyget", service.applyGet(aa_bno));
			
		}
		
	//신청 첨부파일 관련
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AucAttachVO>> getAttachList(String aa_bno){
		
		log.info("getAttachList " + aa_bno);
		
		return new ResponseEntity<>(service.getAttachList(aa_bno), HttpStatus.OK);
		
	}
		
		
	////////////////////////////////////////////////////////////////////
	
	
	//배송 전체 조회
	@GetMapping("/ship_list")
	public void shipList(Criteria cri, Model model) {
		
		log.info("shipList");
		model.addAttribute("ship_list", service.shipGetList(cri));
		int total = service.getTotalShip(cri);
		log.info("total : "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
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
		public void shipGet(@RequestParam("a_bno") String a_bno, @ModelAttribute("cri") Criteria cri, Model model) {
			
			log.info("/ship_get or ship_mod");
			model.addAttribute("shipget", service.shipGet(a_bno));
			
		}
	//배송 수정
		@PostMapping("/ship_mod")
		public String shipMod(aucShipVO aucshipvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			log.info("modify:" + aucshipvo);
			
			if(service.shipMod(aucshipvo)) {
				rttr.addFlashAttribute("result","success");
			}
			
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/auc/ship_list" ;
			
		}
		
	//배송 삭제
		@PostMapping("/ship_rem")
		public String shipRemove(@RequestParam("a_bno") String a_bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
			
			log.info("remove..." + a_bno);
			
			if(service.shipRem(a_bno)) {
				rttr.addFlashAttribute("result","success");
			}
			
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
			
			return "redirect:/auc/ship_list";
			
		}
		
		
		///////////////////////////////////////////////////////////////////
		
	//업체 전체 조회
		@GetMapping("/com_list")
		public void aucComList(Criteria cri, Model model) {
			
			log.info("aucComList");
			model.addAttribute("com_list", service.aucComList(cri));
			
			int total = service.getTotalCom(cri);
			
			log.info("total: "+ total);
			
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		}
		
		//업체 등록페이지
		@GetMapping("/com_regi")
		public void aucComRegi() {
			
		}
		
		@PostMapping("/com_regi")
		public String aucComRegi(aucComVO auccomvo, RedirectAttributes rttr) {
			
			log.info("register: " + auccomvo);
			
			service.aucComIns(auccomvo);
			
			rttr.addFlashAttribute("result", auccomvo.getC_num());
			
			return "redirect:/auc/com_list";
		}
		
		//업체 단일 조회
			@GetMapping({"/com_get", "/com_mod"})
			public void comGet(@RequestParam("c_num") String c_num,@ModelAttribute("cri") Criteria cri, Model model) {
				
				log.info("/com_get or com_mod");
				model.addAttribute("comget", service.aucComGet(c_num));
				
			}
			
		//업체 수정
			@PostMapping("/com_mod")
			public String comMod(aucComVO auccomvo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
				log.info("modify:" + auccomvo);
				
				if(service.aucComMod(auccomvo)) {
					rttr.addFlashAttribute("result","success");
				}
				
				rttr.addAttribute("pageNum", cri.getPageNum());
				rttr.addAttribute("amount", cri.getAmount());
				
				return "redirect:/auc/com_list" ;
				
			}
			
		//업체 삭제
			@PostMapping("/com_rem")
			public String comRemove(@RequestParam("c_num") String c_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
				
				log.info("remove..." + c_num);
				
				if(service.aucComDel(c_num)) {
					rttr.addFlashAttribute("result","success");
				}
				
				rttr.addAttribute("pageNum", cri.getPageNum());
				rttr.addAttribute("amount", cri.getAmount());
				
				return "redirect:/auc/com_list";
				
			}
			
		/////////////////////////////////////////////////////////////
			
			//입찰정보 전체 조회
			@GetMapping("/bid_list")
			public void aucBidList(Criteria cri, Model model) {
				
				log.info("aucbidList");
				model.addAttribute("bid_list", service.bidGetList(cri));
				
				int total = service.getTotalBid(cri);
				
				log.info("total: "+ total);
				
				model.addAttribute("pageMaker", new PageDTO(cri, total));
				
				
			}
			
			
			//입찰정보 등록+적립
			@PostMapping("/bid_regi")
			public String aucBidRegi(aucBidVO aucbidvo, RedirectAttributes rttr) {
				
				log.info("register: " + aucbidvo);
				
				service.bidInsPoint(aucbidvo);
				
				rttr.addFlashAttribute("result", aucbidvo.getB_bid_price());
				
				return "redirect:/auc/now";
			}
			
			//입찰정보 삭제
			@PostMapping("/bid_rem")
			public String bidRemove(@RequestParam("m_num") String m_num, @Param("b_bid_price") int b_bid_price, @ModelAttribute Criteria cri, RedirectAttributes rttr) throws Exception {
				
				log.info("remove..." + m_num + " : " + b_bid_price);
				
				if(service.bidRemove(m_num, b_bid_price)) {
					rttr.addFlashAttribute("result","success");
				}
				
				rttr.addAttribute("pageNum", cri.getPageNum());
				rttr.addAttribute("amount", cri.getAmount());
				rttr.addAttribute("type", cri.getType());
				rttr.addAttribute("keyword", cri.getKeyword());
				
				return "redirect:/auc/bid_list";
				
			}
			
			//입찰정보 현재 최고가 갱신
			@GetMapping("/bid_now")
			public void bidNowPrice() {
				
				log.info("SUCCESS BID CHANGE PRICE...");
				
				service.nowPrice();
				
			}
	
			
}
