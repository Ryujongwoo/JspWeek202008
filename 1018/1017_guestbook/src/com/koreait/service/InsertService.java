package com.koreait.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.koreait.dao.GuestbookDAO;
import com.koreait.ibatis.MyAppSqlConfig;
import com.koreait.vo.GuestbookVO;

public class InsertService {

//	singleton 패턴은 프로그램에서 한 순간에 단 한 개의 객체만 필요한 경우 만들어 사용한다.
//	singleton 패턴 코딩 방법
//	1. 자기 자신의 객체를 기본 생성자를 사용해서 정적 멤버로 만든다.
	private static InsertService instance = new InsertService(); 
//	2. 클래스 외부에서 객체를 생성할 수 없도록 기본 생성자의 접근 권한을 private으로 만든다.
	private InsertService() { }
//	3. 1에서 만든 자기 자신의 객체를 리턴시키는 정적 메소드를 만든다.
	public static InsertService getInstance() {
		return instance;
	}
	
//	insert.jsp에서 넘어온 테이블에 저장할 데이터가 저장된 객체를 받고 mapper를 얻어오는 메소드
	public void insert(GuestbookVO vo) {
		System.out.println("InsertService 클래스의 insert() 메소드 실행");
//		System.out.println(vo);
		
//		mapper를 얻어온다.
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
//		insert sql 명령을 실행하기 전에 필요한 작업이 있다면 실행한다.
		
//		실제 sql 명령을 실행하는 DAO 클래스의 메소드를 호출한다.
		try {
			GuestbookDAO.getInstance().insert(mapper, vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
