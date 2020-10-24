package com.koreait.vo;

import java.util.Date;

//	VO(Value Object) => 처리할 데이터 1건을 기억하는 클래스
public class GuestbookVO {

//	VO 클래스이 멤버 변수 이름은 테블의 필드명 html form의 name 속성에 입력한 값과 같은 이름으로 만든다.
	private int idx;			// 글번호
	private String name;		// 작성자
	private String password;	// 비밀번호
	private String memo;		// 메모
	private Date writeDate;		// 작성일
	private String ip;			// 작성자 IP
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Override
	public String toString() {
		return "GuestbookVO [idx=" + idx + ", name=" + name + ", password=" + password + ", memo=" + memo
				+ ", writeDate=" + writeDate + ", ip=" + ip + "]";
	}
	
}
