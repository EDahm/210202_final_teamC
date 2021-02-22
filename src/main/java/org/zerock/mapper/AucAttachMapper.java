package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AucAttachVO;

public interface AucAttachMapper {
		
		public void insert(AucAttachVO vo);
		
		public void delete(String aa_uuid);
		
		public List<AucAttachVO> findByAa_bno(String aa_bno);
		
}
