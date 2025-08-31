<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Đăng ký tài khoản</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h2>Tạo tài khoản mới</h2>

		<!-- Hiển thị thông báo lỗi -->
		<c:if test="${alert != null}">
			<div class="alert alert-danger">${alert}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/register"
			method="post" class="form-horizontal">

			<!-- Username -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Tài khoản</label>
				<div class="col-sm-6">
					<input type="text" name="username" class="form-control"
						placeholder="Nhập tài khoản" value="${fn:escapeXml(username)}">
				</div>
			</div>

			<!-- Password -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Mật khẩu</label>
				<div class="col-sm-6">
					<input type="password" name="password" class="form-control"
						placeholder="Nhập mật khẩu" value="${fn:escapeXml(password)}">
				</div>
			</div>

			<!-- Email -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-6">
					<input type="email" name="email" class="form-control"
						placeholder="Nhập email" value="${fn:escapeXml(email)}">
				</div>
			</div>

			<!-- Fullname -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Họ và tên</label>
				<div class="col-sm-6">
					<input type="text" name="fullname" class="form-control"
						placeholder="Nhập họ tên" value="${fn:escapeXml(fullname)}">
				</div>
			</div>

			<!-- Phone -->
			<div class="form-group">
				<label class="col-sm-2 control-label">Số điện thoại</label>
				<div class="col-sm-6">
					<input type="text" name="phone" class="form-control"
						placeholder="Nhập số điện thoại" value="${fn:escapeXml(phone)}">
				</div>
			</div>

			<!-- Submit -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-6">
					<button type="submit" class="btn btn-primary">Đăng ký</button>
					<a href="${pageContext.request.contextPath}/login"
						class="btn btn-default">Đăng nhập</a>
				</div>
			</div>

		</form>
	</div>
</body>
</html>
