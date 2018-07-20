package kr.co.hangOn.repository.domain;

public class Cloud {
	private String fileName;
	private String filePath;
	private String extension;
	private String fileSize;
	private String updtDate;
	private String success;
	
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getFileName() {
		return fileName;
	}
	public Cloud setFileName(String fileName) {
		this.fileName = fileName;
		return this;
	}
	public String getFilePath() {
		return filePath;
	}
	public Cloud setFilePath(String filePath) {
		this.filePath = filePath;
		return this;
	}
	public String getExtension() {
		return extension;
	}
	public Cloud setExtension(String extension) {
		this.extension = extension;
		return this;
	}
	public String getFileSize() {
		return fileSize;
	}
	public Cloud setFileSize(String fileSize) {
		this.fileSize = fileSize;
		return this;
	}
	public String getUpdtDate() {
		return updtDate;
	}
	public Cloud setUpdtDate(String updtDate) {
		this.updtDate = updtDate;
		return this;
	}
	
}
