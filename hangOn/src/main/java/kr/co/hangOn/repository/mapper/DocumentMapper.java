package kr.co.hangOn.repository.mapper;

import kr.co.hangOn.repository.domain.Document;
import kr.co.hangOn.repository.domain.DocumentGroup;

public interface DocumentMapper {
	// 원본파일 파일그룹 형태로 저장
	int insertDocumentGroup(DocumentGroup documentGroup);
	void insertDocument(Document document);
}
