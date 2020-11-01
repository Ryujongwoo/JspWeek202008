package com.koreait.service;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dao.MvcboardDAO;
import com.koreait.mybatis.MySession;
import com.koreait.vo.MvcboardVO;

public class MvcboardService {

	private static MvcboardService instance = new MvcboardService();
	private MvcboardService() { }
	public static MvcboardService getInstance() { return instance; }
	
//	컨트롤러에서 호출되는 테이블에 저장할 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 
//	메인글을 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void insert(MvcboardVO vo) {
		System.out.println("MvcboardService 클래스의 insert() 메소드");
		SqlSession mapper = MySession.getSession();
		MvcboardDAO.getInstance().insert(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
}
