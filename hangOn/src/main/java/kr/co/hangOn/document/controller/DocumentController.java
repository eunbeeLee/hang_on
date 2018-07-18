package kr.co.hangOn.document.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.hangOn.document.service.DocumentService;
import kr.co.hangOn.repository.domain.DocumentGroup;

@Controller
@RequestMapping("/document")
public class DocumentController {
	@Autowired
	private DocumentService documentService;
	
	@RequestMapping(value="/parser.json", method=RequestMethod.POST)  
	@ResponseBody
	public DocumentGroup parser(DocumentGroup documentGroup,HttpServletRequest request) throws Exception{
		return documentService.pdfParser(documentService.saveOriFile(documentGroup,request),request);
	}
}
