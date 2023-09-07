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
 * @since 2023.09.06 회원 Dto
 */

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {

	private int user_seq;
	private String user_password;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_birth;
	private String user_auth;
	private String user_delflag;
	private Date joindate;
	private String user_gender;
	
}
