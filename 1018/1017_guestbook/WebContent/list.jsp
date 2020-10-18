<%@page import="com.koreait.service.SelectService"%>
<%@page import="com.koreait.vo.GuestbookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--
	화면에 표시할 페이지 번호(currentPage)를 넘겨받아 테이블에 저장된 전체 글 목록에서 currentPage에 해당되는 한
	페이지 분량의 글 목록을 얻어와서 한 페이지 분량의 글을 브라우저에 촐력하는 페이지(listView.jsp)로 request 영역에
	저장해서 넘겨준다.
-->

<%
	request.setCharacterEncoding("UTF-8");
//	이전 페이지에서 넘어오는 브라우저에 표시할 페이지 번호(currentPage)를 받는다.
//	게시판이 최초로 실행되거나 insertOK.jsp에서 호출될 때는 currentPage가 넘어오지 않기 때문에 null 이다.
//	currentPage가 null 이면 parseInt() 메소드를 실행했을 때 NumberFormatException이 발생되므로 반드시 예외 처리를
//	해야 한다. => 이전 페이지에서 넘어오는 currentPage가 없으면 currentPage를 1로 초기화 시키고 currentPage가 있으면
//	넘어온 currentPage 값으로 초기화 시킨다.
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) { }
	
//	테이블에서 한 페이지 분량의 글을 얻어온다.
	GuestbookList guestbookList = SelectService.getInstance().selectList(currentPage);
//	한 페이지 분량의 글과 페이지 작업에 사용할 8개의 변수가 저장된 객체를 request 영역에 저장한다.
	request.setAttribute("guestbookList", guestbookList);
//	줄바꿈 처리를 하기 위해 '\r\n'을 request 영역에 저장한다.
	request.setAttribute("enter", "\r\n");
//	request 영역에 저장된 데이터를 가지고 브라우저에 글을 출력하는 페이지(listView.jsp)로 넘겨준다.
	pageContext.forward("listView.jsp");
%>

</body>
</html>









