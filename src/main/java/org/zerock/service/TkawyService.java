package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.TkawyVO;

public interface TkawyService {

	public void register(TkawyVO tkawy);
	
	public TkawyVO get(String t_bno);
	
	public boolean modify(TkawyVO tkawy);
	
	public boolean remove(String t_bno);
	
	//public List<TkawyVO> getList();
	
	public List<TkawyVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	public boolean modifyCanceled(String t_bno);
}
