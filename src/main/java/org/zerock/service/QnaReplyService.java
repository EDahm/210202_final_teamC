package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.domain.ReplyPageDTO;

public interface QnaReplyService {

	public int register(QnaReplyVO vo);
	
	public QnaReplyVO get(Long bno);
	
	public int modify(QnaReplyVO vo);
	
	public int remove(Long bno);
	
	public List<QnaReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
}
