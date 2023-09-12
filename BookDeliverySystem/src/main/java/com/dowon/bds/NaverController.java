package com.dowon.bds;

import javax.servlet.http.HttpSession;

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
	private UserDto dto = new UserDto();
	private URLDto uDto;

	@Autowired
	private ISocialService service;
	
	// Response 받은 값을 JSON으로 바꾸기 위함
	private ObjectMapper objmapper = new ObjectMapper();
	
	@RequestMapping(value="/naverLogin.do")
	public String naverCallBack(String code, String state, HttpSession session) {
	
		logger.info("naverLogin.do 실행");
//		String tokenUrl = uDto.getNaverTokenUrl(code, state);
//		<%
//	    String clientId = "YOUR_CLIENT_ID";//애플리케이션 클라이언트 아이디값";
//	    String clientSecret = "YOUR_CLIENT_SECRET";//애플리케이션 클라이언트 시크릿값";
//	    String code = request.getParameter("code");
//	    String state = request.getParameter("state");
//	    String redirectURI = URLEncoder.encode("YOUR_CALLBACK_URL", "UTF-8");
//	    String apiURL;
//	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
//	    apiURL += "client_id=" + clientId;
//	    apiURL += "&client_secret=" + clientSecret;
//	    apiURL += "&redirect_uri=" + redirectURI;
//	    apiURL += "&code=" + code;
//	    apiURL += "&state=" + state;
//	    String access_token = "";
//	    String refresh_token = "";
//	    System.out.println("apiURL="+apiURL);
//	    try {
//	      URL url = new URL(apiURL);
//	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
//	      con.setRequestMethod("GET");
//	      int responseCode = con.getResponseCode();
//	      BufferedReader br;
//	      System.out.print("responseCode="+responseCode);
//	      if(responseCode==200) { // 정상 호출
//	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
//	      } else {  // 에러 발생
//	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
//	      }
//	      String inputLine;
//	      StringBuffer res = new StringBuffer();
//	      while ((inputLine = br.readLine()) != null) {
//	        res.append(inputLine);
//	      }
//	      br.close();
//	      if(responseCode==200) {
//	        out.println(res.toString());
//	      }
//	    } catch (Exception e) {
//	      System.out.println(e);
//	    }
//	    %>
		return "";
	}
}
