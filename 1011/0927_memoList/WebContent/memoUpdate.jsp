<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.koreait.memolist.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 글 보기</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
//	memoList4.jsp에서 넘어오는 수정할 글번호(idx)와 수정 작업 후 돌아갈 페이지 번호(currentPage)를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
//	수정할 글을 화면에 출력하기 위해 테이블에서 얻어온다.
	Connection conn = DBUtil.getMysqlConnection();
	String sql = "select * from memolist where idx = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	ResultSet rs = pstmt.executeQuery();
	
//	수정할 글이 테이블에 존재하는가 검사한다.
	if (rs.next()) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일 a h시 mm분 ss초");
%>

<!-- 수정할 글을 화면에 보여주고 비밀 번호를 입력받는다. -->
<form action="updateOK.jsp" method="get">
	<table width="700" align="center" border="1" cellpadding="5" cellspacing="0">
	
		<tr><th colspan="2">수정할 글 보기</th></tr>
		<tr>
			<td width="100">글번호</td>
			<td width="600"><%=rs.getInt("idx")%></td>
		</tr>
		<tr>
			<td>이름</td>
			<%-- <td><%=rs.getString("name")%></td> --%>
			<td>
				<!--
					type="text"의 속성으로 readonly="readonly"를 지정하면 편집은 할 수 없지만 데이터가 다음 페이지로
					전달되고 disabled="disabled"를 지정하면 데이터가 다음 페이지로 전달되지 않는다.
				-->
				<input type="text" name="name" value="<%=rs.getString("name")%>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td>메모</td>
			<%-- <td><%=rs.getString("memo")%></td> --%>
			<td>
				<input type="text" name="memo" value="<%=rs.getString("memo")%>" size="75">
			</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=sdf.format(rs.getTimestamp("writeDate"))%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				비밀번호 <input type="password" name="password">
				<input type="submit" value="수정하기">
				<input type="reset" value="다시쓰기">
				<input type="button" value="돌아가기1" onclick="history.back()">
				<!-- history.go(0) : 현재 페이지 새로고침 기능이 실행된다. -->
				<input type="button" value="돌아가기2" onclick="history.go(-1)">
				<input type="button" value="돌아가기3" 
					onclick="location.href='memoList4.jsp?currentPage=<%=currentPage%>'">
			</td>
		</tr>
	
	</table>
	
	<!-- 수정할 글번호와 수정 후 돌아갈 페이지 번호를 hidden으로 넘겨준다. -->
	<input type="hidden" name="idx" value="<%=idx%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
	
</form>

<%
	} else {
		out.println("<script>");
		out.println("alert('" + idx + "번 글은 테이블에 존재하지 않습니다.')");
		out.println("location.href='memoList4.jsp'");
		out.println("</script>");
	}
%>

</body>
</html>













