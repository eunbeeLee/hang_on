package kr.co.hangOn.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.mail.service.MailService;
import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.user.service.UserService;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private MailService mailService;
 
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
 
    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/forgotPassword.do", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, User user, RedirectAttributes ra) throws Exception {
    	System.out.println(user.getUserEmail());
    	int no = userService.emailCheck(user.getUserEmail());
    	
		if (no == 0) { // 받은 이메일이 있는지 없는지 확인
			ra.addFlashAttribute("msg", "wrongEmail");
			return "redirect:/main/forgotPassword.do";
		} 
		else if (no == 1){ // 받은 이메일이 DB에 있을경우
			int ran = new Random().nextInt(10000000) + 1000000; // 랜덤번호 생성
			String ranPw = String.valueOf(ran); 
			
			String hashPassword = BCrypt.hashpw(ranPw, BCrypt.gensalt()); // 생성한 랜덤번호를 암호화
			user.setUserPw(hashPassword);
			userService.updatePw(user); // 암호화된 비번을 DB에 업뎃
			
			String subject = "임시 비밀번호 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 임시 비밀번호는 " + ranPw + " 입니다.");
			mailService.send(subject, sb.toString(), "findmebongseok2018@gmail.com", user.getUserEmail(), null);
			ra.addFlashAttribute("msg", "emailSent");
		}
		return "redirect:/main/login.do";
    }
}
