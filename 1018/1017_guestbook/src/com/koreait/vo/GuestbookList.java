package com.koreait.vo;

import java.util.ArrayList;

//	한 페이지 분량의 글 목록과 페이지 작업에 사용할 8개의 변수를 초기화 시키는 클래스
public class GuestbookList {

//	한 페이지 분량의 글(GuestbookVO) 목록을 저장할 ArrayList
	private ArrayList<GuestbookVO> guestbookList = new ArrayList<GuestbookVO>();
//	페이지 작업에 사용할 8개의 변수
	private int pageSize = 10;
	private int totalCount = 0;
	private int totalPage = 0;
	private int currentPage = 1;
	private int startNo= 0;
	private int endNo= 0;
	private int startPage= 0;
	private int endPage= 0;

	public GuestbookList() { }
//	pageSize, totalCount, currentPage를 인수로 넘겨받아 초기화 하고 나머지 변수의 값을 계산하는 생성자
	public GuestbookList(int pageSize, int totalCount, int currentPage) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		calculator();
	}
//	나머지 5개의 변수를 계산해서 초기화 시키는 메소드
	private void calculator() {
		totalPage = (totalCount - 1) / pageSize + 1;
		currentPage = currentPage > totalPage ? totalPage : currentPage;
//		oracle은 인덱스가 1부터 시작하기 때문에 아래 startNo 계산 결과에 1을 더해야 한다.
		startNo = (currentPage - 1) * pageSize + 1;
		endNo = startNo + pageSize - 1;
		endNo = endNo > totalCount ? totalCount : endNo;
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
	}
	
	public ArrayList<GuestbookVO> getGuestbookList() {
		return guestbookList;
	}
	public void setGuestbookList(ArrayList<GuestbookVO> guestbookList) {
		this.guestbookList = guestbookList;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	@Override
	public String toString() {
		return "GuestbookList [guestbookList=" + guestbookList + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", startNo=" + startNo + ", endNo="
				+ endNo + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
}

















