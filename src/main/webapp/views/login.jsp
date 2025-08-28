<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background: #f5f5f5;
        }
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 25px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        .remember-me {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Đăng nhập tài khoản</h2>

    <!-- Thông báo lỗi nếu có -->
    <c:if test="${alert != null}">
        <div class="alert alert-danger">${alert}</div>
    </c:if>

    <!-- Form đăng nhập -->
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="username">Tài khoản:</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Nhập tài khoản">
        </div>

        <div class="form-group">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu">
        </div>

        <div class="checkbox remember-me">
            <label>
                <input type="checkbox" name="remember"> Ghi nhớ đăng nhập
            </label>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
    </form>

    <hr>
    <p class="text-center">
        Chưa có tài khoản? 
        <a href="${pageContext.request.contextPath }/register">Đăng ký ngay</a>
    </p>
</div>

</body>
</html>
