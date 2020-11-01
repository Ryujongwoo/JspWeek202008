<%@page import="com.koreait.vo.CategoryVO"%>
<%@page import="com.koreait.service.CategoryService"%>
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

<jsp:useBean id="vo" class="com.koreait.vo.CategoryVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	CategoryService service = CategoryService.getInstance();
//	수정한 카테고리 이름을 메시지에 출력하기 위해 수정하기 전에 수정할 카테고리를 얻어온다.
	CategoryVO original = service.selectByIdx(vo.getIdx());
//	out.println(original);

//	카테고리를 수정한다.
	service.update(vo);

//	카테고리 수정 후 수정 완료 메시지를 출력하고 카테고리 목록을 출력하는 페이지로 이동한다.
	out.println("<script>");
	out.println("alert('" + original.getCategory() + " 카테고리를 " + vo.getCategory() + " 카테고리로 수정완료!!')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
%>

</body>
</html>


