<%@page import="com.koreait.service.SelectService"%>
<%@page import="com.koreait.vo.GuestbookVO"%>
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
//	listView.jsp에서 넘어오는 데이터를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job");

//	수정 또는 삭제할 글 1건을 얻어온다.
	GuestbookVO vo = SelectService.getInstance().selectByIdx(idx);
//	out.println(vo + "<br/>");

//	수정 또는 삭제할 글이 테이블에 존재하지 않으면 에러 메시지를 출력하고 목록으로 돌려보내고 존재하면 수정 또는
//	삭제할 글을 화면에 보여주는 페이지로 이동시킨다.
	if (vo == null) {
		out.println("<script>");
		out.println("alert('" + idx + "번 글은 테이블에 존재하지 않습니다.')");
		out.println("location.href='list.jsp'");
		out.println("</script>");
	} else {
//		수정 또는 삭제할 글이 존재하면 request 영역에 저장하고 수정 또는 삭제 버튼이 클릭된 페이지로 넘겨준다.
		request.setAttribute("vo", vo);
		request.setAttribute("enter", "\r\n");
		request.setAttribute("currentPage", currentPage);
		pageContext.forward(job + ".jsp");
	}
	
%>

</body>
</html>






