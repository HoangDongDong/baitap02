<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lại mật khẩu</title>
</head>
<body>
	<h2>Đặt lại mật khẩu</h2>
	<c:if test="${not empty alert}">
		<p style="color: red">${alert}</p>
	</c:if>
	<c:if test="${not empty info}">
		<p style="color: green">${info}</p>
	</c:if>
	<form method="post" action="${pageContext.request.contextPath}/reset">
		<label>OTP (6 số):</label><input type="text" name="otp" /><br /> <label>Mật
			khẩu mới:</label><input type="password" name="password" /><br /> <label>Nhập
			lại mật khẩu:</label><input type="password" name="confirm" /><br />
		<button type="submit">Cập nhật</button>
	</form>
	<p>
		<a href="${pageContext.request.contextPath}/login">Quay lại đăng
			nhập</a>
	</p>
</body>
</html>