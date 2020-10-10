<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
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
//	데이터베이스에 작업에 사용할 객체를 선언한다.
	Connection conn = null;				// 데이터베이스 연결에 사용하는 객체
	Statement stmt = null;				// 단순한 sql 명령 실행에 사용하는 객체, 정적 쿼리를 실행한다.
	PreparedStatement pstmt = null;		// 복잡한 sql 명령 실행에 사용하는 객체, 동적 쿼리를 실행한다.
	ResultSet rs = null;				// select sql 명령의 실행 결과를 기억하는 객체
	
	try {
//		mysql 드라이버 클래스를 읽어온다.
		Class.forName("com.mysql.jdbc.Driver");
//		mysql에 연결한다.
//		jdbc:mysql://localhost:포트번호/데이터베이스이름?한글처리
		String url = "jdbc:mysql://localhost:3307";
		conn = DriverManager.getConnection(url, "root", "0000");
		
		out.println("연결 성공 : " + conn + "<br>");
		
	} catch (ClassNotFoundException e) {
		out.println("드라이버 클래스가 없거나 읽어올 수 없습니다.<br>");
		e.printStackTrace();
	} catch (SQLException e) {
		out.println("데이터베이스 연결 정보가 올바르지 않습니다.<br>");
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
		}
	}
%>

</body>
</html>



















