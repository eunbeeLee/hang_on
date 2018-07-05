package kr.co.hangOn.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/document")
public class DocumentController {
	@RequestMapping("/{documentNo}/view.do")
	public String documentView(@PathVariable int documentNo, Model model) {
		System.out.println(documentNo+"문서 입장");
		return "document/test";
	}
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		System.out.println("개인 페이지 입장");
		return "mypage/view";
	}
}
