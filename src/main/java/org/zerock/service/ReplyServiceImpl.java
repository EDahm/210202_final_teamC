package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {

		log.info("register......" + vo);

		boardMapper.updateReplyCnt(vo.getQ_bno(), 1);

		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long qr_rno) {

		log.info("get......" + qr_rno);
		
		return mapper.read(qr_rno);
	}

	@Override
	public int modify(ReplyVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long qr_rno) {

		log.info("remove...." + qr_rno);

		ReplyVO vo = mapper.read(qr_rno);

		boardMapper.updateReplyCnt(vo.getQ_bno(), -1);
		return mapper.delete(qr_rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long q_bno) {

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
