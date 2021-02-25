package org.zerock.domain;

import lombok.Data;

@Data
public class aucBidVO {

	private Long b_bno; //입찰번호
	private String a_bno; //경매번호
	private String m_num; //회원번호

	private int b_bid_price; //입찰가격
	private String b_bid_time; //입찰시간
	private String b_bid_state; //입찰상태
	
}
