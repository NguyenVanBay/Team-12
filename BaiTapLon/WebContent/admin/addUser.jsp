<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
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
			<%@ include file="/admin/include/menu.jsp"%>

			<div class="content">
				<div class="btn-menu">
					<h2>Thêm thể loại</h2>
				</div>


				<form
					action="${pageContext.request.contextPath}/admin/user?action=add"
					method="post">
					fullName
					<input name="fullName" />
					Email
					<input name="email" />
					Pass
					<input name="pass" />
					Re pass
					<input name="repass" /><input
						type="submit" />
				</form>

			</div>
		</div>

	</div>

</body>

</html>