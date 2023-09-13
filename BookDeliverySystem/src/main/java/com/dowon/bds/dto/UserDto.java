package com.dowon.bds.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
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
	
	public UserDto(String user_email, String user_name, String user_phone,String user_gender, String user_birth) {
		super();
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_gender = user_gender;
		this.user_birth = user_birth;
	}
	
	
	
	
	
}
