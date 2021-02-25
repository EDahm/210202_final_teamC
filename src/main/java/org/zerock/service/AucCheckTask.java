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

//	@Setter(onMethod_ = @Autowired)
//	private auctionMapper aucMapper;
		
	
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
//	@Scheduled(cron="0 0 0 31 12 7")
//	public void checkBidPrice() throws Exception{
//		
//		log.warn("UPDATE BID NOW PRICE...");
//		
//		aucMapper.bidNowPrice();
//		
//	}
}
