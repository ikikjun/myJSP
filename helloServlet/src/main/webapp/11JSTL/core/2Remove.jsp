<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 변수 선언 -->
	<c:set var="scopeVar" value="page Value" /> <!-- 스코프를 지정하지 않으면 page 영역 -->
	<c:set var="scopeVar" value="Request Value" scope="request" />
	<c:set var="scopeVar" value="Session Value" scope="session" />
	<c:set var="scopeVar" value="Application Value" scope="application" />

<h4>출력하기</h4>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>

<%
	/* 아래와 같은 방식으로 진행하는것임
	request.getAttribute(name);
	request.setAttribute(name);
	request.removeAttribute(name);
	*/
%>


<h4>seesion 영역에서 삭제하기</h4>
	<c:remove var="scopeVar" scope="session" />
	
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>

<!-- 영역을 지정하지 않고 삭제하기 : 모든 영역에서 변수를 삭제 합니다. -->
	<c:remove var ="scopeVar" />
	
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
	</ul>

</body>
</html>