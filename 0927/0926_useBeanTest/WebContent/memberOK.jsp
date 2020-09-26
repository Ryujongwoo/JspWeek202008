<%@page import="com.koreait.member.MemberVO"%>
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
//	member.jsp에서 submit 버튼을 클릭했을 때 넘어오는 데이터를 받는다.
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	int age = Integer.parseInt(request.getParameter("age"));
	boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
//	접속자 ip 주소를 받는다.
	String ip = request.getRemoteAddr();

//	member.jsp에서 넘겨받은 데이터를 저장할 VO 클래스 객체를 만들고 setter 메소드로 데이터를 넣어준다.
	MemberVO vo = new MemberVO();
	vo.setId(id);
	vo.setName(name);
	vo.setPassword(password);
	vo.setAge(age);
	vo.setGender(gender);
	vo.setIp(ip);
	
	out.println(vo);
%>

</body>
</html>