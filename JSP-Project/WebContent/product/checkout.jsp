<%@page import="dto.Product"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(new Date());
String sessionId = (String)session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<title>Shoppers &mdash; Colorlib e-Commerce Template</title>
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

</head>
<body>
	<div class="site-wrap">
		<jsp:include page="../menu.jsp" />

		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0">
						<a href="index.jsp">Home</a> <span class="mx-2 mb-0">/</span> <a
							href="cart.jsp">Cart</a> <span class="mx-2 mb-0">/</span> <strong
							class="text-black">Checkout</strong>
					</div>
				</div>
			</div>
		</div>

		<div class="site-section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-md-12">
						<div class="border p-4 rounded" role="alert">
							<span style="color: black; font-size: 40px"> <strong>Ordering
									person</strong>
							</span>
						</div>
					</div>
				</div>
				<form action="./processCheckOut.jsp" class="form-horizontal"
					method="post">
					<div class="row">
						<div class="col-md-6 mb-5 mb-md-0">
							<h2 class="h3 mb-3 text-black">Billing Details</h2>
							<div class="p-3 p-lg-5 border">
								<div class="form-group"></div>

								<div class="form-group row">
									<div class="col-md-6">
										<label for="c_fname" class="text-black"> Name <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_fname" name="c_fname">
											<input type="hidden" value="<%=sessionId%>" name="id">
									</div>
								</div>
								<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
								<div class="form-group row">
									<label class="col-sm-2">PostCode</label>
									<div class="col-sm-10">
										<input type="text" id="postcode" placeholder="postcode"
											name="postcode" class="form-control" style="width: 90px; display: inline-block;"> 
										<input type="button" onclick="execDaumPostcode()" value="Find"
												style="width: 90px; margin-left: 20px;" class="btn btn-sm btn-primary"><br>
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-2">Address</label>
									<div class="col-sm-10">
										<input name="address" id="address" class="form-control">
									</div>
								</div>


								<div class="form-group row">
									<label class="col-sm-2">Detail Address</label>
									<div class="col-sm-10">
										<input id="detailAddress" name="detailAddress"
											class="form-control">
									</div>
								</div>


								<div class="form-group row mb-5">
									<div class="col-md-6">
										<label for="c_email_address" class="text-black">Email Address<span class="text-danger">*</span></label> 
										<input name="mail1" maxlength="50" style="display: inline-block;" class="form-control"> 
										@
										<input name="mail2" id="mail2" maxlength="50" placeholder="When entering directly"
												style="display: inline-block;" class="form-control"> 
										<select name="mail3" id="mail3" onchange="eMailChange()" class="btn btn-secondary btn-sm dropdown-toggle"
													style="margin-top: 10px;">
											<option value="" selected="selected">- Select Email -</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="gmail.com">gmail.com</option>
											<option value="nate.com">nate.com</option>
											<option value="etc">직접입력</option>
										</select>
									</div>
									
								</div>
								<div class="col-md-6">
										<label for="c_phone" class="text-black">Phone <span
											class="text-danger">*</span></label> <input type="text"
											class="form-control" id="c_phone" name="c_phone"
											placeholder="Phone Number">
									</div>


								<div class="form-group" style="margin-top: 20px;">
									<label for="c_order_notes" class="text-black">
									Shipping Message
									</label>
									<textarea name="c_order_notes" id="c_order_notes" cols="30"
										rows="5" class="form-control"></textarea>
								</div>
								<input type="hidden" name="shippingDate" value="<%=date%>">
							</div>
						</div>
						<div class="col-md-6">

							<div class="row mb-5">
								<div class="col-md-12">
									<h2 class="h3 mb-3 text-black">Your Order</h2>
									<div class="p-3 p-lg-5 border">
										<table class="table site-block-order-table mb-5">
											<thead>
												<th>Product</th>
												<th>Quantity</th>
												<th>Total</th>
											</thead>
											
											<tbody>
											
												<tr>
													<%
                                                        int sum=0;//총합계
														int q = 0;
                                                        List<Product>cartList=(List<Product>)session.getAttribute("cartlist");
                                                    if(cartList==null)
	                                                  cartList=new ArrayList<Product>();
                                               //상품리스트 하나씩 출력
                                                for(int i=0; i<cartList.size(); i++){
	                                                Product product = cartList.get(i);
	                                               int total=product.getUnitPrice()*product.getQuantity();
	                                               sum= sum+total;
	                                               q += product.getQuantity();
                                                    %>
                                                	<tr>
                                                    	<td><%=product.getPname() %></td>
                                                    	<td><%=product.getQuantity() %></td>
                                                    	<td><%=product.getUnitPrice() %></td>
                                                    </tr>
                                                 <%} %>
												<tr>
												
													<td class="text-black font-weight-bold"><strong>Order
															Total</strong></td>
													<td><strong><%=q %></strong></td>
													<td class="text-black font-weight-bold"><strong><%=new DecimalFormat("#,###").format(sum) %></strong></td>
												</tr>
											</tbody>
										</table>
										<div class="form-group">
											<button class="btn btn-primary btn-lg py-3 btn-block"
												onclick="return shipping()">Order completed</button>
												<script type="text/javascript">
												function shipping(){
													
													var i = document.getElementById("c_fname").value;
													
													if(i=='' || j==''){
														alert('정보를 입력해주세요');
														return false;
													}else{
														window.location='./processCheckOut.jsp';
													}	
												}
												</script>
										</div>

									</div>
								</div>
							</div>

						</div>
					</div>
				</form>
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
	<jsp:include page="../footer.jsp" />
</body>
</html>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function eMailChange() {
	    var found = null;
	    var sel = document.getElementById("mail3");
	    for(var i=0; i < sel.length; i++) {
	        if(sel[i].selected) {
	            found = sel[i];
	            break; 
	        }
	    }
	    
	    if(found.value == "etc") {
	    	document.getElementById("mail2").value = "";
	    	document.getElementById("mail2").focus();
	    } else {
		    document.getElementById("mail2").value = found.value;
	    }
	}
	
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>