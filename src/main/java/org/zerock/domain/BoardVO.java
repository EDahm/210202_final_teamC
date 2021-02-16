package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long q_bno;
	private String q_title;
	private String q_ncnm;
	private String q_content;
	private Date q_regdate;
	
	private Long q_hits;
	private int q_replyCnt;
	
//	private List<BoardAttachVO> attachList;
}
