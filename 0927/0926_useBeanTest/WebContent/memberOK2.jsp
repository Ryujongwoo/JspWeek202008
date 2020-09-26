<%@page import="java.util.Date"%>
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
//	Date date = new Date();
//	out.println(date + "<br>");
%>

<!--
	useBean 액션 태그를 사용하면 new를 사용하지 않고 객체를 만들어 사용할 수 있다.
	id 속성에는 생성할 객체의 이름을 적는다.
	class 속성에는 객체를 생성할 클래스의 이름을 반드시 풀 패키지 이름으로 입력한다.
-->

<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
${date}

<!--
	이전 페이지에서 넘어오는 데이터가 VO 클래스의 멤버 변수(필드)로 존재하면 useBean 액션 태그를 사용해서 받고
	존재하지 않으면 별도로 받는다. => 넘어오는 데이터를 받는 코딩을 하지 않아도 useBean 액션 태그가 자동 처리한다.
	MemberVO vo = new MemberVO();와 같은 기능이 실행된다.
-->
<jsp:useBean id="vo" class="com.koreait.member.MemberVO">

	<!--
		setProperty 액션 태그는 객체의 setter 메소드를 실행한다. => 객체에 setter 메소드가 있어야 한다.
		property 속성에는 setter 메소드를 실행할 멤버 변수 이름을 입력한다.
		name 속성에는 실행할 setter 메소드가 작성된 클래스 객체 이름을 입력한다.
		vo.setId(id);와 같은 기능이 실행된다.
	-->
	<!--
	<jsp:setProperty property="id" name="vo"/>
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="password" name="vo"/>
	<jsp:setProperty property="age" name="vo"/>
	<jsp:setProperty property="gender" name="vo"/>
	-->
	
	<!-- property 속성으로 "*"을 입력하면 모든 멤버 변수의 setter 메소드가 실행된다. -->
	<jsp:setProperty property="*" name="vo"/>

</jsp:useBean>

<%
//	ip는 member.jsp에서 넘어오는 데이터가 아니기 때문에 useBean을 사용해서 처리할 수 잆다.
	vo.setIp(request.getRemoteAddr());
%>

${vo}<br>

</body>
</html>














