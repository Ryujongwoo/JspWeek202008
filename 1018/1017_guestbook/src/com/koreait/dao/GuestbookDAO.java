package com.koreait.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.koreait.vo.GuestbookVO;

public class GuestbookDAO {

	private static GuestbookDAO instance = new GuestbookDAO();
	private GuestbookDAO() { }
	public static GuestbookDAO getInstance() {
		return instance;
	}
	
//	InsertService 클래스에서 mapper와 테이블에 저장할 데이터가 저장된 객체를 넘겨받고 guestbook.xml 파일의 
//	insert sql 명령을 실행하는 메소드
	public void insert(SqlMapClient mapper, GuestbookVO vo) throws SQLException {
		System.out.println("GuestbookDAO 클래스의 insert() 메소드 실행");
//		System.out.println(vo);
//		insert("id", 데이터)
		mapper.insert("insert", vo);
	}
	
//	SelectService 클래스에서 호출되는 mapper를 넘겨받고 테이블에 저장된 전체 글의 개수를 얻어오는 guestbook.xml 파일의
//	select sql 명령을 실행하는 메소드
	public int selectCount(SqlMapClient mapper) throws SQLException {
		System.out.println("GuestbookDAO 클래스의 selectCount() 메소드 실행");
//		queryForObject() : select 명령의 실행 결과가 1건일 때 사용한다. => 리턴 타입이 Object 타입이므로 메소드의 
//		리턴 타입으로 반드시 형변환을 시켜야 한다.
//		queryForList() : select 명령의 실행 결과가 여러건일 때 사용한다. => 리턴 타입이 List 타입이므로 메소드의 
//		리턴 타입으로 반드시 형변환 시켜야 한다.
		return (int) mapper.queryForObject("selectCount");
	}
	
//	SelectService 클래스에서 호출되는 mapper와 한 페이지 분량의 글의 시작, 끝 인덱스 번호가 저장된 HashMap 객체를
//	넘겨받고 한 페이지 분량의 글 목록을 얻어오는 guestbook.xml 파일의 select sql 명령을 실행하는 메소드
	public ArrayList<GuestbookVO> selectList(SqlMapClient mapper, HashMap<String, Integer> hmap) throws SQLException {
		System.out.println("GuestbookDAO 클래스의 selectList() 메소드 실행");
		return (ArrayList<GuestbookVO>) mapper.queryForList("selectList", hmap);
	}
	
}
