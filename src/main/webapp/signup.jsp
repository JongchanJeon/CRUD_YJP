<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="./header.jsp"%>
	<h2>00회원가입 센터00</h2>

	<form method="post" action="./mem_models/member_dao.jsp">
		<div>
			이름을 입력하세요 : <input type="text" name="mem_name">
		</div>
		<div>
			아이디를 입력하세요 : <input type="text" name="mem_id">
		</div>
		<div>
			비밀번호를 입력하세요 : <input type="password" name="mem_passwd">
		</div>
		<div>
			이메일을 입력하세요 : <input type="email" name="mem_email">
		</div>
		<div>
			전화번호을 입력하세요 : <input type="number" name="mem_phone" maxlength="11">
		</div>
		<div>
			주민등록번호을 입력하세요 : <input type="number" name="mem_RRN" maxlength="13">
		</div>
		<input type="hidden" name="actionType" value="SIGNUP"> <input
			type="submit" value="회원가입">
	</form>

</body>
</html>