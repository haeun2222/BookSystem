package com.dowon.bds.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 박하은
 * @since 2023.09.06 결제 Dto
 */

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PayDto {
// 추가
	private int pay_seq;
	private int pay_imd;
	private int user_seq;
	private int pay_payment;
	private Date pay_date;
	
}
