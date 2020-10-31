package com.koreait.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.vo.CategoryVO;

public class CategoryDAO {

	private static CategoryDAO instance = new CategoryDAO();
	private CategoryDAO() { }
	public static CategoryDAO getInstance() {
		return instance;
	}

//	CategoryService 클래스에서 mapper와 메인 카테고리 정보가 저장된 객체를 넘겨받고 메인 카테고리를 저장하는 
//	category.xml 파일의 insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, CategoryVO vo) {
		System.out.println("CategoryDAO 클래스의 insert() 메소드");
		mapper.insert("insert", vo);
	}
	
//	CategoryService 클래스에서 mapper를 넘겨받고 전체 카테고리 목록을 얻어오는 category.xml 파일의 select sql 명령을
//	실행하는 메소드
	public ArrayList<CategoryVO> selectList(SqlSession mapper) {
		System.out.println("CategoryDAO 클래스의 selectList() 메소드");
//		selectOne() : ibatis의 queryForObject() 메소드와 같은 기능을 실행한다. => 1개를 얻어올 때
//		selectList() : ibatis의 queryForList() 메소드와 같은 기능을 실행한다. => 여러개를 얻어올 때
		return (ArrayList<CategoryVO>) mapper.selectList("selectList");
	}
	
//	CategoryService 클래스에서 mapper와 ref, seq가 저장된 HashMap 객체를 넘겨받고 같은 카테고리 그룹에서 카테고리
//	출력 순서를 조정하기 위해서 조건에 만족하는 seq를 1씩 증가시키는 category.xml 파일의 update sql 명령을 실행하는
//	메소드
	public void increment(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("CategoryDAO 클래스의 increment() 메소드");
		mapper.update("increment", hmap);
	}
	
//	CategoryService 클래스에서 mapper와 서브 카테고리 정보가 저장된 객체를 넘겨받고 서브 카테고리를 저장하는
//	category.xml 파일의 insert sql 명령을 실행하는 메소드
	public void reply(SqlSession mapper, CategoryVO vo) {
		System.out.println("CategoryDAO 클래스의 reply() 메소드");
		mapper.insert("reply", vo);
	}
	
//	CategoryService 클래스에서 mapper와 수정 또는 삭제할 카테고리 번호를 넘겨받고 수정 또는 삭제할 카테고리 한 건을
//	얻어오는 category.xml 파일의 select sql 명령을 실행하는 메소드
	public CategoryVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("CategoryDAO 클래스의 selectByIdx() 메소드");
		return (CategoryVO) mapper.selectOne("selectByIdx", idx);
	}
	
//	CategoryService 클래스에서 mapper와 삭제할 카테고리 번호를 넘겨받고 카테고리 한 건을 삭제하는 category.xml 파일의
//	delete sql 명령을 실행하는 메소드
	public void delete(SqlSession mapper, int idx) {
		System.out.println("CategoryDAO 클래스의 delete() 메소드");
		mapper.delete("delete", idx);
	}
	
}




