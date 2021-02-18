package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	/* 이메일아이디 중복검사 테스트 */
//	@Test
//	public void memberIdChk() throws Exception{
//		
//		String id = "ddd@dddd.com";
//		String id2 = "test123";
//		
//		mapper.idCheck(id);
//		mapper.idCheck(id2);
//	}
	
	
	/* 닉네임 중복검사 테스트 */
	@Test
	public void memberNcnmChk() throws Exception{
		
		String id = "혜윤";
		String id2 = "덕구";
		
		mapper.ncnmCheck(id);
		mapper.ncnmCheck(id2);
	}
	

	
}
