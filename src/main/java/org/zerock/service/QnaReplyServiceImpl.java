package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.mapper.QnaReplyMapper;
import org.zerock.mapper.QuestionsBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaReplyServiceImpl implements QnaReplyService{

	//spring 4.3 이상에서 자동 처리
	@Setter(onMethod_ = @Autowired)
	private QnaReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionsBoardMapper boardMapper;
	
	@Override
	public int register(QnaReplyVO vo) {
	
		log.info("register......" + vo);
		
		boardMapper.updateReplyCnt(vo.getQ_bno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public QnaReplyVO get(Long qr_rno) {

		log.info("get......" + qr_rno);
		
		return mapper.read(qr_rno);
	}

	@Override
	public int modify(QnaReplyVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long qr_rno) {

		log.info("remove...." + qr_rno);
		
		QnaReplyVO vo = mapper.read(qr_rno);
		
		boardMapper.updateReplyCnt(vo.getQ_bno(), -1);
		return mapper.delete(qr_rno);
	}

	@Override
	public List<QnaReplyVO> getList(Criteria cri, Long q_bno) {

		log.info("get Reply List of a Board " + q_bno);
		
		return mapper.getListWithPaging(cri, q_bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long q_bno) {
		
		return new ReplyPageDTO(
			mapper.getCountByBno(q_bno),
			mapper.getListWithPaging(cri, q_bno));
	}
}
