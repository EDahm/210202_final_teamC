package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.StoreVO;
import org.zerock.mapper.StoreMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreServiceImpl implements StoreService{

	//spring 4.3 이상에서 자동 처리
	private StoreMapper mapper;
	

	@Override
	public void register(StoreVO store) {

		log.info("register......" + store);
		
		mapper.insert(store);
		
	}

	@Override
	public StoreVO get(String t_vstng_cmpny) {

		log.info("get......" + t_vstng_cmpny);
		
		return mapper.read(t_vstng_cmpny);
	}

	@Override
	public boolean modify(StoreVO store) {

		log.info("modify......" + store);
		
		return mapper.update(store) == 1;
	}

	@Override
	public boolean remove(String t_vstng_cmpny) {

		log.info("remove...." + t_vstng_cmpny);
		
		return mapper.delete(t_vstng_cmpny) == 1;
	}

	@Override
	public List<StoreVO> getList(Criteria cri) {
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<StoreVO> getList2(Criteria cri) {
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging2(cri);
	}

	@Override
	public int getTotal2(Criteria cri) {

		log.info("get total count");
		
		return mapper.getTotalCount2(cri);
	}



}
