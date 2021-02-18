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
//import org.us.service.auctionServiceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class AuctionControllerTests {


		@Setter(onMethod_ = {@Autowired})
		private WebApplicationContext ctx;
		
		private MockMvc mockMvc;
		
		@Before
		public void setup() {
			this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		}
		
//		@Test
//		public void testList() throws Exception{
//			log.info(
//					mockMvc.perform(MockMvcRequestBuilders.get("/auc/now"))
//					.andReturn()
//					.getModelAndView()
//					.getModelMap());
//			
//		}
		
//		@Test
//		public void testRegister() throws Exception{
//			
//			String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/auc/apply")
//					.param("aa_bno", "A1555")
//					.param("c_num", "C4564")
//					.param("m_num", "U5252")
//					.param("a_versifier", "500")
//					.param("a_crnt_prc", "1500")
//					.param("a_wnng_prc", "17000")
//					.param("a_state", "낙찰완료")
//					.param("a_prgrs_prd", "2021/05/01")
//					).andReturn().getModelAndView().getViewName();
//			
//			log.info(resultPage);
//		}
		
//		@Test
//		public void testGet() throws Exception {
//			
//			log.info(mockMvc.perform(MockMvcRequestBuilders
//					.get("/auc/get")
//					.param("aa_bno", "A12212"))
//					.andReturn()
//					.getModelAndView().getModelMap());
//					
//		}
		
//		@Test
//		public void testModify() throws Exception { //안되뮤ㅠ
//			
//			String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/auc/modify")
//					.param("aa_bno", "A12212")
//					.param("a_versifier", "800")
//					.param("a_wnng_prc", "18000")
//					.param("a_prgrs_prd", "2021/06/01"))
//					.andReturn().getModelAndView().getViewName();
//			
//			log.info(resultPage);
//					
//		}
		
//		@Test
//		public void testRemove() throws Exception{
//			String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/auc/remove")
//					.param("aa_bno","A12212"))
//					.andReturn().getModelAndView().getViewName();
//			
//			log.info(resultPage);
//		}
		
		@Test
		public void testListPaging() throws Exception {
			
			log.info(mockMvc.perform(MockMvcRequestBuilders.get("/auc/apply_list")
					.param("pageNum", "2")
					.param("amount","50"))
					.andReturn().getModelAndView().getModelMap());
		}
		
	}

