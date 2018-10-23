<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>
<%@page import="model.Cart"%>
<%@page import="model.Item"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>

<%
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Bài tập lớn nhóm 12</title>
	<link href="font/css/fontawesome.css" rel="stylesheet">
	<link href="font/css/brands.css" rel="stylesheet">
	<link href="font/css/solid.css" rel="stylesheet">

	<!-- mystyle -->
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/style_pc.css">
	<link rel="stylesheet" href="css/style_mobile.css">
	<link rel="stylesheet" href="css/checkout.css">

</head>

<body>


	<div id="header-top-area">
		<div class="language-area">
			<ul>
				<li id="language-pr"><img src="img/1.jpg" alt="flag"><a href="#">Việt Nam<i class="fa fa-angle-down"></i></a></li>
				<li id="currency-pr"><a href="#">Việt Nam VND<i class="fa fa-angle-down"></i></a></li>
			</ul>
		</div>

		<div class="account-area">
			<ul>
				<li><a href="register.html">Tài khoản</a></li>
				<li><a href="checkout.html">Đăng nhập</a></li>
				<li><a href="login.html">Đăng kí</a></li>
				<li><a href="login.html">Xem giỏ hàng</a></li>
			</ul>
		</div>
	</div>
	<!-- end header-top-area -->

	<div class="menu-area">
		<nav id="menu">
			<ul id="nav">
				<li><a href="index.html">Trang chủ</a></li>

				<li><a href="index.html">Tin tức</a></li>


				<li><a href="index.html">Giới thiệu</a></li>


				<li><a href="index.html">Liên hệ</a></li>
			</ul>
		</nav>
	</div>

	<div class="infomation">
		<h3>Check out</h3>
	</div>
	<div class="container">

		<div class="list-product">



			<form action="/Book/Checkout" method="post">
				<div class="input-group">
					<label for="">Nhập tên khách hàng </label>
					<input type="text" name="customer" />
				</div>

				<div class="input-group">
					<label for="">Nhập địa chỉ nhận hàng</label>
					<input type="text" name="address" />
				</div>

				<div class="input-group">
					<label for="">Nhập sdt liên hệ</label>
					<input type="text" name="phone" />
				</div>

				<button type="submit">CheckOut</button>
			</form>

		</div>

	</div>
	<script src="js/my.js"></script>

</body>

</html>