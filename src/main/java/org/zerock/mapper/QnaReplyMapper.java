package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;


public interface QnaReplyMapper {

	public List<QnaReplyVO> getList();
	
	public int insert(QnaReplyVO vo);
		
	public QnaReplyVO read(Long q_bno);
	
	public int delete(Long q_bno);
	
	public int update(QnaReplyVO qr_reply);
	
	public List<QnaReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("q_bno") Long q_bno);
	
	public int getCountByBno(Long q_bno);
}
