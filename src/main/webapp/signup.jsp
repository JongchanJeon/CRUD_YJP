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
			<input type ="button" value="중복확인">	
			
		</div>
		<div>
			비밀번호를 입력하세요 : <input type="password" name="mem_passwd">
		</div>
		<div>
			이메일을 입력하세요 : <input type="email" name="mem_email">
		</div>
		<div>
			전화번호을 입력하세요 : <input type="text" name="mem_phone0" maxlength="3" size = "6"/> 
			-<input type="text" name="mem_phone1" maxlength="4" size = "8"/> 
			-<input type="text" name="mem_phone2" maxlength="4" size = "8"/> 
		</div>
		<div>
			주민등록번호을 입력하세요 : <input type="text" id="mem_RRN0" name="mem_RRN0" maxlength="6" size="12">
			-<input type="text" id="mem_RRN1" name="mem_RRN1" maxlength="7" size="14">
			<input type ="button" name ="checkRRN" onclick="window.checkRRN();" value = "사용자 인증"/>
			
		</div>
		<input type="hidden" name="actionType" value="SIGNUP"> <input
			type="submit" value="회원가입">
	</form>
<script type ="text/javascript" src ="./JS/function.js"></script>
</body>

</html>