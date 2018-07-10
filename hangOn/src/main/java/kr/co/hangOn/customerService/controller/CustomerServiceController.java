package kr.co.hangOn.customerService.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customerService.do")
public class CustomerServiceController {
	
	public String customerService() {
		return "customerService/customerService";
	}
	
	
}
