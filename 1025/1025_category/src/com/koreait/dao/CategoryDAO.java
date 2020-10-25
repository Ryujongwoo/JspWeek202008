package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;

import com.koreait.vo.CategoryVO;

public class CategoryDAO {

	private static CategoryDAO instance = new CategoryDAO();
	private CategoryDAO() { }
	public static CategoryDAO getInstance() {
		return instance;
	}

//	CategoryService 클래스에서 mapper와 메인 카테고리 정보가 저장된 객체를 넘겨받고 category.xml 파일의 insert sql
//	명령을 실행하는 메소드
	public void insert(SqlSession mapper, CategoryVO vo) {
		System.out.println("CategoryDAO 클래스의 insert() 메소드");
		mapper.insert("insert", vo);
	}
	
}
