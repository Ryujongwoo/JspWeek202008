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
	totalPage = (totalCount - 1) / pageSize + 1;
//	out.println(totalPage + "<br>");
	
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
//	게시판이 최초로 실행되거나 memoInsert.jsp에서 호출될 때 currentPage가 넘오오지 않기 때문에 null 이다.
//	null에 parseInt() 메소드를 실행하면 NumberFormatException이 발생되므로 반드시 예외 처리를 해야 한다.
//	currentPage가 정상적으로 넘어오면 숫자로 바꿔 저장하지만 그렇치 않으면 parseInt() 메소드를 실행하지 않고
//	catch 블록으로 넘어가기 때문에 화면에 표시할 체이지 번호는 초기값인 1이 그대로 유지된다.
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
//		화면에 표시되는 페이지 번호는 전체 페이지 개수 보다 커지면 안되기 때문에 currentPage가 totalPage 보다 커지면
//		curentPage의 값을 totalPage로 수정한다.
		currentPage = currentPage > totalPage ? totalPage : currentPage;
	} catch (NumberFormatException e) { }

//	startNo에 브라우저에 화면에 표시될 페이지의 시작 인덱스 번호를 계산한다.
//	인덱스 번호는 select sql 명령을 실행했을 때 데이터가 출력되는 순서를 의미하며 mysql은 0부터 시작된다.
//	oracle은 인덱스 번호가 1부터 시작되기 때문에 아래 연산 결과에 1을 더해줘야 한다.
	startNo = (currentPage - 1) * pageSize;
//	mysql은 limit를 사용하면 되기 때문에 endNo가 필요 없지만 oracle은 limit가 없기 때문에 endNo를 계산해야 한다.
	endNo = startNo + pageSize - 1;
//	마지막 페이지에 표시되는 마지막 글의 개수는 반드시 화면에 표시할 글의 개수만큼 표시되지 않는다.
//	한 페이지에 표시되는 마지막 글의 인덱스는 전체 글의 개수보다 커지면 안되므로 마지막 글의 인덱스 번호가 전체
//	글의 개수보다 커지면 전체 글의 개수로 마지막 글의 인덱스 번호를 수정한다.
	endNo = endNo > totalCount ? totalCount : endNo;

//	브라우저에 표시할 한 페이지 분량의 글을 얻어온다.
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
		<td colspan="5" align="right">
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

	<!-- 1페이지 부터 마지막 페이지 까지 모두 이동할 수 있는 하이퍼링크 또는 버튼을 만든다. -->
	<tr>
		<td colspan="5" align="center">
		
		<%
		for (int i = 1; i <= totalPage; i++) {
			if(i == currentPage) {
		%>
			<%-- <span>[<%=i%>]</span> --%>
			<%-- <input type="button" value="<%=i%>" disabled="disabled"> --%>
			<button type="button" disabled="disabled"><%=i%></button>
		<%
			} else {
		%>
			<%-- <a href="?currentPage=<%=i%>">[<%=i%>]</a> --%>
			<%-- <input type="button" value="<%=i%>" onclick="location.href='?currentPage=<%=i%>'"> --%>
			<button type="button" onclick="location.href='?currentPage=<%=i%>'"><%=i%></button>
		<%
			}
		}
		%>
		
		</td>
	</tr>
	
	<tr>
		<td colspan="5" align="center">
	
		<%
		for (int i = 1; i <= totalPage; i++) {
			if(i == currentPage) {
				/* out.println("<span>[" + i + "]</span>"); */
				out.println("<input type='button' value='" + i + "' disabled='disabled'>");
			} else {
				/* out.println("<a href='?currentPage=" + i + "'>[" + i + "]</a>"); */
				out.println("<input type='button' value='" + i + "' onclick='location.href=\"?currentPage=" + i + "\"'>");
			}
		}
		%>
	
		</td>
	</tr>

</table>

</body>
</html>




















