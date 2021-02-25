package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.AucAttachVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.aucApplyVO;
import org.zerock.domain.aucBidVO;
import org.zerock.domain.aucComVO;
import org.zerock.domain.aucShipVO;
import org.zerock.domain.auctionVO;

public interface auctionMapper {
	
	//경매 신청 m
	public void aucApplyIns(aucApplyVO aucapplyvo);
	public void aucApplyInsKey(aucApplyVO aucapplyvo);
	
	//경매 신청 조회 m
	public aucApplyVO aucApplySelect(String aa_bno);
	
	//경매 신청 전체 조회 m
	public List<aucApplyVO> aucApplyList();
	
	public List<aucApplyVO> aucApplyListWithPaging(Criteria cri);
	
	//경매 신청 삭제 m
	public int aucApplyDel(String aa_bno);
	
	//경매 신청 수정 m
	public int aucApplyUpdate(aucApplyVO aucapplyvo);
	
	
	
	
	//경매 진행 등록 m
	public void aucAdd(auctionVO auctionvo);
	
	//경매 진행 전체 조회 m
	public List<auctionVO> aucList();
	public List<auctionVO> aucListWithPaging(Criteria cri);
	
	//경매 진행 단일 조회 m
	public auctionVO aucSelect(String a_bno);
	
	//경매 진행 수정 m
	public int aucUpdate(auctionVO auctionvo);
	
	//경매 진행 상태 변경 m
	public int aucStaUpdate(String a_bno, String a_state);
	
	//경매 진행 정보 삭제 m
	public int aucDelete(String a_bno);
	
	//진행중인 경매 정보만 출력
	public auctionVO aucIng();
	
	//진행중인 경매 정보 조회
	public auctionVO aucIngSel(String a_bno);
	public aucApplyVO aucNowItem();
	
	
	
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
	public List<aucShipVO> shipListWithPaging(Criteria cri);
	
	//배송정보 삭제 m 
	public int shipDelete(String a_bno);
	
	
	
	//입찰하기+포인트적립(2점씩) m
	public int bidInsert(aucBidVO aucbidvo);
	
	//입찰정보 조회
	public aucBidVO bidRead(Long b_bno);
	
	
	//입찰정보 삭제 m
	public int bidDelete(Long b_bno); 
	
	//입찰정보 전체 조회 m
	public List<aucBidVO> bidList();	
	public List<aucBidVO> bidListWithPaging(Criteria cri);	
	
	
	//경매 현재가 수정 m
	public int bidNowPrice();
	
	//경매 현재가를 입찰한 회원 닉네임 가져오기 m
	public String bidNowMember();
	public List<MemberVO> bidNcnm();
	
	
	
	//업체 등록
	public void aucComIns(aucComVO auccomvo);

	//업체 전체 조회
	public List<aucComVO> aucComList();
	public List<aucComVO> aucComListWithPaging(Criteria cri);
	
	//업체 단일 조회
	public aucComVO aucComGet(String c_num);
	
	//업체 수정
	public int aucComMod(aucComVO auccomvo);
	
	//업체 삭제
	public int aucComDel(String c_num);
	
	//데이터개수처리
	////신청 조회페이지
	public int getTotalCountApply(Criteria cri);
	////진행 조회페이지
	public int getTotalCountNow(Criteria cri);
	////배송 조회페이지
	public int getTotalCountShip(Criteria cri);
	////업체 조회페이지
	public int getTotalCountCom(Criteria cri);
	////입찰 조회페이지
	public int getTotalCountBid(Criteria cri);
	
	//입찰자 수 카운트
	public int getCountBid(Criteria cri);
}
