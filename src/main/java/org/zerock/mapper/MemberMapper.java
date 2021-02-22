package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public List<MemberVO> getList();
	
	public void insert(MemberVO member);
	
	public void insertSelectKey(MemberVO member);
	
	public MemberVO read(String m_num);
	
	public int delete(String m_num);

	public int withdraw(String m_num);
	
	public int update(MemberVO member);
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public int idCheck(String email);
	
	public int ncnmCheck(String m_ncnm);
	
	
}
