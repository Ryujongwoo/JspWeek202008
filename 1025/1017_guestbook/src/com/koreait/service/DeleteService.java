package com.koreait.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.koreait.dao.GuestbookDAO;
import com.koreait.ibatis.MyAppSqlConfig;

public class DeleteService {

	private static DeleteService instance = new DeleteService(); 
	private DeleteService() { }
	public static DeleteService getInstance() {
		return instance;
	}

//	deleteOK.jsp에서 호출되는 삭제할 글번호를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 delete sql 명령을 실행하는
//	메소드를 호출하는 메소드
	public void delete(int idx) {
		System.out.println("DeleteService 클래스의 delete() 메소드 실행");
		SqlMapClient mapper = MyAppSqlConfig.getSqlMapInstance();
		try {
			GuestbookDAO.getInstance().delete(mapper, idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
