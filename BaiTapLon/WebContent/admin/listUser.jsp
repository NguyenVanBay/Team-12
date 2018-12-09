<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Bai tap lơn web tin tức</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<div class="container">

		<div class="menu">
			<p>Xin chào A</p>
			<a href="${pageContext.request.contextPath}/admin/Login?type=logout">Logout</a>
		</div>

		<div class="box">
			<%@ include file="/admin/include/menu.jsp" %>

			<div class="content">
				<div class="btn-menu">
					<h2>Danh sách nhân viên</h2>
					<a href="${pageContext.request.contextPath}/admin/user?action=add">Thêm</a>
				</div>

				<table>
					<tr>
						<th>Mã</th>
						<th>Tên</th>
						<th>Email</th>
						<th style="width: 100px;"></th>
						
					</tr>

<% ArrayList<User> users = (ArrayList)request.getAttribute("users"); 

for (User u : users) {
	%>
	<tr>
	<td><%= u.getPk_user_id() %></td>
	<td><%= u.getC_fullname() %></td>
	<td><%= u.getC_email() %></td>
	<td ><a href="${pageContext.request.contextPath}/admin/user?action=edit&id=<%= u.getPk_user_id() %>">Sửa</a>
	
	<a href="${pageContext.request.contextPath}/admin/user?action=delete&id=<%= u.getPk_user_id() %>">Xóa</a>
	
	</td>
	</tr>
	<%
}
%>

					
				</table>
			</div>
		</div>

	</div>

</body>

</html>