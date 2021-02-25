package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.QuestionsBoardVO;

public interface QuestionsBoardService {

	public void register(QuestionsBoardVO board);
	
	public QuestionsBoardVO get(Long q_bno);
	
	public boolean modify(QuestionsBoardVO board);
	
	public boolean remove(Long q_bno);
	
	public List<QuestionsBoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public boolean getHits(Long q_bno);
}
