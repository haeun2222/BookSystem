package com.dowon.bds.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 박하은
 * @since 2023.09.06 FAQ 게시판 Dto
 */

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class FaqBoardDto {

	private int faq_seq;
	private String faq_category;
	private String faq_title;
	private String faq_content;
	private String faq_delflag;

}
