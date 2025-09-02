<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.account == null}">
		<a href="${pageContext.request.contextPath }/login">Đăng nhập</a> | 
        <a href="${pageContext.request.contextPath }/register">Đăng
			ký</a>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath }/member/myaccount">
			${sessionScope.account.fullName} </a> | 
        <a href="${pageContext.request.contextPath }/logout">Đăng Xuất </a>
	</c:otherwise>
</c:choose>