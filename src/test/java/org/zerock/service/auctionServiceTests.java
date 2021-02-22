package org.zerock.service;

//import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
//import org.us.domain.aucBidVO;
import org.zerock.domain.auctionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class auctionServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private auctionService service;

//	@Test
//	public void testRegister() {
//		
//		auctionVO aucvo = new auctionVO();
//		aucvo.setAa_bno("A1111");
//		aucvo.setC_num("C1234");
//		aucvo.setM_num("U45678");
//		aucvo.setA_versifier(500);
//		aucvo.setA_crnt_prc(500);
//		aucvo.setA_wnng_prc(19000);
//		aucvo.setA_state("준비중");
//		aucvo.setA_prgrs_prd(new Date());
//		
//		service.register(aucvo);
//		
//		log.info("생성된 게시물 번호 : " + aucvo.getAa_bno());
//	}
	
	@Test
	public void testGetList() {
		
		service.shipGetList(new Criteria(2,10)).forEach(auction -> log.info(auction));
	}
//	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get("A1111"));
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		auctionVO aucvo = service.get("A1111");
//		
//		if (aucvo == null) {
//			return;
//		}
//		
//		aucvo.setA_wnng_prc(16000);
//		log.info("modify result: " + service.modify(aucvo));
//		
//		
//	}

//@Test
//public void testDelete() {
//	log.info("REMOVE RESULT: " + service.remove("A12212"));
//}
	
//	@Test
//	public void testMember() {
//		
//		String result = service.nowBestMember();
//		
//		log.info(result);
//	}
	
//	@Test 
//	public void testPrice() {
//		
//		log.info(service.nowPrice());
//		
//		
//	}
	
//	@Test 
//	public void testState() {
//		
//		log.info(service.nowStateUp("A2021-02-12-120", "진행완료"));
//	}
}
