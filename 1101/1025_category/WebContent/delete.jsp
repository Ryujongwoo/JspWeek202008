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
//	삭제한 카테고리 이름을 메시지에 출력하기 위해 삭제하기 전에 삭제할 카테고리를 얻어온다.
	CategoryVO original = service.selectByIdx(vo.getIdx());
//	out.println(original);

//	카테고리를 삭제한다.
	service.delete(vo.getIdx());

//	카테고리 삭제 후 삭제 완료 메시지를 출력하고 카테고리 목록을 출력하는 페이지로 이동한다.
	out.println("<script>");
	out.println("alert('" + original.getCategory() + " 카테고리 삭제완료!!')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
%>

</body>
</html>


