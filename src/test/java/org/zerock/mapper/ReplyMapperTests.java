package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
//@ContextConfiguration(classes = {org.zerock.config.RootConfig.class}
@Log4j
public class ReplyMapperTests {
	
	// 테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private Long[] q_bnoArr = { 1L, 2L, 5L, 10L, 13L };
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testList2() {

		Criteria cri = new Criteria(2, 10);

		// 3145745L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 6805L);

		replies.forEach(reply -> log.info(reply));

	}
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> { ReplyVO vo = new ReplyVO();
		
		// 게시물의 번호
		vo.setQ_bno(q_bnoArr[i % 5]);
		vo.setQr_reply("댓글 테스트 " + i);
		vo.setQr_replyer("replyer" + i);
		
		mapper.insert(vo);
		
		});
	}
	
	@Test
	public void testRead() {
		Long targetqr_Rno = 5L;
		
		ReplyVO vo = mapper.read(targetqr_Rno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		
		Long targetqr_Rno = 1L;
		
		mapper.delete(targetqr_Rno);
	}
	
	@Test
	public void testUpdate() {
		
		Long targetqr_Rno = 10L;
		
		ReplyVO vo = mapper.read(targetqr_Rno);
		
		vo.setQr_reply("Update Reply ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		// 303L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, q_bnoArr[0]);
		
		replies.forEach(qr_reply -> log.info(qr_reply));
		
	}
}
