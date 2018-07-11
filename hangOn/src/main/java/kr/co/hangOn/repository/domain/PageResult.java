package kr.co.hangOn.repository.domain;

public class PageResult {
	private int listSize = 11;
	private int tabSize  = 5;
	private int pageNo;
	private int count;
	private int lastPage;//현존하는 페이지들 중의 마지막 EX)총 14페이지에서 14페이지
	private int beginPage;//현재페이지 바로 전 페이지 ex)10페이지에 있으면 9페이지를 의미
	private int endPage;//현재 탭에서 마지막 페이지
 
	private boolean prev;
	private boolean next;

	public PageResult(int pageNo, int count) {
		this.count = count;
		this.pageNo = pageNo;
		init();
	}
	
	private void init() {
		
		lastPage = (int)Math.ceil(count / (double)listSize);
		
		// 현재 페이지에 해당하는 탭 위치, 탭 시작 페이지, 탭 끝 페이지, 이전.다음 페이지 존재 여부 
		int currTab   = (pageNo  -1) / tabSize + 1;
		beginPage = (currTab -1) * tabSize + 1;  
		endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		prev = beginPage != 1; 
		next = endPage != lastPage;
		
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getTabSize() {
		return tabSize;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean getPrev() {
		return prev;
	}

	public boolean getNext() {
		return next;
	}
}
