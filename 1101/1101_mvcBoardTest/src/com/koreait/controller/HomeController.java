package com.koreait.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.service.MvcboardService;
import com.koreait.vo.MvcboardVO;

//	서버가 실행되고 @WebServlet 어노테이션의 인수로 지정된 요청이 주소창에 요청되면 @WebServlet 어노테이션이 지정된
//	클래스의 메소드가 자동으로 실행된다.
//	get 방식으로 요청이 들어오면 doGet() 메소드가 자동으로 실행되고 post 방식으로 요청이 들어오면 doPost() 메소드가
//	자동으로 실행된다.
//	@WebServlet 어노테이션에 특정 요청을 써주면 그 요청이 들어올 때 만 컨트롤러의 메소드가 실행되므로 각각의 요청마다
//	컨트롤러를 만들어야 하는 번거로움이 생긴다. => @WebServlet 어노테이션에 와일드 카드 문자(*)를 사용하는 확장명
//	패턴 방식의 요청을 받는다. => 확장명 패턴으로 요청받으면 파일명은 상관없이 동일한 확장명으로 요청되면 컨트롤러의
//	메소드가 실행된다. => 확장명 패턴을 사용할 때는 맨 앞에 "/"를 붙이면 안된다. => 확장명을 jsp가 아닌 다른 확장명으로
//	지정하면 어떤 형태의 페이지가 호출되는지 숨길 수 있다. => 보안성 향상 
@WebServlet("*.nhn")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }

//  get 방식으로 주소창에 요청이 들어올 때 자동으로 실행되는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러에 get 방식으로 요청이 들어옴");
		actionDo(request, response);
	}

//  post 방식으로 주소창에 요청이 들어올 때 자동으로 실행되는 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러에 post 방식으로 요청이 들어옴");
		actionDo(request, response);
	}
	
//	get 방식으로 요청이 들어오나 post 방식으로 요청이 들어오나 같은 메소드가 실행되게 한다.
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러에 get 또는 post 방식에 관계없이 actionDo() 메소드가 실행된다.");
		
//		한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
//		주소창에 입력된 요청을 판단해 실행할 페이지를 결정한다.
//		getRequestURI() : 주소창에 요청된 경로와 요청한 페이지 이름(context)을 얻어온다.
		String url = request.getRequestURI();
		System.out.println(url);
//		getContextPath() : 주소창에 요청된 경로만 얻어온다.
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
//		주소창에 입력된 요청한 페이지 이름만 얻어온다.
		String context = url.substring(contextPath.length());
		System.out.println(context);
		
//		요청된 context에 따라 분기할 페이지를 결정한다.
		String viewPage = "/WEB-INF/";
		switch (context) {
			case "/insert.nhn":
				viewPage += "insert";
				break;
			case "/insertOK.nhn":
				
//				insert.jsp에서 넘어오는 데이터를 받아서 vo에 저장한다.
				MvcboardVO vo = new MvcboardVO();
				String name = request.getParameter("name");
				String subject = request.getParameter("subject");
				String content = request.getParameter("content");
				vo.setName(name);
				vo.setSubject(subject);
				vo.setContent(content);
				
//				service 클래스의 insert sql 명령을 실행하는 메소드를 호출한다.
				MvcboardService.getInstance().insert(vo);
				
				viewPage += "insert";
				break;
		}
		viewPage += ".jsp";
//		System.out.println(viewPage);
		
//		요청에 따른 페이지를 호출한다.
//		RequestDispatcher 인터페이스 객체를 이용해서 요청된 context의 실제 페이지를 호출해서 브라우저에 표시한다.
//		브라우저에 표시할 페이지 이름을 넣어준다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//		브라우저에 표시할 페이지를 호출한다.
		dispatcher.forward(request, response);
		
	}

}






















