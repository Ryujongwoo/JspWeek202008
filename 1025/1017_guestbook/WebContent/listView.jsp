<%@page import="com.koreait.vo.GuestbookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.koreait.vo.GuestbookList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       <!-- 대입문, 제어문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <!-- 함수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- jstl을 사용하는 post 방식 한글 깨짐 방지 -->
<fmt:requestEncoding value="UTF-8"/>

<%--
	jstl 대입문
	<c:set var="변수 이름" value="변수에 저장할 데이터"/>
	
	jstl 날짜 서식 변경
	<fmt:formatDate value="${날짜 데이터}" pattern="날짜 서식"/>
	
	jstl if문 => else를 사용할 수 없다.
	<c:if test=${조건식}>
		조건이 참일 경우 실행할 문장
	</c:if>
	
	jstl 향상된 for문
	<c:forEach var="변수 이름" items=${객체 이름}>
		반복할 문장
	</c:forEach>
	
	jstl 일반 for문
	초기치 부터 최종치 까지 증가치 만큼씩 변수 값이 증가하며 반복한다. 증가치는 생략시 기본값이 1이고 음수 값은
	사용할 수 없다.
	<c:forEach var="변수 이름" begin=${초기치} end=${최종치} step=${증가치}>
		반복할 문장
	</c:forEach>
--%>

<!--
	브라우저에 출력할 한 페이지 분량의 글 목록만 꺼내서 별도의 변수에 저장시켜 처리한다.
	GuestbookList guestbookList = (GuestbookList) request.getAttribute("guestbookList");
	ArrayList<GuestbookVO> view = guestbookList.getGuestbookList();
	위의 2줄과 같은 기능이 실행된다.
-->
<c:set var="view" value="${guestbookList.guestbookList}"></c:set>

<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
	<tr><th>방병록 보기</th></tr>
	<tr>
		<td align="right">
			${guestbookList.totalCount}개(${guestbookList.currentPage}/${guestbookList.totalPage}Page)
		</td>
	</tr>
	<tr>
		<td>
		
		<!-- 테이블에 저장된 글이 없으면 없다고 출력한다. -->
		<c:if test="${view.size() == 0}">
			<marquee>테이블에 저장된 글이 없습니다.</marquee>
		</c:if>
		
		<!-- 테이블에 저장된 글이 있으면 view에 저장된 글의 개수 만큼 반복하며 글 목록을 출력한다. -->
		<c:if test="${view.size() != 0}">
			<c:forEach var="vo" items="${view}">
				
				<table width="99%" align="center" border="1" cellpadding="5" cellspacing="0">
					<tr>
						<td>
							${vo.idx}.
							<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;')}"/> 
							<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/> 
							${name}	님이(${vo.ip})
							<fmt:formatDate value="${vo.writeDate}" pattern="yyyy년 MM월 dd일 a h:mm:ss"/> 
							남긴글
							
							<!-- 수정, 삭제 버튼 -->
							<input type="button" value="수정" 
								onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guestbookList.currentPage}&job=update'"/>
							<input type="button" value="삭제" 
								onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${guestbookList.currentPage}&job=delete'"/>
							
							<br/>
							<c:set var="memo" value="${fn:replace(vo.memo, '<', '&lt;')}"/> 
							<c:set var="memo" value="${fn:replace(memo, '>', '&gt;')}"/> 
							<c:set var="memo" value="${fn:replace(memo, enter, '<br/>')}"/> 
							${memo}
							
						</td>
					</tr>
				</table>

			</c:forEach>
		</c:if>
		
		</td>
	</tr>
	
	<!-- 페이지 이동 버튼 -->
	<tr>
		<td align="center">
		
		<!-- 맨 앞으로 -->
		<c:if test="${guestbookList.currentPage > 1}">
			<input type="button" value="start" title="첫 10 페이지로 이동합니다."
				onclick="location.href='?currentPage=1'">
		</c:if>
		<c:if test="${guestbookList.currentPage <= 1}">
			<input type="button" value="start" title="이미 첫 10 페이지 입니다." disabled="disabled">
		</c:if>
		<!-- 10 페이지 앞으로 -->
		<c:if test="${guestbookList.startPage > 1}">
			<input type="button" value="-10" title="이전 10 페이지로 이동합니다."
				onclick="location.href='?currentPage=${guestbookList.startPage - 1}'">
		</c:if>
		<c:if test="${guestbookList.startPage <= 1}">
			<input type="button" value="-10" title="이전 10 페이지가 없습니다." disabled="disabled">
		</c:if>
		
		<!-- 페이지 이동 -->
		<c:forEach var="i" begin="${guestbookList.startPage}" end="${guestbookList.endPage}" step="1">
			<c:if test="${i == guestbookList.currentPage}">
				<button type="button" disabled="disabled">${i}</button>
			</c:if>
			<c:if test="${i != guestbookList.currentPage}">
				<button type="button" onclick="location.href='?currentPage=${i}'">${i}</button>
			</c:if>
		</c:forEach>
		
		<!-- 10 페이지 뒤로-->
		<c:if test="${guestbookList.endPage < guestbookList.totalPage}">
			<input type="button" value="+10" title="다음 10 페이지가 없습니다."
					onclick="location.href='?currentPage=${guestbookList.endPage + 1}'">
		</c:if>
		<c:if test="${guestbookList.endPage >= guestbookList.totalPage}">
			<input type="button" value="+10" title="다음 10 페이지가 없습니다." disabled="disabled">
		</c:if>
		
		<!-- 맨 뒤로-->
		<c:if test="${guestbookList.totalPage > guestbookList.currentPage}">
			<input type="button" value="end" title="이미 마지막 10 페이지 입니다."
				onclick="location.href='?currentPage=${guestbookList.totalPage}'">
		</c:if>
		<c:if test="${guestbookList.totalPage <= guestbookList.currentPage}">
			<input type="button" value="end" title="이미 마지막 10 페이지 입니다." disabled="disabled">
		</c:if>
		</td>
	</tr>
	
	<!-- 글쓰기 버튼 -->
	<tr>
		<td align="right">
			<input type="button" value="글쓰기" onclick="location.href='insert.jsp'"/>
		</td>
	</tr>
</table>

</body>
</html>


















