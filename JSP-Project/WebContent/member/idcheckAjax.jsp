<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ page trimDirectiveWhitespaces="true" %>

<% String id = request.getParameter("id"); %>

<%--db접속 member 테이블에서 조회 --%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/SemiProject" user="root"
	password="1234" />

<%--조회 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
	select * from member where id=?
	<sql:param value="<%=id %>" />
</sql:query>

<%--회원 id가 존재하면 --%>
<c:forEach var="row" items="${resultSet.rows}">사용할 수 없는 아이디입니다.
</c:forEach>

<%--회원 id가 존재하지 않으면 --%>
<c:if test="${empty resultSet.rows}">사용가능한 아이디입니다.
</c:if>
