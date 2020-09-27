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
<hr size="3" color="red">

<%
//	페이지 작업에 사용할 8개의 변수를 선언한다. => 계산에 의해 값이 결정되는 변수는 0으로 초기화 한다.
	int pageSize = 10;				// 한 페이지에 표시되는 글의 개수
	int totalCount = 0;				// 테이블에 저장된 전체 글의 개수
	int totalPage = 0;				// 전체 페이지의 개수
	int currentPage = 1;			// 현재 화면에 보여지는 페이지 번호
	int startNo= 0;					// 현재 화면에 표시되는 글의 시작 인덱스 번호
	int endNo= 0;					// 현재 화면에 표시되는 글의 마지막 인덱스 번호
	int startPage= 0;				// 페이지 이동 하이퍼링크 또는 버튼의 시작 페이지 번호
	int endPage= 0;					// 페이지 이동 하이퍼링크 또는 버튼의 마지막 페이지 번호

	Connection conn = DBUtil.getMysqlConnection();
	
//	totalCount에 테이블에 저장된 전체 글의 개수를 저장한다.
	String sql = "select count(*) from memolist";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
//	테이블에 저장된 글이 없으면 0을 얻어올 것이고 글이 있으면 글의 개수를 얻어오기 때문에 select 명령을 실행한
//	결과가 있나 없나 물어볼 이유가 없다.
	rs.next();

	totalCount = rs.getInt(1);
//	out.println(totalCount + "<br>");

//	totalPage에 전체 페이지의 개수를 계산해서 저장한다.
	
	
	sql = "select * from memolist order by idx desc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
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




















