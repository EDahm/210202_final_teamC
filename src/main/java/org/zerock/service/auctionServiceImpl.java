package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AucAttachVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucComVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionDTO;
import org.zerock.domain.auctionVO;
import org.zerock.mapper.AucAttachMapper;
import org.zerock.mapper.auctionMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
//@AllArgsConstructor
public class auctionServiceImpl implements auctionService {
	
	@Setter(onMethod_ = @Autowired)
	private auctionMapper aucMapper;
	
	@Setter(onMethod_ = @Autowired)
	private AucAttachMapper attachMapper;
	
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
	public List<auctionVO> nowGetList(Criteria cri) {

		log.info("getList.......");
		
		return aucMapper.aucListWithPaging(cri);
	}
	
	@Override
	public String nowBestMember() {

		log.info("UPDATE BEST PRICE MEMBER.....");
		
		return aucMapper.bidNowMember();
		
	}
	
	@Override
	public String nowBidMember(String m_num) {

		log.info("Get Bid Member Now....");
		
		return aucMapper.bidNcnm(m_num);
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
	public aucApplyVO nowItemGet() {
		log.info("apply infomation get....");
		
		return aucMapper.aucNowItem();
	}
	
	
	@Transactional
	@Override
	public void applyIns(aucApplyVO aucapplyvo) {

		log.info("APPLY INSERT........");
		
		aucMapper.aucApplyInsKey(aucapplyvo);
		
		if(aucapplyvo.getAttachList() == null || aucapplyvo.getAttachList().size() <= 0) {
			return;
		}
		
		aucapplyvo.getAttachList().forEach(attach -> {
			attach.setAa_bno(aucapplyvo.getAa_bno());
			attachMapper.insert(attach);
			
		});
		
	}
	
	@Override
	public aucApplyVO applyGet(String aa_bno) {

		log.info("APPLY GET........");
		
		return aucMapper.aucApplySelect(aa_bno);
		
	}
	
	@Override
	public List<aucApplyVO> applyGetList(Criteria cri) {

		log.info("APPLY GET LIST......" + cri);
		
		return aucMapper.aucApplyListWithPaging(cri);
		
	}
	
	@Transactional
	@Override
	public boolean applyMod(aucApplyVO aucapplyvo) {

		log.info("APPLY MODIFY....");
		
		attachMapper.deleteAll(aucapplyvo.getAa_bno());
		
		boolean modifyResult = aucMapper.aucApplyUpdate(aucapplyvo) == 1;
		
		if(modifyResult && aucapplyvo.getAttachList() != null && aucapplyvo.getAttachList().size() > 0) {
			aucapplyvo.getAttachList().forEach(attach -> {
				attach.setAa_bno(aucapplyvo.getAa_bno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Override
	public boolean applyRem(String aa_bno) {

		log.info("APPLY REMOVE.....");
		
		attachMapper.deleteAll(aa_bno);
		
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
	public List<aucShipVO> shipGetList(Criteria cri) {

		log.info("SHIP GET LIST......");
		
		return aucMapper.shipListWithPaging(cri);
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
	public int bidInsPoint(aucBidVO aucbidvo) {

		log.info("BID INSERT WITH POINT ...... ");
		
		return aucMapper.bidInsert(aucbidvo);
		
		
	}
	
	@Override
	public aucBidVO bidGet(Long b_bno) {
		
		log.info("Bid Get");
		
		return aucMapper.bidRead(b_bno);
	}
	
	@Override
	public int bidRemove(Long b_bno) {

		log.info("BID REMOVE......");
		
		return aucMapper.bidDelete(b_bno);
				
	}
	
	@Override
	public List<aucBidVO> bidGetList(Criteria cri) {
		
		log.info("BID GET LIST........");
		
		return aucMapper.bidListWithPaging(cri);
	}
	
	@Override
	public void aucComIns(aucComVO auccomvo) {

		log.info("AUCTION COMPANY INSERT..");
		
		aucMapper.aucComIns(auccomvo);
	}
	
	@Override
	public List<aucComVO> aucComList(Criteria cri) {
		
		log.info("AUCTION COMPANY LIST...");
		
		return aucMapper.aucComListWithPaging(cri);
	}
	
	@Override
	public aucComVO aucComGet(String c_num) {
		
		log.info("AUCTION COMPANY GET....");
		
		return aucMapper.aucComGet(c_num);
	}
	
	@Override
	public boolean aucComMod(aucComVO auccomvo) {

		log.info("AUCTION COMPANY MODIFY...");
		
		return aucMapper.aucComMod(auccomvo)==1;
	}

	@Override
	public boolean aucComDel(String c_num) {

		log.info("AUCTION COMPANY REMOVE....");
		
		return aucMapper.aucComDel(c_num)== 1 ;
	}
	
	@Override
	public int getTotalApply(Criteria cri) {
		log.info("get total count apply");
		return aucMapper.getTotalCountApply(cri);
	}
	
	@Override
	public auctionVO nowStateList() {
		log.info("AUCTION NOW ING GET....");
		
		return aucMapper.aucIng();
	}
	
	@Override
	public int getTotalNow(Criteria cri) {
		log.info("get total count now....");
		return aucMapper.getTotalCountNow(cri);
	}
	
	@Override
	public int getTotalShip(Criteria cri) {
		log.info("get total count");
		return aucMapper.getTotalCountShip(cri);
	}
	@Override
	public int getTotalCom(Criteria cri) {
		log.info("get total count");
		return aucMapper.getTotalCountCom(cri);	
	}
	
	@Override
	public int getTotalBid(Criteria cri) {
		 log.info("get total count");
		return aucMapper.getTotalCountBid(cri);
	}
	
	@Override
	public int getCountBid(Criteria cri) {
		log.info("GET COUNT BID.....");
		
		return aucMapper.getCountBid(cri);
	}
	
	@Override
	public List<AucAttachVO> getAttachList(String aa_bno) {
		
		log.info("get Attach list by aa_bno" + aa_bno);
		
		return attachMapper.findByAa_bno(aa_bno);
	}
	
	@Override
	public auctionDTO getListPageNow(Criteria cri, String a_bno) {

		return new auctionDTO(
				aucMapper.getCountByAbno(a_bno),
				aucMapper.getBidListPaging(cri, a_bno));
	}
	
	@Override
	public List<aucBidVO> myAucList(Criteria cri) {

		log.info("get List for my AUCTION");
		
		return aucMapper.myAucListWithPaging(cri);
	}
}
