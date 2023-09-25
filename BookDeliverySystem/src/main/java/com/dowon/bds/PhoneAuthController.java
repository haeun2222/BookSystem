package com.dowon.bds;

import java.util.Random;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
public class PhoneAuthController {
	
	final DefaultMessageService messageService;

    public PhoneAuthController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSE64I8LHDGKT6T", "VV0QN0ZOFAFNWXISEHJ9IFM7KFLEBEKR", "https://api.coolsms.co.kr");
    }
    
    @PostMapping("/send-one")
    public SingleMessageSentResponse sendOne() {
        Message message = new Message();
        Random random = new Random();
        int randomNum = random.nextInt(900000)+100000;
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01092465759");
        message.setTo("01092465759");
        message.setText("도원결의 비대면 도서대출 시스템 본인인증 " + randomNum + " 입력해주세요.");
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

        return response;
    }

}
