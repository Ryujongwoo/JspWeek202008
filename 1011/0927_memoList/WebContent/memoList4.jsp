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

<style type="text/css">

	a {color: black; text-decoration: none;}
	a:hover { font-weight: bold; color: tomato;}
	span {font-weight: bold; color: hotpink;}
	
}

</style>

</head>
<body>

<form action="memoInsert.jsp" method="post">
	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="4">그럭저럭 슬만해보이는 출첵 게시판 Ver 0.99</th>
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
	int pageSize = 10;
	int totalCount = 0;
	int totalPage = 0;
	int currentPage = 1;
	int startNo= 0;
	int endNo= 0;
	int startPage= 0;
	int endPage= 0;

	Connection conn = DBUtil.getMysqlConnection();
	
	String sql = "select count(*) from memolist";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	totalCount = rs.getInt(1);
	
//	콤보 상자에서 선택한 화면에 표시할 페이지당 글의 개수를 받는다.
//	게시판이 최초로 실행될 때 이전 페이지가 없으므로 pageSize가 null이기 때문에 예외 처리를 해야 한다.
	try {
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	} catch (NumberFormatException e) { }
	
	totalPage = (totalCount - 1) / pageSize + 1;
	
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		currentPage = currentPage > totalPage ? totalPage : currentPage;
	} catch (NumberFormatException e) { }

	startNo = (currentPage - 1) * pageSize;
	endNo = startNo + pageSize - 1;
	endNo = endNo > totalCount ? totalCount : endNo;

	sql = "select * from memolist order by idx desc limit ?, ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startNo);
	pstmt.setInt(2, pageSize);
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

	<tr>
		<td colspan="3">
			
			<form action="?" method="post">
				페이지당 표시할 글의 개수를 선택하세요
				<select name="pageSize">
					<option>3</option>
					<option>5</option>
					<option>10</option>
					<option>15</option>
					<option>20</option>
				</select>
				<input type="submit" value="보기">
			</form>
			
		</td>
		<td colspan="2" align="right">
			<%=totalCount%>개(<%=currentPage%> / <%=totalPage%>)Page
		</td>
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

	
	<tr>
		<td colspan="5" align="center">
		
		<%
		startPage = (currentPage - 1) / 10 * 10 + 1;
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage;
		
		if (startPage > 1) {
		%>
			<input type="button" value="start" title="첫 10 페이지로 이동합니다."
				onclick="location.href='?currentPage=1'">
			<input type="button" value="-10" title="이전 10 페이지로 이동합니다."
				onclick="location.href='?currentPage=<%=startPage - 1%>'">
		<%
		} else {
		%>
			<input type="button" value="start" title="이미 첫 10 페이지 입니다." disabled="disabled">
			<input type="button" value="-10" title="이전 10 페이지가 없습니다." disabled="disabled">
		<%
		}
		
		for (int i = startPage; i <= endPage; i++) {
			if(i == currentPage) {
		%>
			<button type="button" disabled="disabled"><%=i%></button>
		<%
			} else {
		%>
			<button type="button" onclick="location.href='?currentPage=<%=i%>'"><%=i%></button>
		<%
			}
		}

		if (endPage < totalPage) {
		%>
			<input type="button" value="+10" title="다음 10 페이지가 없습니다."
				onclick="location.href='?currentPage=<%=endPage + 1%>'">
			<input type="button" value="end" title="이미 마지막 10 페이지 입니다."
				onclick="location.href='?currentPage=<%=totalPage%>'">
		<%
		} else {
		%>
			<input type="button" value="+10" title="다음 10 페이지가 없습니다." disabled="disabled">
			<input type="button" value="end" title="이미 마지막 10 페이지 입니다." disabled="disabled">
		<%
		}
		%>
		
		</td>
	</tr>
	
</table>

</body>
</html>




















