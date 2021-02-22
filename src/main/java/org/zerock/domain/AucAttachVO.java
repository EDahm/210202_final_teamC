package org.zerock.domain;

import lombok.Data;

@Data
public class AucAttachVO {
	
	private String aa_uuid;
	private String aa_upload_path;
	private String aa_file_name;
	private boolean aa_file_type;
	
	private String aa_bno;

}
