<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
Connection conn = null;

try {
	String url = "jdbc:mysql://localhost:3306/WanderSpaceDB";
	String user = "root";
	String password = "parker0112!";

	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	System.out.println("데이터베이스 연결이 성공했습니다.");
} catch (SQLException ex) {
	System.out.println("데이터베이스 연결이 실패했습니다.<br>");
	System.out.println("SQLException: " + ex.getMessage());
} 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>