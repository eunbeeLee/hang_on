package kr.co.hangOn.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.hangOn.repository.domain.User;
import kr.co.hangOn.user.service.UserService;

@Controller
@RequestMapping("/main")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String main() {
		return "main/login";
	}
	
	@SuppressWarnings({ "unused" })
	@RequestMapping("/loginPost.json")
	@ResponseBody
	public String login(User user, HttpSession session) throws Exception {
		User loginUser = userService.login(user.getUserEmail());
		String msg = "";
		System.out.println(loginUser.getUserPw());
		System.out.println("아니 이게 무슨소리요");
		System.out.println(BCrypt.checkpw(user.getUserPw(), loginUser.getUserPw()));
		if (loginUser == null) {
			msg = "등록되지 않은 이메일 입니다";
		}	
		// parameter로 받은 평문과 DB에 저장된 암호화값 비교
		else if (BCrypt.checkpw(user.getUserPw(), loginUser.getUserPw())) {
                session.setAttribute("loginUser", loginUser);
                session.setAttribute("userEmail", loginUser.getUserEmail());
                userService.stateCodeChangerLogin(loginUser.getUserEmail());
                return "/main/login.do";
        }
		System.out.println(msg);
		return msg;
	}

        // 해당 email을 가진 유저가 없거나 비밀번호 불일치
//        ra.addFlashAttribute("resultMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
//        return "redirect:/login";
			
//		} else if (!loginUser.getUserPw().equals(user.getUserPw())) {
//			msg = "비밀번호가 잘못됐습니다";
//		} else {
//			session.setAttribute("user", loginUser);
//			session.setAttribute("userEmail", loginUser.getUserEmail());
//			userService.stateCodeChangerLogin(loginUser.getUserEmail());
//			return "/lobby/view.do";
//		}
		
	@RequestMapping("/emailCheck.json")
	@ResponseBody
	public int emailCheck(HttpServletRequest request) throws Exception {
		String userEmail = request.getParameter("userEmail");
		int no = userService.emailCheck(userEmail);
		return no;
	}
	
	@RequestMapping(value = "/registerForm.do")
	public String registerForm(User user) {
		return "main/register";
	}
	
	@RequestMapping(value = "/register.do", method= {RequestMethod.POST})
	public String register(User user, RedirectAttributes attr) throws Exception {
		
		// DB 저장 전 Bcrypt를 이용한 비밀번호의 암호화
		String hashPassword = BCrypt.hashpw(user.getUserPw(), BCrypt.gensalt());
	    user.setUserPw(hashPassword);
		
		userService.register(user);
		attr.addFlashAttribute("msg", "가입을 축하합니다.");
		return "redirect:login.do";
	}
	
	@RequestMapping("/forgotPassword.do")
	public String forgotPassword() {
		return "main/forgotPassword";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws Exception {
		String userEmail = (String) session.getAttribute("userEmail");
		userService.stateCodeChangerLogout(userEmail);
		session.invalidate();
		return "redirect:login.do";
	}
}
