<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@include file="../dbconn.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title></title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<%
String filename = "";
String realFolder = "/images";
String encType = "utf-8";
int maxSize = 5 * 1024 * 1024;
System.out.print(getServletContext().getRealPath(realFolder));
MultipartRequest multi = 
     new MultipartRequest(request, 
    		 getServletContext().getRealPath(realFolder), 
    		 maxSize, 
    		 encType, 
    		 new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");
String name = multi.getParameter("pname");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");

Integer price;
if (unitPrice.isEmpty())	price = 0;
else price = Integer.valueOf(unitPrice);
long stock;
if (unitsInStock.isEmpty()) stock = 0;
else stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);


String sql = "insert into product values(?,?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, productId);
pstmt.setString(2, name);
pstmt.setInt(3, price);
pstmt.setString(4, description);
pstmt.setString(5, category);
pstmt.setLong(6, stock);
pstmt.setString(7, fileName);

pstmt.executeUpdate();

	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
%>

<%
	response.sendRedirect("./products.jsp");
%>

</body>
</html>