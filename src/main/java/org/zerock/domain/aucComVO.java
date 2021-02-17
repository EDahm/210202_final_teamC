package org.zerock.domain;

import lombok.Data;

@Data
public class aucComVO {
	
	private String c_num; //업체번호
	private String c_name; //업체명
	private String c_email; //업체이메일
	private String c_address; //업체주소
	private String c_contact; //연락처
	private String c_sector; //업종
}
