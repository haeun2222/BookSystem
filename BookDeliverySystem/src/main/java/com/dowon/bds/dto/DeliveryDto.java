package com.dowon.bds.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 박하은
 * @since 2023.09.06 배송정보 Dto
 */

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryDto {

	private int delivery_seq;
	private int rent_seq;
	private String delivery_address;
	private String delivery_phone;
	private int delivery_num;
	
}
