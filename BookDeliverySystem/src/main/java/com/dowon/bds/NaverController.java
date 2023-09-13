package com.dowon.bds;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dowon.bds.dto.URLDto;
import com.dowon.bds.dto.UserDto;
import com.dowon.bds.model.service.ISocialService;

/**
 * 
 * @author 김영진
 * @since 2023.09.12 네이버 로그인 컨트롤러
 */

@Controller
public class NaverController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private UserDto dto;
	private URLDto uDto = new URLDto();

	@Autowired
	private ISocialService service;
	
	// Response 받은 값을 JSON으로 바꾸기 위함
	private ObjectMapper objmapper = new ObjectMapper();
	
	@RequestMapping(value="/naverLogin.do")
	public String naverCallBack(String code, String state, HttpSession session) {
	
		logger.info("naverLogin.do 실행");
		String tokenUrl = uDto.getNaverTokenUrl(code, state);
		try {
			// 위에 설정 한 url에 대한 값을 url로 new 해준다
			URL url = new URL(tokenUrl);
			// 설정한 URL을 연결 시켜준다
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			// 설정 한 url을 GET방식으로 실행시킨다.
			con.setRequestMethod("GET");

			// 실행된 responsecode를 가져온다
			int responseCode = con.getResponseCode();
			logger.info("응답 받은 코드 : {}",responseCode);
			
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				// 응답 데이터를 읽어와 BufferdReader에 담아준다
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				// 응답 데이터를 읽어와 BufferdReader에 담아준다
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuilder res = new StringBuilder();
			//버퍼 리더에 담긴 값을 한줄 씩 읽어 스트링 빌더에 append 하여 긴 문자열로 만들어 줌
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			 br.close();
			 //응답 코드가 200일 때 
			 if (responseCode == 200) {
				 //String builder에 담긴 값을 JSON형태로 파싱 해준다.
		    	 JsonNode jnode = objmapper.readTree(res.toString());
		    	 //JSON형태로 받아온 값 중에서 accessToken을 추출한다
		    	 String accToken = jnode.get("access_token").asText();
		    	 String refreshToken = jnode.get("refresh_token").asText();
		    	 //추출한 AccessToken을 이용해 로그인 정보를 가져온다.
		    	 JsonNode info = getInfo(accToken);
		    	 if(info!=null) {
		    		 logger.info("전발 받은 회원 정보 :{} ",info);
		    		 //값을 추출하기
		    		 String user_email = info.path("response").path("email").asText();
		    		 String user_name = info.path("response").path("name").asText();
		    		 String user_phone = info.path("response").path("mobile").asText();
		    		 String user_gender = info.path("response").path("gender").asText();
		    		 String user_birth = info.path("response").path("birthyear").asText()+"-"
		    				 		+info.path("response").path("birthday").asText();
		    		 
		    		 logger.info("추출한 값 : Email : {} / name : {}  / mobile : {} / gender {} / birth {}",user_email,user_name,user_phone,user_gender,user_birth);
		    		 // dto에 집어넣기 여기서 다 담아 줘야 함
		    		 dto = new UserDto(user_email, user_name, user_phone, user_gender, user_birth);
		    		 // email로 해당 email이 존재하는지 확인하기
		    		 
		    		 int n = service.checkEmail(dto); 
		    		 //여기를 response/id 값을 담아 와서 DB에 해당 값이 있는지 비교.
		    		 //있으면  로그인 성공 및 세션에 정보 담아주기
		    		 
		    		 //없으면 회원가입 페이지로 이동
		    		 
		    		 
		    		 
		    		 System.out.println("int n의 값은 ?"+n);
		    		 if(n!=0) {
		    			 session.setAttribute("info", dto);
		    			 return "afterLogin";
		    		 }else {
		    			
		    			return "redirect:/socialRegistForm.do";
		    		 }
		    	 }
		      }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	
	public JsonNode getInfo(String accessToken) {
		logger.info("WelCome NaverController >> getInfo");
		try {
			URL url = new URL(uDto.getNaverInfo());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
            int responseCode = conn.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // API 응답 읽기
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = br.readLine()) != null) {
                    response.append(inputLine);
                }
                br.close();
                // JSON 응답 파싱
                JsonNode info = objmapper.readTree(response.toString());
                return info;
            } else {
                System.out.println("Error: Response code " + responseCode);
                return null;
            }
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
