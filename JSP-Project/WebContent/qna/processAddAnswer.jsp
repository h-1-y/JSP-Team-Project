<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<% 
String num = request.getParameter("num"); 
String answer = request.getParameter("Answer");
String result = "YES";
System.out.println(answer);
System.out.println(num);
%>


<%
String sql = "update qnaBoard set result=?,answer=? where num=?";
PreparedStatement pstmt = con.prepareStatement(sql);
System.out.println("실행됨1");
pstmt.setString(1, result);
pstmt.setString(2, answer);
pstmt.setString(3, num);
System.out.println("실행됨2");
pstmt.executeUpdate();
System.out.println("실행됨3");
if(con!=null) con.close();
if(pstmt!=null) pstmt.close();
System.out.println("실행됨4");
response.sendRedirect("./QnAListBack.no");
%>



