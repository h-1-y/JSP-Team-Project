<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../dbconn.jsp" %>
<%
String p_id = request.getParameter("p_id");
String p_name = request.getParameter("productname");
String qnapassword = request.getParameter("qnapassword");
String qnacategory = request.getParameter("qnacategory");
String content = request.getParameter("content");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(new Date());

String sql = "insert into qnaBoard(id,p_name,qnapassword,qnacategory,content,regist_day) values(?,?,?,?,?,?)";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, p_id);
pstmt.setString(2, p_name);
pstmt.setString(3, qnapassword);
pstmt.setString(4, qnacategory);
pstmt.setString(5, content);
pstmt.setString(6, date);

pstmt.executeUpdate();

if(pstmt!=null) pstmt.close();
if(con!=null) con.close();

response.sendRedirect("./successAddQnA.jsp"); 

%>
