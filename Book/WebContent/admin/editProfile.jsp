<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.User"%>


<%
	User user = (User) request.getAttribute("user");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bài tập lớn nhóm 12</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet" href="css1/font-awesome.min.css">

<link rel="stylesheet" href="css1/style.css">
<link rel="stylesheet" href="css1/profile.css">
<link rel="stylesheet" href="css1/add.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Cập nhật thông tin cá nhân</h3>
			</div>
		</div>

		<form action="/Book/admin/profile" method="post">

			<input type="hidden" name="id" value="<%=user.getId()%>">

			<div class="form-group">
				<label for="text-input">Họ tên </label> <input type="text"
					name="name" value="<%=user.getName()%>" placeholder="Họ Tên">
			</div>

			<div class=" form-group">
				<label>email</label> <input type="text" name="email"
					value="<%=user.getEmail()%>" placeholder="Email">
			</div>

			<div class=" form-group">
				<label>Số điện thoại</label> <input type="text" id="text-input"
					name="phone" value="<%=user.getPhone()%>"
					placeholder="Số điện thoại">
			</div>

			<div class=" form-group">
				<label>Địa chỉ</label>
				<textarea name="address" placeholder="Địa chỉ..."><%=user.getAddress()%></textarea>
			</div>
			
			<div class=" form-group">
				<label>Xác nhận mật khẩu</label> <input type="password" name="password">
			</div>
			
			<div class="card-footer">
				<label></label>
				<button type="submit">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>
				<button type="reset">
					<i class="fa fa-ban"></i> Reset
				</button>
			</div>

		</form>
	</div>
</body>

</html>