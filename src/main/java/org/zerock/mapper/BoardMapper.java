package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {
	
//	@Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public int delete(Long q_bno);
	
	public int update(BoardVO board);
	
	public int getTotlaCount(Criteria cri);
	
	public void updateReplyCnt(@Param("q_bno") Long q_bno, @Param("amount") int amount);
	
	public boolean getHits(Long q_bno); // 조회수
	
	public BoardVO read(Long q_bno);
}
