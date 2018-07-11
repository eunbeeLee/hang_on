package kr.co.hangOn.document.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.co.hangOn.repository.domain.Document;
import kr.co.hangOn.repository.domain.DocumentGroup;

public interface DocumentService {
	public DocumentGroup saveOriFile(DocumentGroup documentGroup,HttpServletRequest request) throws Exception;
	public DocumentGroup pdfParser(DocumentGroup documentGroup,HttpServletRequest request) throws Exception;

}
 