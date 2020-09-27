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
<title>출첵 게시판</title>
</head>
<body>

<!-- 입력 화면 설계 -->
<form action="memoInsert.jsp" method="post">
	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="4">아주 많이 허접해 보이는 출첵 게시판 Ver 0.0</th>
		</tr>
		<tr>
			<td width="100" align="center">이름</td>
			<td width="100" align="center">비밀번호</td>
			<td width="800" align="center" colspan="2">메모</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" size="8" style="height: 20px;">
			</td>
			<td>
				<input type="password" name="password" size="8" style="height: 20px;">
			</td>
			<td>
				<input type="text" name="memo" size="90" style="height: 20px;">
			</td>
			<td>
				<input type="submit" value="저장하기" style="height: 25px;">
			</td>
		</tr>
	</table>
</form>
<!-- 입력 화면 설계 끝 -->
<hr size="3" color="red">

<!-- 테이블에 저장된 글 목록 전체를 글번호(idx)의 내림차순(최신글 부터)으로 얻어온다. -->
<%
	Connection conn = DBUtil.getMysqlConnection();
	String sql = "select * from memolist order by idx desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
//	ResultSet 객체에 더 이상 처리할 다음 데이터가 없을 때 까지 반복하며 글을 출력한다.
//	next() : ResultSet 객체에 저장된 다음 데이터로 접근한다. 이 때 다음 데이터가 있으면 true, 없으면 false를 리턴한다.
	/*
	if(rs.next()) {		// ResultSet 객체에 저장된 데이터가 있는가?
		do {
			out.println(rs.getInt("idx") +", ");
			out.println(rs.getString("name") +", ");
			out.println(rs.getString("password") +", ");
			out.println(rs.getString("memo") +", ");
			out.println(rs.getTimestamp("writeDate") +", ");
			out.println(rs.getString("ip") +"<br>");
		} while (rs.next());
	} else {
		out.println("테이블에 저장된 글이 없습니다.");
	}
	*/
%>

<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th width="80">글번호</th>
		<th width="80">이름</th>
		<th width="640">메모</th>
		<th width="100">작성일</th>
		<th width="100">ip</th>
	</tr>

	<%
	if (rs.next()) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd(E)");
		do {
	%>
	
	<tr>
		<td><%=rs.getInt("idx")%></th>
		<td><%=rs.getString("name")%></th>
		<td><%=rs.getString("memo")%></th>
		<td><%=sdf.format(rs.getTimestamp("writeDate"))%></th>
		<td><%=rs.getString("ip")%></th>
	</tr>
	
	<%
		} while (rs.next());
	} else {
	%>
	
	<tr>
		<td colspan="5">
			<marquee>테이블에 저장된 글이 없습니다.</marquee>
		</td>
	</tr>
	
	<%
	}
	%>

</table>

</body>
</html>




















