package com.koreait.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dao.CategoryDAO;
import com.koreait.mybatis.MySession;
import com.koreait.vo.CategoryList;
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
	
//	list.jsp에서 호출되는 mapper를 얻어오고 DAO 클래스의 모든 카테고리 목록을 얻어오는 selete sql 명령을 실행하는
//	메소드를 호출하는 메소드
	public CategoryList selectList() {
		System.out.println("CategoryService 클래스의 selectList() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryList categoryList = new CategoryList();
		
		categoryList.setCategoryList(CategoryDAO.getInstance().selectList(mapper));
		
		mapper.close();
		return categoryList;
	}
	
//	reply.jsp에서 테이블에 저장할 서브 카테고리 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 DAO 클래스의 메인
//	카테고리를 테이블에 저장하는 insert sql 명령을 실행하는 메소드를 실하는 메소드
	public void reply(CategoryVO vo) {
		System.out.println("CategoryService 클래스의 reply() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO dao = CategoryDAO.getInstance();
		
//		서브 카테고리가 삽입될 위치를 결정하기 위해 lev와 seq를 1씩 증가시킨다.
		vo.setLev(vo.getLev() + 1);
		vo.setSeq(vo.getSeq() + 1);
		
//		서브 카테고리를 위치에 맞게 삽입하기 위해 같은 카테고리 그룹(ref)의 카테고리 출력 순서(seq)를 조정한다.
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("ref", vo.getRef());
		hmap.put("seq", vo.getSeq());
//		카테고리 출력 순서를 조정하는 메소드를 실행한다.
		dao.increment(mapper, hmap);
		
//		카테고리 출력 순서를 조정하고 난 후 서브 카테고리를 삽입하는 메소드를 실행한다.
		dao.reply(mapper, vo);
		
		mapper.commit();
		mapper.close();
	}
	
//	delete.jsp와 update.jsp에서 호출되는 삭제 또는 수정할 글 번호를 넘겨받고 삭제 도는 수정할 글 한 건을 얻어오는
//	select sql 명령을 실행하는 메소드를 호출하는 메소드
	public CategoryVO selectByIdx(int idx) {
		System.out.println("CategoryService 클래스의 selectByIdx() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryVO vo = CategoryDAO.getInstance().selectByIdx(mapper, idx);
		mapper.close();
		return vo;
	}
	
//	delete.jsp에서 호출되는 삭제할 글번호를 넘겨받고 mapper를 얻어온 후 카테고리 한 건을 삭제하는 delete sql 명령을
//	실행하는 메소드를 호출하는 메소드
	public void delete(int idx) {
		System.out.println("CategoryService 클래스의 delete() 메소드");
		SqlSession mapper = MySession.getSession();
		CategoryDAO.getInstance().delete(mapper, idx);
		mapper.commit();
		mapper.close();
	}
	
}









