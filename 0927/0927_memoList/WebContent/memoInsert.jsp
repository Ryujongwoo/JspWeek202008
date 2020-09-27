<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.koreait.memolist.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//	한글 깨짐 방지하고 memoList.jsp에서 넘어오는 데이터를 받는다.
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String memo = request.getParameter("memo");
//	접속자 IP 주소를 받는다.
	String ip = request.getRemoteAddr();

//	mysql에 접속한다.
	Connection conn = DBUtil.getMysqlConnection();

	/*
//	Statement를 이용해서 테이블에 저장하기
//	sql 명령을 만든다.
//	String sql = "insert into memolist (name, password, memo, ip) values ('" + name + "', '" + password + "', '" +
//			memo + "', '" + ip + "')";
	String sql = String.format("insert into memolist (name, password, memo, ip) values ('%s', '%s', '%s', '%s')",
			name, password, memo, ip);
//	out.println(sql + "<br>");
//	sql 명령을 실행할 준비를 한다.
	Statement stmt = conn.createStatement();
//	sql 명령을 실행한다.
//	executeQuery() : 테이블의 내용이 변경되지 않는 sql 명령을 실행한다. select
//	executeUpdate() : 테이블의 내용이 변경되는 sql 명령을 실행한다. insert, update, delete
	stmt.executeUpdate(sql);
	*/

//	PreparedStatement를 이용해서 테이블에 저장하기
//	sql 명령을 만든다.
	String sql = "insert into memolist (name, password, memo, ip) values (?, ?, ?, ?)";
//	sql 명령을 임시로 실행한다.
	PreparedStatement pstmt = conn.prepareStatement(sql);
//	"?"에 데이터를 채운다.
	pstmt.setString(1, name);
	pstmt.setString(2, password);
	pstmt.setString(3, memo);
	pstmt.setString(4, ip);
//	sql 명령을 실행하다.
	pstmt.executeUpdate();

//	테이블에 데이터를 저장하고 저장된 데이터를 출력하기 위해서 memoList2.jsp로 넘겨준다.
	response.sendRedirect("memoList2.jsp");
%>

</body>
</html>














