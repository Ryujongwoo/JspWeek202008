<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function formCheck(obj) {
		if(!obj.category.value || obj.category.value.trim().length == 0) {
			alert('카테고리는 반드시 입력해야 합니다.');
			obj.category.value = "";
			obj.category.focus();
			return false;
		}
		return true;
	}

	function mySubmitUpdate(obj) {
		if(!obj.category.value || obj.category.value.trim().length == 0) {
			alert('수정할 카테고리를 입력해야 합니다.');
			obj.category.value = "";
			obj.category.focus();
		} else {
			obj.action = 'update.jsp';		// 인수로 넘어온 form의 action 페이지를 지정한다.
			obj.submit();					// action 페이지르 호출하고 form에 입력된 데이터를 전송한다.
		}
	}
	
</script>

</head>
<body>

<h1>Category Project</h1>

<!-- 메인 카테고리 입력 폼 -->
<form action="insert.jsp" method="post" onsubmit="return formCheck(this)">
	<input type="text" name="category"/>
	<input type="submit" value="메인 카테고리 저장"/>
</form>

<hr size="3" color="red"/>

<!-- 여기 부터 카테고리 목록을 출력한다. -->
<c:forEach var="vo" items="${categoryList.categoryList}">

	<!--
		서브 카테고리를 입력하는 모든 폼에 서로 다른 name 속성이 지정되어 있어야 식별이 가능하므로 모든 폼에
		서로 다른 이름의 폼 이름을 만든다.
	-->
	<c:set var="formName" value="form${vo.idx}"/>
		
	<form action="reply.jsp" method="post" onsubmit="return formCheck(this)" name="${formName}">
	
		<!-- 테스트가 완료되면 idx, ref, lev, seq를 표시하는 텍스트 상자는 모두 hidden으로 변경한다. -->
		<input type="hidden" name="idx" value="${vo.idx}" size="1"/>
		<input type="hidden" name="ref" value="${vo.ref}" size="1"/>
		<input type="hidden" name="lev" value="${vo.lev}" size="1"/>
		<input type="hidden" name="seq" value="${vo.seq}" size="1"/>
		
		<!-- 카테고리 레벨에 따른 들여쓰기를 한다. -->
		<c:if test="${vo.lev > 0}">
			<c:forEach var="i" begin="1" end="${vo.lev}" step="1">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<img src="./images/re.jpg"/ width="20" height="20">
		</c:if>
		${vo.category}
		
		<input type="text" name="category"/>
		<input type="submit" value="서브 카테고리 저장"/>
		<input type="button" value="수정" onclick="mySubmitUpdate(${formName})"/>
		<input type="button" value="삭제" onclick="location.href='delete.jsp?idx=${vo.idx}'"/>
	
	</form>

</c:forEach>

</body>
</html>










