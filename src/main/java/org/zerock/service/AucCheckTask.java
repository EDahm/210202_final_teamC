package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.zerock.mapper.auctionMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class AucCheckTask {

	@Setter(onMethod_ = @Autowired)
	private auctionMapper aucMapper;
		
	
<<<<<<< HEAD
//<<<<<<< HEAD
//=======
=======
<<<<<<< HEAD
=======
>>>>>>> branch 'develop' of https://github.com/EDahm/210202_final_teamC.git
	/*
	 * @Scheduled(cron="0 0 0 31 12 7") public void checkBidPrice() throws
	 * Exception{
	 * 
	 * log.warn("UPDATE BID NOW PRICE...");
	 * 
	 * aucMapper.bidNowPrice();
	 * 
	 * }
	 */
<<<<<<< HEAD
//>>>>>>> branch 'develop' of https://github.com/EDahm/210202_final_teamC.git
=======
>>>>>>> branch 'develop' of https://github.com/EDahm/210202_final_teamC.git
>>>>>>> branch 'develop' of https://github.com/EDahm/210202_final_teamC.git
//	@Scheduled(cron="0 0 0 31 12 7")
//	public void checkBidPrice() throws Exception{
//		
//		log.warn("UPDATE BID NOW PRICE...");
//		
//		aucMapper.bidNowPrice();
//		
//	}
}
