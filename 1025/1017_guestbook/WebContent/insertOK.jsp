<%@page import="com.koreait.service.InsertService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- insert.jsp에서 넘어오는 데이터를 받는다. -->
<!-- 넘어오는 데이터 중에서 VO 클래스에 멤버 변수로 존재하는 데이터는 useBean을 받고 나머지는 별도로 받는다. -->
<jsp:useBean id="vo" class="com.koreait.vo.GuestbookVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	vo.setIp(request.getRemoteAddr());
//	out.println(vo + "<br/>");

//	mapper => 데이터베이스와 연결하는 Connection과 데이터베이스에 연결한 후 실행할 sql 명령이 저장되어 있다.
//	Service 클래스 => sql 명령을 실행하기 전에 데이터 전처리 작업 => sql 명령어를 실행하기 전에 mapper를 얻어오고
//	필요한 작업이 있으면 실행한다.
//	DAO(Data Access Object) => xml 파일에 작성한 sql 명령을 mapper를 이용해 실행하는 메소드만 모아놓은 클래스

//	insert.jsp에서 넘겨받은 데이터를 테이블에 저장하는 메소드를 실행한다.
	InsertService.getInstance().insert(vo);

//	데이터 한 건을 저장한 후 브라우저에 출력할 한 페이지 분량의 글 목록을 얻오는 페이지로 이동한다.
	response.sendRedirect("list.jsp");
%>

</body>
</html>














