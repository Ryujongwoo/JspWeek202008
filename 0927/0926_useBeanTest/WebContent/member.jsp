<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 양식</title>

<script type="text/javascript">

	function passwordCheck(obj) {
		
//		영문자, 숫자, 특수문자가 각각 1개 이상 입력되었나 확인한다.
		pw = obj.password.value.trim();
		
		/*
		alphaCount = 0;		// 영문자의 개수를 셀 변수
		numberCount = 0;	// 숫자의 개수를 셀 변수
		etcCount = 0;		// 특수문자의 개수를 셀 변수
		
//		입력된 비밀번호의 문자 개수 만큼 반복하며 영문자, 숫자, 특수문자의 개수를 센다.
		for (i = 0; i < pw.length; i++) {
			if (pw.charAt(i) >= 'a' && pw.charAt(i) <= 'z' || pw.charAt(i) >= 'A' && pw.charAt(i) <= 'Z') {
				alphaCount++;
			} else if (pw.charAt(i) >= '0' && pw.charAt(i) <= '9') {
				numberCount++;
			} else {
				etcCount++;
			}
		}
//		alert('영문자 : ' + alphaCount + '개\n숫자 : ' + numberCount + '개\n특수문자 : ' + etcCount + '개');
		console.log('영문자 : ' + alphaCount + '개\n숫자 : ' + numberCount + '개\n특수문자 : ' + etcCount + '개');
		
		if (alphaCount == 0 || numberCount == 0 || etcCount == 0) {
			alert('비밀번호는 영문자, 숫자, 특수문자를 각각 1개 이상 입력해야 합니다.');
			obj.password.value = '';
			obj.password.focus();
			return false;
		}
		
//		입력한 비밀번호가 8자 이상 12자 이하인가 검사한다.
		if (pw.length < 8 || pw.length > 12) {
			alert('비밀번호는 8자 이상 12자 이하로 입력해야 합니다.');
			obj.password.value = '';
			obj.password.focus();
			return false;
		}
		*/
		
//		정규식을 이용해서 영문자, 숫자, 특수문자가 각각 1개 이상 입력되고 8자 이상 12자 이하로 입력되어나 검사한다.
//		(?=.*[a-zA-Z]) : 영문자를 1개 이상 포함하는가? 
//		(?=.*[0-9]) : 숫자를 1개 이상 포함하는가?
//		(?=.*[!@#$%^&*]) : []안의 특수문자를 1개 이상 포함하는가?
//		[a-zA-Z0-9!@#$%^&*] : []안의 문자들로만 구성되어 있는가
//		{8,12} : 8자 이상 12자 이하인가?
//		test() : 인수로 지정된 문자열이 정규식 패턴을 만족하나 검사해서 만족하면 true, 그렇치 않으면 false를 리턴한다.
		pattern = new RegExp('^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,12}$');
		if (!pattern.test(pw)) {
			alert('비밀번호는 영문자, 숫자, 특수문자(!@#$%^&*)를 각각 1자 이상 포함해야 하고 8자 이상 12자 이하로 입력해야 합니다.');
			obj.password.value = '';
			obj.password.focus();
			return false;
		}
		
//		입력한 두 개의 비밀번호가 같은가 검사한다.
		if (obj.password.value.trim() != obj.repassword.value.trim()) {
			alert('비밀번호가 일치하지 않습니다.');
			obj.password.value = '';
			obj.repassword.value = '';
			obj.password.focus();
			return false;
		}
		
		return true;
		
	}

</script>

</head>
<body>

<form action="memberOK2.jsp" method="post" onsubmit="return passwordCheck(this)">
	<table width="500" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2">회원 가입</th>
		</tr>
		<tr>
			<td width="150">id</td>
			<td width="350"><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="repassword"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" name="gender" value="true" checked="checked">남자
				<input type="radio" name="gender" value="false">여자
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원가입">
				<input type="reset" value="다시쓰기">
			</td>
		</tr>
	</table>
</form>

</body>
</html>








