<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <img src="/member01/images/yju_com_01.jpg"/>
 
 <ul>
  <li> <a href="/member01/mem_views/member01.jsp">회원관리페이지01</a>
  <li> <a href="/member01/mem_views/member02.jsp">회원관리페이지02</a>
  <li> <a href="/member01/mem_views/member03.jsp">회원관리페이지03</a>
  <li> <a href="/member01/mem_views/member04.jsp">회원관리페이지04</a>
  <li> <a href="/member01/mem_views/member05.jsp">회원관리페이지05</a>
  <li> <a href="/member01/mem_views/member_r.jsp">회원정보 조회 및 수정</a>
  <%

	if(session.getAttribute("userclass").equals("70")){
		System.out.println("관리자 모드");
		%>
		<li><a href="/member01/mem_views/member05.jsp">회원 정보 조회</a></li>
		<li><a href="/member01/mem_views/member05.jsp">회원관리자 위임</a></li>
		<%
		
	}
  %>
 </ul>

</body>
</html>