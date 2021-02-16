package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long qr_rno;
	private Long q_bno;
	
	private String qr_reply;
	private String qr_replyer;
	private Date qr_regDate;
	
	
}
