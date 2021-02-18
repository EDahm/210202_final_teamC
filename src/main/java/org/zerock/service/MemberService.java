package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO member);
	
	public MemberVO get(String m_num);
	
	public boolean modify(MemberVO member);
	
	public boolean remove(String m_num);
	
	//public List<MemberVO> getList();
	
	public List<MemberVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public int idCheck(String email);
	
	public int ncnmCheck(String m_ncnm);
}
