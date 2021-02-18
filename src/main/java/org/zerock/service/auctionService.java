package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucComVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;

public interface auctionService {
	
	//진행페이지
	
	//경매진행 등록
	public void nowRegi(auctionVO auctionvo);
	
	//경매진행 단일조회
	public auctionVO nowGet(String a_bno);
	
	//경매진행 수정(현재가, 경매상태 제외)
	public boolean nowMod(auctionVO auctionvo);
	
	//경매진행 정보 삭제
	public boolean nowRemove(String a_bno);
	
	//경매진행 전체 조회
	public List<auctionVO> nowGetList(Criteria cri);
	
	//경매 현재가 닉네임 호출
	public String nowBestMember();
	
	//경매 현재가 수정
	public boolean nowPrice();
	
	//경매진행 상태 변경
	public boolean nowStateUp(String a_bno, String a_state);
	
	//진행중인 경매 정보만 출력
	public List<auctionVO> nowStateList();
	
	
	//신청페이지
	
	//경매신청 등록
	public void applyIns(aucApplyVO aucapplyvo);
	
	//경매신청 단일조회
	public aucApplyVO applyGet(String aa_bno);
	
	//경매신청 전체조회
	public List<aucApplyVO> applyGetList(Criteria cri);
	
	//경매신청 수정
	public boolean applyMod(aucApplyVO aucapplyvo);
	
	//경매신청 삭제
	public boolean applyRem(String aa_bno);
	
	
	//배송페이지
	
	//배송정보 등록
	public void shipIns(aucShipVO aucshipvo);
	
	//배송정보 단일조회
	public aucShipVO shipGet(String a_bno);
	
	//배송정보 전체조회
	public List<aucShipVO> shipGetList(Criteria cri);
	
	//배송정보 수정
	public boolean shipMod(aucShipVO aucshipvo);
	
	//배송정보 삭제
	public boolean shipRem(String a_bno);
	

	
	//입찰페이지
	
	//입찰하기+포인트적립
	public void bidInsPoint(aucBidVO aucbidvo);
	
	//입찰정보 삭제
	public boolean bidRemove(@Param("m_num") String m_num, @Param("b_bid_price") int b_bid_price) throws Exception;
	
	//입찰정보 전체 조회
	public List<aucBidVO> bidGetList();
	
	
	
	//업체페이지
	//업체정보 등록
	public void aucComIns(aucComVO auccomvo);
	
	//업체정보 단일 조회
	public aucComVO aucComGet(String c_num);
	
	//업체정보 전체조회
	public List<aucComVO> aucComList();
	
	//업체정보 수정
	public boolean aucComMod(aucComVO auccomvo);
	
	//업체정보 삭제
	public boolean aucComDel(String c_num);
	
	
	//데이터개수세기
	public int getTotalApply(Criteria cri);
	public int getTotalNow(Criteria cri);
	public int getTotalShip(Criteria cri);
	
}
