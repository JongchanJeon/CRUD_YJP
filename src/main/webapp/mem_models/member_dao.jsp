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

<%
    String actionType = request.getParameter("actionType");

	String userID;
	String userPW;
	
	String mem_name;
	String mem_id;
	String mem_passwd;
	String mem_email;
	String mem_phone;
	String mem_RRN;
	String mem_class;
	String sql;
	String checkClass;
	
	int loginState;

	switch(actionType){
		case "SIGNUP":
			mem_name = request.getParameter("mem_name");
			mem_id = request.getParameter("mem_id");
			mem_passwd = request.getParameter("mem_passwd");
			mem_email = request.getParameter("mem_email");
			mem_phone = request.getParameter("mem_phone0")+request.getParameter("mem_phone1")+request.getParameter("mem_phone2");
			mem_RRN = request.getParameter("mem_RRN0")+request.getParameter("mem_RRN1");
			sql = "insert into member (mem_name, mem_id, mem_passwd, mem_email, mem_phone, mem_RRN) values";
			sql += "('" + mem_name + "','" + mem_id + "','" + mem_passwd + "','" + mem_email + "','" + mem_phone +"','" + mem_RRN +"')";
			System.out.println(sql);
			
			int result = stmt.executeUpdate(sql);
			
			if(result == 1){
				System.out.println("레코드 추가 성공");
				%>
				<script>alert("회원가입을 성공하였습니다.")</script>
				<%

			}
			else {
				System.out.println("레코드 추가 실패");
				%>
				<script>alert("회원가입을 실패하였습니다.")</script>
				<%
			}
			
			break;
		case "LOGIN":
			
			PreparedStatement pstmt; // 쿼리문 대기 및 설정
			ResultSet rs; // 결과값 받아오기
			int loginResult;
			userID = request.getParameter("userid");
		    userPW = request.getParameter("passwd");
		    checkClass = "select mem_class from member where mem_id=?";
		    pstmt = con.prepareStatement(checkClass);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				session.setAttribute("userclass", rs.getString(1));
				System.out.println(session.getAttribute("userclass"));
			}
			
			System.out.println(userID);
			System.out.println(userPW);
			if (userID.equals("") || userPW.equals("")){
				%>
				<script>alert("아이디 또는 비밀번호를 입력해 주세요.")</script>
				<%
				System.out.println("아이디 또는 비밀번호를 입력해주세요.");
			}else {
				sql = "select mem_passwd from member where mem_id =?";
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, userID);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						if(rs.getString(1).equals(userPW)) {
							session.setAttribute("loginState", "login");
				    		session.setAttribute("userid", userID);
				    		session.setAttribute("userpw", userPW);
				    		
				    		/* if(mem_class == "70"){
				    			session.setAttribute("userclass", "manager");
				    		}else{
				    			session.setAttribute("userclass", "guset");
				    		} */
				    		
				    		%> <script>alert("로그인을 성공하였습니다.")</script><%
						}else {
							%> <script>alert("아이디 또는 비밀번호를 확인 해 주세요.")</script><%
					}
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
		    break;
		    
		case "LOGOUT":
			session.setAttribute("userid", null);
			session.setAttribute("userpw", null);
			session.setAttribute("loginState", "logout");
			session.setAttribute("userclass", "GHOST");
			break;
		case "MEMBER_R":
			mem_id = request.getParameter("mem_id");
			mem_passwd = request.getParameter("mem_passwd");
			mem_name = request.getParameter("mem_name");
			mem_email = request.getParameter("mem_email");
			mem_phone = request.getParameter("mem_phone");
			mem_RRN = request.getParameter("mem_RRN");

		
			sql = "update member set mem_passwd='" + mem_passwd + "', mem_email='" + mem_email + "',mem_phone='" + mem_phone + "' " ;
			sql += "where mem_id ='" + mem_id + "'";
			System.out.println(sql);
			
			result = stmt.executeUpdate(sql);
			if(result == 1){
				System.out.println("레코드 수정 성공");
			}
			else {
				System.out.println("레코드 수정 실패");
			}
			break;

			
		default:
			break;
	}
%>

<script>location.href="../index.jsp"</script>

</body>
</html>