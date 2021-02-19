package org.zerock.domain;



import lombok.Data;

@Data
public class aucApplyVO {

	private String aa_bno; //경매번호
	private String c_num; //업체번호
	
	private String aa_hope_prd; //희망기간
	private String aa_item_nm; //물품명
	private int aa_markt_prc; //시장가격
	private String aa_weight; //중량
	private String aa_cntry_orgn; //원산지
	
}
