package org.zerock.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class auctionMapperTests {

	@Setter(onMethod_ = @Autowired)
	private auctionMapper auMapper;
	
//	@Test
//	public void testGetList() {
//		auMapper.aucComList().forEach(auc -> log.info(auc));
//	}
	
	@Test
	public void testInsert() {
		
		aucBidVO auc = new aucBidVO();
			
		auc.setA_bno("A2021-02-18-180");
		auc.setM_num("M100002");
		auc.setB_bid_price(900); 
		auc.setB_bid_time("1");
		
		auMapper.bidInsert(auc);
		
		log.info(auc);
		
	}
	
//	@Test
//	public void testRead() {
//		
//		aucShipVO auc = auMapper.shipSelect("A2021-02-12-120");
//		
//		log.info(auc);
//		
//	}
//	
//	@Test
//	public void testDelete() throws Exception {
//		
//		log.info("DELETE COUNT : " + auMapper.bidDelete("M100001", 4000));
//		
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		auctionVO auc = new auctionVO();
//		
//		auc.setA_bno("A2021-02-10");
//		auc.setA_versifier(500);
//		auc.setA_wnng_prc(19000);
//		auc.setA_prgrs_prd(new Date());
//		
//		int a = auMapper.aucUpdate(auc);
//		
//		log.info("success : " + a);
//	}
//	
//	@Test
//	public void testNow() {
//		
//		String test = auMapper.bidNowMember();
//		
//		log.info("닉네임 : " + test);
//	}
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		
//		List<aucShipVO> auc = auMapper.shipListWithPaging(cri);
//		
//		auc.forEach(aucc -> log.info(aucc.getA_bno()));
//		
//	}
	
}
