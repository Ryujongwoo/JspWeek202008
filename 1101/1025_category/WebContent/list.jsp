<%@page import="com.koreait.service.CategoryService"%>
<%@page import="com.koreait.vo.CategoryList"%>
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
//	테이블에서 전체 카테고리 목록을 얻어와서 CategoryList 클래스의 ArrayList에 저장한 후 CategoryList 클래스 객체를
//	request 영역에 저장시켜 카테고리 목록을 출력하는 페이지(categoryView.jsp로 넘겨준다.)
	CategoryList categoryList = CategoryService.getInstance().selectList();
	request.setAttribute("categoryList", categoryList);
	pageContext.forward("categoryView.jsp");
%>

</body>
</html>