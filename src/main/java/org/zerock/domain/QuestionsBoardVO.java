package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionsBoardVO {

	private Long q_bno;
	private String q_title;
	private String q_content;
	private String q_ncnm;
	private Date q_regdate;
	
	private Long q_hits;
	private int q_replyCnt;
	
}
