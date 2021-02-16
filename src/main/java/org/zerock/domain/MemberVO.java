package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String m_num;
	private Date m_regdate;
	private String m_email;
	private String m_password;
	private String m_name;
	private String m_ncnm;
	private String m_contact;
	private String m_type;
	private int m_point;
}
