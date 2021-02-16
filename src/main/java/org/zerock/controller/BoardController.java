package org.zerock.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		
//		log.info("list");
//		
//		model.addAttribute("list",service.getList());
//	}
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		log.info("list: " + cri);
		
		model.addAttribute("list",service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("==========================");

		log.info("register: " + board);

//		if (board.getAttachList() != null) {
//
//			board.getAttachList().forEach(attach -> log.info(attach));
//
//		}

		log.info("==========================");

		service.register(board);

		rttr.addFlashAttribute("result", board.getQ_bno());

		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "modify"})
	public void get(@RequestParam("q_bno") Long q_bno, @ModelAttribute("cri")
	Criteria cri, Model model) {
		
		log.info("/get or modify");
		
		model.addAttribute("board", service.getHits(q_bno));
		model.addAttribute("board", service.get(q_bno));
	}
	
	// page 처리
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		
		log.info("modify: " + board);
			
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
			
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("q_bno") Long q_bno, Criteria cri, 
			RedirectAttributes rttr) {
		
		log.info("remove..." + q_bno);
		
//		List<BoardAttachVO> attachList = service.getAttachList(q_bno);
		
		if(service.remove(q_bno)) {
			
			// delete Attach Files
//			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list" + cri.getListLink();
		
	}
	
//	@GetMapping(value = "/getAttachList",
//			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//		@ResponseBody
//		public ResponseEntity<List<BoardAttachVO>> getAttachList(Long q_bno) {
//		
//		log.info("getAttachList " + q_bno);
//		
//		return new ResponseEntity<>(service.getAttachList(q_bno), HttpStatus.OK);
//	}
//	
//	private void deleteFiles(List<BoardAttachVO> attachList) {
//		
//		if(attachList == null || attachList.size() == 0) {
//			return;
//		}
//		
//		log.info("delete attach files....................");
//		log.info(attachList);
//		
//		attachList.forEach(attach -> {
//			try {
//				Path file = Paths.get("C:\\upload\\"+attach.getQa_upload_path()+ "\\" + attach.getQa_uuid() + "_" + attach.getQa_file_name());
//				
//				Files.deleteIfExists(file);
//				
//				if(Files.probeContentType(file).startsWith("image")) {
//					
//					Path thumbNail = Paths.get("C:\\upload\\"+attach.getQa_upload_path()+"\\s_" + attach.getQa_uuid() + "_" + attach.getQa_file_name());
//					
//					Files.delete(thumbNail);
//				}
//				
//			} catch(Exception e) {
//				log.error("delete file error" + e.getMessage());
//			} // end catch
//		}); // end foreachd
//	}
	

}














