<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../dbconn.jsp" %>

<%
String seq = request.getParameter("seq");
String status = request.getParameter("status");
String sql = "update sale set status=? where seq=?";
System.out.println(seq);
System.out.println(status);
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, status);
pstmt.setInt(2, Integer.parseInt(seq));

pstmt.executeUpdate();

if(pstmt!=null) pstmt.close();
if(con!=null) con.close();

response.sendRedirect("./orderDetails.jsp");
%>