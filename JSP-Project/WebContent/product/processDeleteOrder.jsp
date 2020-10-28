<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../dbconn.jsp" %>

<%
String seq = request.getParameter("seq");
String sql = "delete from sale where seq=?";
PreparedStatement pstmt = con.prepareStatement(sql);
con.setAutoCommit(false);
pstmt.setInt(1,Integer.parseInt(seq));

int result = pstmt.executeUpdate();

if(result > 0) con.commit();
if(result == 0) con.rollback();

con.setAutoCommit(true);

if(pstmt!=null) pstmt.close();
if(con!=null) con.close();

response.sendRedirect("./orderDetails.jsp");
%>