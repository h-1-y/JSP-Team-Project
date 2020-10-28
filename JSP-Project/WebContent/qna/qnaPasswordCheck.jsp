<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String qnaNum = request.getParameter("qnaNum"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style=" padding: 5px 10px 5px 10px;">
	<h1 style="text-align: center;">Pwd Check :D</h1>
	<hr>
	<p style="text-align: center;"><b><%= qnaNum %></b> 는 이미 사용중인 Id 입니다!<br>
	<input type="button" value="확인" class="btn btn-primary" style="margin-top: 20px;"
	onclick = "opener.document.newMember.id.focus(); opener.document.newMember.id.value=''; window.close();">
</div>

</body>
</html>