package org.zerock.service;

import static org.junit.Assert.assertNotNull;

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
public class TkawyServiceTests {

	@Setter(onMethod_ = {@Autowired })
	private TkawyService service;
	
//	@Test
//	public void testExist() {
//		
//		log.info(service);
//		assertNotNull(service);
//	}
	
	
//	@Test
//	public void testRegister() {
//		
//		TkawyVO tkawy = new TkawyVO();
//		
//		tkawy.setM_num("M100005");
//		tkawy.setT_contact("010-5555-5555");
//		tkawy.setT_plastic(5);
//		tkawy.setT_plastic_cap(5);
//		tkawy.setT_vstng_cmpny("뻐킹");
//		tkawy.setT_date_vist("2021-02-15");
//		
//		service.register(tkawy);
//		
//		log.info("생성된 게시물의 번호: " + tkawy.getT_bno());
//	}
	
	
//	@Test
//	public void testGetList() {
//		
//		service.getList().forEach(board -> log.info(board));
//	}
	
	
//	@Test
//	public void testGet() {
//		
//		log.info(service.get("T2021-02-15-1249"));
//	}
	
	
	
//	@Test
//	public void testDelete() {
//		
//		//게시물 번호의 존재 여부를 확인하고 테스트할 것
//		log.info("REMOVE RESULT: " + service.remove("T2021-02-15-1249"));
//		
//	}
	
	
	@Test
	public void testUpdate() {
		
		TkawyVO tkawy = service.get("T2021-02-15-1242");
		
		if(tkawy == null) {
			return;
		}
		
		tkawy.setT_bno("T2021-02-15-1242");
		tkawy.setM_num("M100001");
		tkawy.setT_plastic(2);
		tkawy.setT_plastic_cap(2);
		
		log.info("MODIFY RESULT: " + service.modify(tkawy));
	}
	
}
