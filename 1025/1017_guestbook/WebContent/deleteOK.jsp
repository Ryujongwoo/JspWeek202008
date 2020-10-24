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
//	delete.jsp에서 넘어오는 데이터를 받는다. => VO 클래스에 멤버로 존재하면 useBean으로 받고 나머지는 별도로 받는다.
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.koreait.vo.GuestbookVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

${vo}<br/>

</body>
</html>