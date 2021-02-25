package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.domain.ReplyPageDTO;

public interface QnaReplyService {

	public int register(QnaReplyVO vo);
	
	public QnaReplyVO get(Long qr_rno); // q_bno였음 확인
	
	public int modify(QnaReplyVO vo);
	
	public int remove(Long qr_rno); // q_bno였음 확인
	
	public List<QnaReplyVO> getList(Criteria cri, Long q_bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long q_bno);
}
