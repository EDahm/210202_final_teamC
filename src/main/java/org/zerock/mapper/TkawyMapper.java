package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.TkawyVO;

public interface TkawyMapper {

	//@Select("select * from tbl_board where bno > 0")		//xml에서 sql문에 처리됐으니까 인터페이스 sql제거
	public List<TkawyVO> getList();
	
	public void insert(TkawyVO tkawy);
	
	public void insertSelectKey(TkawyVO tkawy);
	
	public TkawyVO read(String t_bno);
	
	public int delete(String t_bno);
	
	public int update(TkawyVO tkawy);
	
	public List<TkawyVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
}
