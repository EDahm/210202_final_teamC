package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.TkawyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TkawyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TkawyMapper mapper;
	
	
	
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	
	
//	@Test
//	public void testInsert() {
//		TkawyVO tkawy = new TkawyVO();
//		
//		tkawy.setM_num("M100004");
//		tkawy.setT_contact("010-1111-1111");
//		tkawy.setT_plastic(3);
//		tkawy.setT_plastic_cap(3);
//		tkawy.setT_vstng_cmpny("외않되");
//		tkawy.setT_date_vist("2021-02-15");
//		
//		mapper.insert(tkawy);
//		
//		log.info(tkawy);
//	}
	
	
	
//	@Test
//	public void testInsertSelectKey() {
//		
//		TkawyVO tkawy = new TkawyVO();
//		
//		tkawy.setM_num("M100004");
//		tkawy.setT_contact("010-1111-1111");
//		tkawy.setT_plastic(4);
//		tkawy.setT_plastic_cap(4);
//		tkawy.setT_vstng_cmpny("셀렉트키");
//		tkawy.setT_date_vist("2021-02-15");
//		
//		mapper.insertSelectKey(tkawy);
//		
//		log.info(tkawy);
//	}
	
	
	
//	@Test
//	public void testRead() {
//		
//		// 존재하는 게시물 번호로 테스트
//		TkawyVO tkawy = mapper.read("T2021-02-15-1253");
//		
//		log.info(tkawy);
//	}

	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("DELETE COUNT: " + mapper.delete("T2021-02-15-1253"));
//	}
	
	
	@Test
	public void testUpdate() {
		
		TkawyVO tkawy = new TkawyVO();
		
		tkawy.setT_bno("T2021-02-15-1252");
		tkawy.setM_num("M100004");
		tkawy.setT_plastic(4);
		tkawy.setT_plastic_cap(4);
		
		int count = mapper.update(tkawy);
		log.info("UPDATE COUNT: " + count);
	}
	
}
