package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;

public interface auctionMapper {
	
	//경매 신청 m
	public void aucApplyIns(aucApplyVO aucapplyvo);
	
	//경매 신청 조회 m
	public aucApplyVO aucApplySelect(String aa_bno);
	
	//경매 신청 전체 조회 m
	public List<aucApplyVO> aucApplyList();
	
	//경매 신청 삭제 m
	public int aucApplyDel(String aa_bno);
	
	//경매 신청 수정 m
	public int aucApplyUpdate(aucApplyVO aucapplyvo);
	
	//경매 진행 등록 m
	public void aucAdd(auctionVO auctionvo);
	
	//경매 진행 전체 조회 m
	public List<auctionVO> aucList();
	
	//경매 진행 단일 조회 m
	public auctionVO aucSelect(String aa_bno);
	
	//경매 진행 수정 m
	public int aucUpdate(auctionVO auctionvo);
	
	//경매 진행 상태 변경 m
	public int aucStaUpdate(String a_bno, String a_state);
	
	//경매 진행 정보 삭제 m
	public int aucDelete(String aa_bno);
	
	//배송정보 등록 m
	public void shipInsert(aucShipVO aucshipvo);
	
	//배송정보 수정 m
	public int shipUpdate(aucShipVO aucshipvo);
	
	//배송 상태 수정 m
	public int shipStaUpdate(aucShipVO aucshipvo);
	
	//배송정보 조회 m
	public aucShipVO shipSelect(String a_bno);
	
	//배송정보 전체 조회 m
	public List<aucShipVO> shipList();
	
	//배송정보 삭제 m 
	public int shipDelete(String a_bno);
	
	//입찰하기+포인트적립(2점씩) m
	public void bidInsert(aucBidVO aucbidvo);
	
	//입찰정보 삭제 m
	public int bidDelete(@Param("m_num") String m_num, @Param("b_bid_price") int b_bid_price) 
	throws Exception;
	
	//입찰정보 전체 조회 m
	public List<aucBidVO> bidList();	
	
	//경매 현재가 수정 m
	public int bidNowPrice();
	
	//경매 현재가를 입찰한 회원 닉네임 가져오기 m
	public String bidNowMember();
	

}
