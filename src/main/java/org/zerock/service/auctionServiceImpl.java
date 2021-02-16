package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;
import org.zerock.mapper.auctionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class auctionServiceImpl implements auctionService {
	
	private auctionMapper aucMapper;
	
	@Override
	public void nowRegi(auctionVO auctionvo) {
	
		log.info("Register..... : " + auctionvo);
		
		aucMapper.aucAdd(auctionvo);
	}
	
	@Override
	public auctionVO nowGet(String a_bno) {
		
		log.info("get............" + a_bno);
		
		return aucMapper.aucSelect(a_bno);
	}
	
	@Override
	public boolean nowMod(auctionVO auctionvo) {

		log.info("modify......." + auctionvo);
		
		return aucMapper.aucUpdate(auctionvo) == 1;
	}
	
	@Override
	public boolean nowRemove(String a_bno) {

		log.info("remove......" + a_bno);
		
		return aucMapper.aucDelete(a_bno) == 1;
	}
	
	@Override
	public List<auctionVO> nowGetList() {

		log.info("getList.......");
		
		return aucMapper.aucList();
	}
	
	@Override
	public String nowBestMember() {

		log.info("UPDATE BEST PRICE MEMBER.....");
		
		return aucMapper.bidNowMember();
		
	}
	
	@Override
	public boolean nowPrice() {
		log.info("UPDATE BEST PRICE NOW....");
		
		return aucMapper.bidNowPrice() == 1;
	}
	
	@Override
	public boolean nowStateUp(String a_bno, String a_state) {

		log.info("Change Bid Status.....");
		
		return aucMapper.aucStaUpdate(a_bno, a_state) == 1;
	}
	
	@Override
	public void applyIns(aucApplyVO aucapplyvo) {

		log.info("APPLY INSERT........");
		
		aucMapper.aucApplyIns(aucapplyvo);
		
	}
	
	@Override
	public aucApplyVO applyGet(String aa_bno) {

		log.info("APPLY GET........");
		
		return aucMapper.aucApplySelect(aa_bno);
		
	}
	
	@Override
	public List<aucApplyVO> applyGetList() {

		log.info("APPLY GET LIST......");
		
		return aucMapper.aucApplyList();
		
	}
	
	@Override
	public boolean applyMod(aucApplyVO aucapplyvo) {

		log.info("APPLY MODIFY....");
		
		return aucMapper.aucApplyUpdate(aucapplyvo) == 1;
	}
	
	@Override
	public boolean applyRem(String aa_bno) {

		log.info("APPLY REMOVE.....");
		
		return aucMapper.aucApplyDel(aa_bno)==1;
	}
	
	@Override
	public void shipIns(aucShipVO aucshipvo) {
		
		log.info("SHIP INSERT......");
		
		aucMapper.shipInsert(aucshipvo);
	}
	
	@Override
	public aucShipVO shipGet(String a_bno) {

		log.info("SHIP GET..........");
		
		return aucMapper.shipSelect(a_bno);
	}
	
	@Override
	public List<aucShipVO> shipGetList() {

		log.info("SHIP GET LIST......");
		
		return aucMapper.shipList();
	}
	
	@Override
	public boolean shipMod(aucShipVO aucshipvo) {

		log.info("SHIP MODIFY........");
		
		return aucMapper.shipUpdate(aucshipvo) == 1;
	}
	
	@Override
	public boolean shipRem(String a_bno) {

		log.info("SHIP REMOVE........");
		
		return aucMapper.shipDelete(a_bno)==1;
	}
	
	@Override
	public void bidInsPoint(aucBidVO aucbidvo) {

		log.info("BID INSERT WITH POINT ...... ");
		
		aucMapper.bidInsert(aucbidvo);
		
		
	}
	
	@Override
	public boolean bidRemove(@Param("m_num") String m_num, @Param("b_bid_price") int b_bid_price) throws Exception {

		log.info("BID REMOVE......");
		
		return aucMapper.bidDelete(m_num, b_bid_price) == 1;
				
	}
	
	@Override
	public List<aucBidVO> bidGetList() {
		
		log.info("BID GET LIST........");
		
		return aucMapper.bidList();
	}

}
