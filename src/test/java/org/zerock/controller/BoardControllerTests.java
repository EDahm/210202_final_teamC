package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)

//Test for Controller
@WebAppConfiguration

@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
// Java Config
// @ContextConfiguration(classes = {
// 			org.zerock.config.RootConfig.class,
//		  org.zerock.config.ServletConfig.class} )
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;

	private MockMvc mockMvc;


	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test
	public void testList() throws Exception {

		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	@Test
	public void testListPaging() throws Exception {

		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/board/list")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}

	@Test
	public void testRegister() throws Exception {

		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("q_title", "테스트 새글 제목")
				.param("q_content", "테스트 새글 내용")
				.param("q_ncnm", "추웅서엉")
			).andReturn().getModelAndView().getViewName();

		log.info(resultPage);

	}
	
	@Test
	public void testGet() throws Exception {

		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/board/get")
				.param("q_bno", "1"))
				.andReturn()
				.getModelAndView().getModelMap());

	}
//	
//	@Test
//	public void testModify() throws Exception {
//		
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/board/modify")
//						.param("q_bno", "1")
//						.param("q_title", "수정된 테스트 새글 제목")
//						.param("q_content", "수정된 테스트 새글 내용")
//						.param("q_ncnm", "충성"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//					   
//	}
//	
//	@Test
//	public void testRemove() throws Exception {
//		//삭제전 데이터베이스에 게시물 번호 확인할 것
//		String reusltPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
//				.param("q_bno", "24")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(reusltPage);
//	}
}
