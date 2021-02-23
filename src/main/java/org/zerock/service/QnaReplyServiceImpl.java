package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.QnaReplyVO;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.mapper.QnaReplyMapper;

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
	
	@Override
	public int register(QnaReplyVO vo) {
	
		log.info("register......" + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public QnaReplyVO get(Long ano) {

		log.info("get......" + ano);
		
		return mapper.read(ano);
	}

	@Override
	public int modify(QnaReplyVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long ano) {

		log.info("remove...." + ano);
		
		return mapper.delete(ano);
	}

	@Override
	public List<QnaReplyVO> getList(Criteria cri, Long bno) {

		log.info("get Reply List of a Board " + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(
			mapper.getCountByBno(bno),
			mapper.getListWithPaging(cri, bno));
	}
}
