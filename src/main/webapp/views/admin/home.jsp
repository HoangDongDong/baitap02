<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%
    User u = (User) session.getAttribute("account");
    if (u == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Home</title>
</head>
<body>
  <%@ include file="../topbar.jsp" %>
  <h1>Admin Dashboard</h1>
  <p>Xin chào, <b><%= u.getUserName() %></b> (roleid=<%= u.getRoleid() %>)</p>

  <ul>
    <li><a href="<%=request.getContextPath()%>/admin/home">Trang chủ Admin</a></li>
    <!-- Thêm menu quản trị tại đây -->
  </ul>
</body>
</html>