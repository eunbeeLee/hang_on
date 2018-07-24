package kr.co.hangOn.repository.domain;

import java.util.List;

public class BoardPage {
	private List<Board> board;
	private int maxPage = 5;
	private int pageNo;
	private int lastPage;
	private int boardCount;
	private int prev = 1;
	private int next = 10;
	private boolean prevPage;
	private boolean nextPage;
	private final int TAB = 10;
	
	private void initPage() {
		int currTab = pageNo / TAB + 1;
		prev = (currTab - 1) * TAB + 1;
		next = (currTab * TAB < lastPage) ? currTab * TAB : lastPage;
		prevPage = prev != 1 ? true : false;
		nextPage = next != lastPage ? true : false;
	}
	
	public BoardPage() {
		this.pageNo = 0;
	}
	public BoardPage(int pageNo) {
		super();
		this.pageNo = (pageNo-1)*maxPage;
	}
	public List<Board> getBoard() {
		return board;
	}
	public BoardPage setBoard(List<Board> board) {
		initPage();
		this.board = board;
		return this;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public BoardPage setMaxPage(int maxPage) {
		this.maxPage = maxPage;
		return this;
	}
	public int getPageNo() {
		return pageNo;
	}
	public BoardPage setPageNo(int pageNo) {
		this.pageNo = (pageNo-1);
		initPage();
		return this;
	}
	public int getLastPage() {
		return lastPage;
	}
	public BoardPage setLastPage(int lastPage) {
		this.lastPage = lastPage;
		return this;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public BoardPage setBoardCount(int boardCount) {
		this.boardCount = boardCount;
		return this;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public boolean isPrevPage() {
		return prevPage;
	}

	public void setPrevPage(boolean prevPage) {
		this.prevPage = prevPage;
	}

	public boolean isNextPage() {
		return nextPage;
	}

	public void setNextPage(boolean nextPage) {
		this.nextPage = nextPage;
	}
	
	
}
