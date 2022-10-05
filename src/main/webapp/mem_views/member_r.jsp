<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	String driverName = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost/member_db";
	String user = "root";
	String passwd = "root";
	
	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, user, passwd);
	Statement stmt = con.createStatement();
	request.setCharacterEncoding("utf-8");
%>

<%@ include file="../header.jsp" %>
<%
		String mem_name;
		String mem_id = (String) session.getAttribute("userid");
		String mem_passwd;
		String mem_email;
		String mem_phone;
		String mem_RRN;
		String sql;
		ResultSet rs;
		
		sql = "select * from member where mem_id ='";
		sql += mem_id +"'";
		System.out.println(sql);
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			System.out.println(rs.getString("mem_name"));
			mem_id = rs.getString("mem_id");
			mem_passwd = rs.getString("mem_passwd");
			mem_name = rs.getString("mem_name");
			mem_email = rs.getString("mem_email");
			mem_phone = rs.getString("mem_phone");
			mem_RRN = rs.getString("mem_RRN");
%>
			<form method="post" action="../mem_models/member_dao.jsp">
			<br>이름 : <input type="text" name = "mem_name" size = "30" value = <%=mem_name %> readonly/>
			<br>아이디 : <input type="text" name = "mem_id" size ="30" value = <%="'" + mem_id + "'" %>readonly>
			<br>비밀번호 : <input type="password" name = "mem_passwd" size ="30" value = <%="'" + mem_passwd + "'" %>>
			<br>이메일 : <input type="email" name = "mem_email" size ="30" value = <%="'" + mem_email + "'" %>>
			<br>휴대전화 : <input type="text" name = "mem_phone" size ="30" maxlength="11" value = <%="'" + mem_phone + "'" %>>
			<br>주민등록번호 : <input type="text" name = "mem_RRN" size ="30" maxlength="13" value = <%="'" + mem_RRN + "'" %>readonly>
			<br><input type ="hidden" name = "actionType" value="MEMBER_R">
			<br><input type ="submit" value="수정" onclick="if(!confirm('수정하시겠습니까?')){return false;}"/>
		</form>
<%
		}
		
%>

<%@ include file="../footer.jsp" %>
</body>
</html>