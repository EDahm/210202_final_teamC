package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> getList();
	public List<StoreVO> getList2();
	
	public void insert(StoreVO store);
	
	public StoreVO read(String t_vstng_cmpny);
	
	public int delete(String t_vstng_cmpny);
	
	public int update(StoreVO Store);
	
	public List<StoreVO> getListWithPaging(Criteria cri);
	public List<StoreVO> getListWithPaging2(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	public int getTotalCount2(Criteria cri);
	

}
