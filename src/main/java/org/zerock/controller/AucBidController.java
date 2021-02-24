package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.aucBidVO;
import org.zerock.service.auctionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/bid/")
@RestController
@Log4j
@AllArgsConstructor
public class AucBidController {

	private auctionService service;
	
	//입찰정보 등록+적립
	@PostMapping(value = "/bid_regi", consumes = "application/json",
				produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> aucBidRegi(@RequestBody aucBidVO aucbidvo) {
		
		log.info("register: " + aucbidvo);
		
		int bidRegiCount = service.bidInsPoint(aucbidvo);
		
		log.info("Bid Insert Count: " + bidRegiCount);
		
		return bidRegiCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
	//입찰정보 삭제
	@DeleteMapping(value= "/{b_bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> bidRemove(@PathVariable("b_bno") Long b_bno){
			
		
		log.info("remove..." + b_bno);
		
		return service.bidRemove(b_bno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//입찰정보 조회
	@GetMapping(value = "/{b_bno}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<aucBidVO> bidGet(@PathVariable("b_bno") Long b_bno){
		
		log.info("get : " + b_bno);
		
		return new ResponseEntity<>(service.bidGet(b_bno),HttpStatus.OK);
	}
	
	@GetMapping(value="/pages/{a_bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<aucBidVO>> bidList(@PathVariable("page") int page, @PathVariable("a_bno") String a_bno){
		log.info("getList..............");

		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		
		return new ResponseEntity<>(service.bidGetList(cri), HttpStatus.OK);
		
	}
	
}
