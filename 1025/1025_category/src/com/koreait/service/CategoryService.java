package com.koreait.service;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dao.CategoryDAO;
import com.koreait.mybatis.MySession;
import com.koreait.vo.CategoryVO;

public class CategoryService {

	private static CategoryService instance = new CategoryService();
	private CategoryService() { }
	public static CategoryService getInstance() {
		return instance;
	}
	
//	insert.jsp에서 테이블에 저장할 메인 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 메인
//	카테고리를 테이블에 저장하는 insert sql 명령을 실행하는 메소드를 실하는 메소드
	public void insert(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 insert() 메소드");
		SqlSession mapper = MySession.getSession();
		
		CategoryDAO.getInstance().insert(mapper, vo);
		
//		테이블의 내용이 갱신되는 insert, delete, update sql 명령을 실행했으면 반드시 commit() 메소드를 실행해야 한다.
		mapper.commit();
//		mybatis는 데이터베이스 작업이 완료되면 반드시 mapper를 닫아야 한다.
		mapper.close();
	}
	
}
