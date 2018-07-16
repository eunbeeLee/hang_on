package kr.co.hangOn.mail.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.user.service.UserService;

@RequestMapping("/mail")
@Controller
public class MailController {
	
	@Autowired
	public UserService userService;
	
	@RequestMapping("/forgotPassword.do")
	public String forgotPassword(String userEmail, HttpSession session, RedirectAttributes attr) {
		int no = userService.emailCheck(userEmail);
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		if (no == 0) {
			attr.addFlashAttribute("msg", "등록되지 않은 메일 주소입니다");
			return "redirect:main/forgotPassword.do";
		} else {
			for(int i = 0; i < 6; i++) {
				int ran = random.nextInt(9) + 1;
				sb.append(ran);
				String s = sb.toString();
				int randomNumber = Integer.parseInt(s);
				if (randomNumber > 100000) {
					int randomNo = randomNumber;
				}
			}
			
			
			
		}
	
		
		
		return "main/forgotPassword.do";
	}
}
