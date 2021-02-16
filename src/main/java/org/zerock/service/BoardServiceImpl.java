package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	//spring 4.3 이상에서 자동 처리
	//private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

//	@Setter(onMethod_ = @Autowired)
//	private BoardAttachMapper attachMapper;

	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("register......" + board);

		mapper.insertSelectKey(board);

//		if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
//			return;
//		}
//
//		board.getAttachList().forEach(attach -> {
//
//			attach.setQ_bno(board.getQ_bno());
//			attachMapper.insert(attach);
//		});
	}

	@Override
	public BoardVO get(Long q_bno) {

		log.info("get........." + q_bno);
		
		return mapper.read(q_bno);
	}
	
	@Override
	public boolean getHits(Long q_bno) {
		
		return mapper.getHits(q_bno);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify....." + board);
		
//		attachMapper.deleteAll(board.getQ_bno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
//		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
//			
//			board.getAttachList().forEach(attach -> {
//				
//				attach.setQ_bno(board.getQ_bno());
//				attachMapper.insert(attach);
//				
//			});
//		}
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long q_bno) {
		log.info("remove....." + q_bno);
		
//		attachMapper.deleteAll(q_bno);
		
		return mapper.delete(q_bno) == 1;
		
	}

//	@Override
//	public List<BoardVO> getList() {
//
//		log.info("getList............");
//		
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {

		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotlaCount(cri);
	}
	
//	@Override
//	public List<BoardAttachVO> getAttachList(Long q_bno) {
//		
//		log.info("get Attach list by q_bno" + q_bno);
//		
//		return attachMapper.findByBno(q_bno);
//	}


}
