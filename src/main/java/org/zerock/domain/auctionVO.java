package org.zerock.domain;

import lombok.Data;

@Data
public class auctionVO {

	
	private String a_bno; //경매번호
	private String aa_bno; //신청번호
	
	private int a_versifier; //시작가
	private int a_crnt_prc; //현재가
	private int a_wnng_prc; //낙찰가(바로 구매가격)
	private String a_state; //경매상태
	private String a_prgrs_prd; //진행기간
}
