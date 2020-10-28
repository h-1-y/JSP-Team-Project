<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection con = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SemiProject?useSSL=false","root","1234");
	

}catch(Exception e){
	out.print("연결 실패<br>");
	out.print("SQLException : " + e.getMessage());
}
%>

</body>
</html>