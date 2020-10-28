<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 쿠키생성 new Cookie(이름,값)  -이름과 값 모두 String 타입
     이름은 a-z,A-Z,0-9사이의 값만 허용
     값은 특수문자인 경우 URLEncoder.encode()로 인코딩해줘야함*/

     String sessionId = (String)session.getAttribute("sessionId");
     
     request.setCharacterEncoding("utf-8");
     Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
     Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("c_fname"),"utf-8"));
     Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
     Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("postcode"),"utf-8"));
     Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("address"),"utf-8"));

     /* 유효기간 설정 */
     cartId.setMaxAge(24*60*60); // 24시간 * 60초 * 60분
     name.setMaxAge(24*60*60);
     shippingDate.setMaxAge(24*60*60);
     zipCode.setMaxAge(24*60*60);
     addressName.setMaxAge(24*60*60);

     // 클라이언트(브라우저)로 전달 response.addCookie(쿠키);
     response.addCookie(cartId);
     response.addCookie(name);
     response.addCookie(shippingDate);
     response.addCookie(zipCode);
     response.addCookie(addressName);
	

%>
<%
	request.setCharacterEncoding("utf-8");
	String totalMail = "";

	String c_fname = request.getParameter("c_fname");
	String postcode = request.getParameter("postcode");
	String address = request.getParameter("address");
	String detailAddress = request.getParameter("detailAddress");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail3 = request.getParameter("mail3");
	String c_phone = request.getParameter("c_phone");
	String c_order_notes = request.getParameter("c_order_notes");

	totalMail = mail1 + "@" + mail2;
	
	/* 데이터베이스 처리 */
	con.setAutoCommit(false);
	String sql="insert into delivery(id,c_fname, postcode, address, detailaddress, c_email_address, c_phone, c_order_notes) values (?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1,sessionId);
	pstmt.setString(2,c_fname);
	pstmt.setString(3,postcode);
	pstmt.setString(4,address);
	pstmt.setString(5,detailAddress);
	pstmt.setString(6,totalMail);
	pstmt.setString(7,c_phone);
	pstmt.setString(8,c_order_notes);

	pstmt.executeUpdate();
	con.commit();
	pstmt.close();
	
	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
	
	response.sendRedirect("./orderConfirmation.jsp");

%>

</body>
</html>
