package kr.co.hangOn.document.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFImageWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hangOn.repository.domain.Document;
import kr.co.hangOn.repository.domain.DocumentGroup;
import kr.co.hangOn.repository.mapper.DocumentMapper;



@Service("documentService")
public class DocumentServiceImpl implements DocumentService {
	@Autowired
	private DocumentMapper mapper;
	
	@Override
	public DocumentGroup saveOriFile(DocumentGroup documentGroup,HttpServletRequest request) throws Exception{
		ServletContext context = request.getServletContext();                    
		MultipartFile file = documentGroup.getFile();
		String oriName = file.getOriginalFilename();	                    // 원본파일명
		long fileSize = file.getSize();	                                    // 파일 사이즈
		String ext = "";                                                    // 1. 파일 확장자 담을 변수 생성
		int index = oriName.lastIndexOf(".");                               // 2. 원본 파일명에서 . 위치 찾기
		if (index != -1) { ext = oriName.substring(index); }                // 3. 파일명에서 확장자명(.포함)을 추출	.jsp .html 등
		String systemName = UUID.randomUUID().toString() + ext;				// 시스템에 저장하는 파일명 (랜덤생성 파일명 + 확장자)
		
		String saveFolder = "/resources/upload_file/document/"+documentGroup.getRoomNo()+"/"+UUID.randomUUID().toString();
		String realFolder = context.getRealPath(saveFolder);
		File fileFolder = new File(realFolder);
		if(!fileFolder.exists()) { fileFolder.mkdirs(); } 					// 디렉토리 생성
		file.transferTo(new File(realFolder+"/view.pdf"));	            	// 서버에 파일 저장
		
		mapper.insertDocumentGroup(
			documentGroup.setDocOriName(oriName)
						 .setDocOriPath(saveFolder+"/view.pdf")
						 .setDocImgPath(saveFolder+"/")
		);
		
		return documentGroup.setFile(null);
	}

	@Override
	public DocumentGroup pdfParser(DocumentGroup documentGroup,HttpServletRequest request) throws Exception{
		String imageFormat = "png";
		PDDocument PDFDocument = null; 
		File file = new File(request.getServletContext().getRealPath(documentGroup.getDocOriPath()));
		PDFDocument = PDDocument.load(file);
		int endOfPages = PDFDocument.getNumberOfPages();
		String savePath = request.getServletContext().getRealPath(documentGroup.getDocImgPath());
		PDFImageWriter imageWriter = new PDFImageWriter();
		imageWriter.writeImage(PDFDocument, 
							   imageFormat, 
							   "",			// pdf 패스워드
							   1, 			//이미지 출력 시작페이지
							   endOfPages, 	//이미지 출력 종료페이지
							   savePath,	//저장파일위치 및 파일명 지정 TEST+페이지 "TEST1.png" 파일저장 
							   BufferedImage.TYPE_INT_RGB,
							   300	// 해상도
		);
		List<Document> document = new ArrayList<>();
		for(int i = 1 ; i <= endOfPages ; i++) {
			Document doc = new Document().setDocPageNo(i)
										 .setDocPath(documentGroup.getDocImgPath()+i+"."+imageFormat)
										 .setDocGroupNo(documentGroup.getDocGroupNo());
			mapper.insertDocument(doc);
			document.add(doc);
		}
		return documentGroup.setDocument(document);
	}
	
}
