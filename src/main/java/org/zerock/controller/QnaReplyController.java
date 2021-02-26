package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.service.QnaReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class QnaReplyController {

	private QnaReplyService service;

	@PostMapping(value = "/new", consumes = "application/json",	produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody QnaReplyVO vo) {

		log.info("QnaReplyVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1
				? new ResponseEntity<>("succes", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/pages/{q_bno}/{page}",
			produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("q_bno") Long q_bno) {
		
		Criteria cri = new Criteria(page, 10);
		
		log.info("get Reply List bno: " + q_bno);
		
		log.info("cri" + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, q_bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{qr_rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QnaReplyVO> get(@PathVariable("qr_rno") Long qr_rno) {

		log.info("get: " + qr_rno);

		return new ResponseEntity<>(service.get(qr_rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value= "/{qr_rno}",produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("qr_rno") Long qr_rno) {
		
		log.info("remove" + qr_rno);
		
		return service.remove(qr_rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{qr_rno}",
			consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody QnaReplyVO vo,
			@PathVariable("qr_rno") Long qr_rno) {

		log.info("rno: " + qr_rno);
		
		log.info("modify: " + vo);

		return service.modify(vo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}




