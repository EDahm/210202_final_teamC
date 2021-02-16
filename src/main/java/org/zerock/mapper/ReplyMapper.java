package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long q_bno);
	
	public int delete(Long q_bno);
	
	public int update(ReplyVO qr_reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("q_bno") Long q_bno);
	
	public int getCountByBno(Long q_bno);
}
