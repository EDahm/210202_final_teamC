package org.zerock.domain;

import lombok.Data;

@Data
public class aucShipVO {
	
	private String a_bno; //경매번호
	private String c_num; //업체번호
	private String m_num; //회원번호
	
	private String s_shpng_addr; //배송주소
	private String s_shpng_cntct; //배송연락처
	private String s_shpng_stts; //배송현황

}
