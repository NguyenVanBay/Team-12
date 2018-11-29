<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.User"%>


<%
	User users = (User) request.getAttribute("user");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/profile.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Thông tin cá nhân</h3>
				<a href="/Book/admin/profile?type=edit">Cập nhật thông tin cá nhân</a>
			</div>
			<div class="profile">
				<h1>Nhân viên : <%=users.getName()%></h1>
				<p class="title">Email : <%=users.getEmail()%></p>
				<p>SDT : <%=users.getPhone()%></p>
				<p>Địa chỉ : <%=users.getAddress()%></p>
				<p> Chức vụ :
					<%
						if (users.getRole() == 4) {
							out.print("Giám đốc");
						} else if (users.getRole() == 1) {
							out.print("Quản lý nhân viên");
						} else if (users.getRole() == 2) {
							out.print("Quản lý sản phẩm");
						} else {
							out.print("Quản lý đơn hàng");
						}
					%>
				</p>
			</div>
		</div>
</body>

</html>