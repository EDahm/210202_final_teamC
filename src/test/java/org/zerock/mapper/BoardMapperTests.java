package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class}
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
//	@Test
//	public void testPaging() {
//		
//		Criteria cri = new Criteria();
//		//10개씩 3페이지
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testSearch() {
//		
//		Criteria cri = new Criteria();
//		cri.setKeyword("새로");
//		cri.setType("TC");
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board));
//	}
//	@Test
//	public void testGetList() {
//		
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setQ_title("새로 작성하는 글의 제목");
		board.setQ_content("새로 추가하는 내용");
		board.setQ_ncnm("충성");
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setQ_title("새로 작성하는 글의 제모오옥");
		board.setQ_content("새로 작성하는 내용");
		board.setQ_ncnm("충성");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		
		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);
		
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		// 실행전 존재하는 번호인지 확인할 것
		board.setQ_bno(5L);
		board.setQ_title("수정된 제목");
		board.setQ_content("수정된 내용");
		board.setQ_ncnm("충마아아안");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);
	}
}
