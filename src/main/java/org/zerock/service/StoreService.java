package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.StoreVO;

public interface StoreService {

	public void register(StoreVO store);
	
	public StoreVO get(String t_vstng_cmpny);
	
	public boolean modify(StoreVO store);
	
	public boolean remove(String t_vstng_cmpny);
	
	//public List<StoreVO> getList();
	
	public List<StoreVO> getList(Criteria cri);
	public List<StoreVO> getList2(Criteria cri);
	
	public int getTotal(Criteria cri);
	public int getTotal2(Criteria cri);

}
