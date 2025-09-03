<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quên mật khẩu</title>
</head>
<body>
	<h2>Quên mật khẩu</h2>
	<c:if test="${not empty alert}">
		<p style="color: red">${alert}</p>
	</c:if>
	<form method="post" action="${pageContext.request.contextPath}/forgot">
		<label>Username:</label><input type="text" name="username" /><br /> <label>Email:</label><input
			type="email" name="email" /><br />
		<button type="submit">Gửi mã OTP</button>
	</form>
	<p>
		<a href="${pageContext.request.contextPath}/login">Quay lại đăng
			nhập</a>
	</p>
</body>
</html>