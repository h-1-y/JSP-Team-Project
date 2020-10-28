<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../dbconn.jsp" %>
<%
String p_id = request.getParameter("p_id");
String p_name = request.getParameter("p_name");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
String p_fileName = request.getParameter("p_fileName");
String star = request.getParameter("star");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String date = sdf.format(new Date());

String sql = "insert into reviewBoard(p_id,p_name,subject,content,regist_day,p_fileName,star) values(?,?,?,?,?,?,?)";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, p_id);
pstmt.setString(2, p_name);
pstmt.setString(3, subject);
pstmt.setString(4, content);
pstmt.setString(5, date);
pstmt.setString(6, p_fileName);
pstmt.setString(7, star);

pstmt.executeUpdate();

if(pstmt!=null) pstmt.close();
if(con!=null) con.close();
 
response.sendRedirect("./successAddReview.jsp");
%>

