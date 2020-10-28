<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Delivery check for managers</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<meta charset="UTF-8">
</head>
<body>
	<script>
	function change(seq){
		var status = document.getElementById('status'+seq).value;
		var seq = document.getElementById('seq'+seq).value;
		alert(status);
		alert(seq);
		
		location.href = "./processUpdateStatus.jsp?seq=" + seq + "&status=" + status;
		
	}
		// 수정버튼 클릭시
		/* function change(seqno) {
			var seq = document.getElementById("seq"+seqno).value;
			var seqNum = document.getElementById("status"+seqno).value;
			
			
			
			alert("The shipping information has been modified.");

			location.href = "./processUpdateStatus.jsp?seq=" + seq + "&status=" + seqNum;
		} */
		
	/* 	function change(seqno){
			var
		} */
		// 수정 텍스트 변경시
		/* function k(seq) {
			var btn = document.getElementById("btn"+seq);
			btn.disabled = "";
		} */
	</script>
	<%@ include file="../dbconn.jsp"%>
	<%
	String sql = "select id,p_id,seq,p_name,saledate,sessionId,unitprice,status,saleqty,p_fileName from product p, sale s where p.p_id = s.productId;";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	%>
	<div class="site-wrap">
		<jsp:include page="../menu.jsp" />
		
		
		
		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-12">
						<div class="border p-4 rounded" role="alert">
						<div style="text-align:center">
							<span style="color: black; font-size: 40px"> <strong>Delivery status</strong>
							</span>
						</div>
					</div>
				</div>
			</div>
			
			
			
				<%
						int total = 0;
						int seq = 0;
						int status1 = 0;
						int status2 = 0;
						int status3 = 0;
						int status4 = 0;
						int status5 = 0;
					%>
			
			<table class="table table-hover">
				<tr>
					<th>Product name</th>
					<th>User Id</th>
					<th>Regist Day</th>
					<th>Price(Quantity)</th>
					<th>Shipping information</th>
					<th>modify</th>
				</tr>
	
				<tr>
				
					<%
						while (rs.next()) {
					%>
					
					<td><img
						src="${pageContext.request.contextPath }/images/<%=rs.getString("p_fileName")%>"
						style="width: 50px; height: 50px; margin-right: 10px;"> <a
						href="${pageContext.request.contextPath }/product/product.jsp?id=<%=rs.getString("p_id")%>"
						style="text-decoration: none; font-weight: bold; color: black;"><%=rs.getString("p_name")%></a>
					</td>
					<td><%=rs.getString("id") %></td>
					<td><%=rs.getString("saledate")%> <input type="hidden" id="seq<%=seq%>"
						value='<%=rs.getString("seq")%>' /></td>
					<td>$<%=rs.getInt("unitPrice")%> (Quantity:<%=rs.getInt("saleqty") %>)<b style="font-size: 12px;"></td>
					<td><%=rs.getString("status")%></td>
					<td>
					<select name="status<%=seq%>" id="status<%=seq%>">
					<%
						String sql2="select * from statuscategory order by seq"; // 위의 sql문을 다시 초기화
						PreparedStatement pstmt2 = con.prepareStatement(sql2);
						ResultSet rs2 = pstmt2.executeQuery();
					%>
					<% 
						/* for(int i=0; i < catelist.size(); i++)
						out.print("<option value='" + catelist.get(i) + "'>" + catelist.get(i) + "</option>"); */
						while(rs2.next()){
						out.print("<option value='" + rs2.getString(2) + "' " + 
						(rs2.getString(2).equals(rs.getString("status")) ? "selected":"") +">" + rs2.getString(2) + "</option>");
							/* 삼항식 이용해서  수정하려는 해당상품의 선택돼있는 카테고리가 셀렉티드(선택) 되게함*/
					}
					%>
					</select>

						<input type="button" id="btn<%=seq %>"
						class="btn btn-primary" value="modify" onclick="change(<%=seq++%>)"/>
					</td>
	
				</tr>
				
	
				<%
				int sum = rs.getInt("unitPrice") * Integer.parseInt(rs.getString("saleqty"));
	
				
				total += sum;
				}
				%>
				
				
			</table>
		</div>
		
		
         
         </div>
         </div>
         


	<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/aos.js"></script>

	<script src="${pageContext.request.contextPath }/js/main.js"></script>
	<jsp:include page="..//footer.jsp" />
</body>
</html>
