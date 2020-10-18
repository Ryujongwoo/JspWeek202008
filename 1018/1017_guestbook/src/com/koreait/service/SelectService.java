package com.koreait.service;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.koreait.dao.GuestbookDAO;
import com.koreait.ibatis.MyAppSqlConfig;
import com.koreait.vo.GuestbookList;

public class SelectService {

	private static SelectService instance = new SelectService(); 
	private SelectService() { }
	public static SelectService getInstance() {
		return instance;
	}

//	list.jsp에서 호출되는 화면에 표시할 페이지 번호를 넘겨받고 mapper를 얻어온 후 dao 클래스의 한 페이지 분량의 글
//	목록을 얻어오는 메소드를 호출하는 메소드
	public GuestbookList selectList(int currentPage) {
		System.out.println("SelectService 클래스의 selectList() 메소드 실행");
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		
//		한 페이지 분량의 글 목록과 페이지 작업에 사용할 8개의 변수 값을 저장하는 객체를 선언한다. => 리턴시킬 개체를
//		선언한다.
		GuestbookList guestbookList = null;
		GuestbookDAO dao = GuestbookDAO.getInstance();
		
		try {
//			한 페이지당 표시할 글의 개수를 정한다.
			int pageSize = 10;
//			테이블에 저장된 전체 글의 개수를 얻어온다.
			int totalCount = dao.selectCount(mapper);
//			System.out.println(totalCount);
			
//			pageSize, totalCount, currentPage를 인수로 넘겨서 한 페이지 분량의 글 목록과 페이지 작업에 사용할 8개의
//			변수를 초기화 시키는 클래스의 객체를 생성한다.
			guestbookList = new GuestbookList(pageSize, totalCount, currentPage);
			
//			1페이지 분량의 글 목록을 얻어와서 GuestbookList 클래스 객체의 ArrayList에 저장시킨다.
//			parameterClass와 resultClass에는 반드시 1개의 데이터 타입만 적을 수 있기 때문에 한 페이지 분량의
//			시작 인덱스 번호와 끝 인덱스 번호를 HashMap 객체를 만들어 저장한 수 넘겨준다.
			HashMap<String, Integer> hmap = new HashMap<String, Integer>();
			hmap.put("startNo", guestbookList.getStartNo());
			hmap.put("endNo", guestbookList.getEndNo());
			guestbookList.setGuestbookList(dao.selectList(mapper, hmap));
//			System.out.println(guestbookList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		한 페이지 분량의 글 목록과 페이지 작업에 사용할 8개의 변수가 저장된 객체를 리턴시킨다.
		return guestbookList;
	}
	
}









