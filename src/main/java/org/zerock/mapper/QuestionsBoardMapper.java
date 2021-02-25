package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.QuestionsBoardVO;

public interface QuestionsBoardMapper {

	public List<QuestionsBoardVO> getList();
	
	public List<QuestionsBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(QuestionsBoardVO board);
	
	public void insertSelectKey(QuestionsBoardVO board);
			
	public int delete(Long q_bno);
	
	public int update(QuestionsBoardVO board);
	
	public void updateReplyCnt(@Param("q_bno") Long q_bno, @Param("amount") int amount);
	
	public boolean getHits(Long q_bno);
	
	public QuestionsBoardVO read(Long q_bno);
}
