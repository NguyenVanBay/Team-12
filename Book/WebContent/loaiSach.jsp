<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>

<%
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");
%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>

<%
	Category category = (Category) request.getAttribute("category");
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
<link rel="stylesheet" href="css/home.css">

</head>

<body>


	<div id="header-top-area">
		<div class="language-area">
			<ul>
				<li id="language-pr"><img src="img/1.jpg" alt="flag"><a
					href="#">Việt Nam<i class="fa fa-angle-down"></i></a></li>
				<li id="currency-pr"><a href="#">Việt Nam VND<i
						class="fa fa-angle-down"></i></a></li>
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
	<!-- end menu area -->

	<div class="slider-area">
		<div class="slider-img">
			<div class="single-slider"></div>
		</div>
	</div>
	<!-- end slide-area -->

	<div class="infomation">
		<h3>Châm ngôn về sách</h3>
		<p>Người đọc quá nhiều và dùng tới bộ óc quá ít sẽ rơi vào thói
			quen suy nghĩ lười biếng.</p>
	</div>

	<div class="container">
		<div class="sidebar">
			<nav id="menu-sidebar">
				<ul id="nav-sidebar">
					<li id="danh-muc"><a href="#">Danh mục</a></li>

					<%
						for (Category c : categorys) {
					%>
					<li><a href="loai-sach?id=<%=c.getId()%>"><%=c.getName()%></a></li>
					<%
						}
					%>

				</ul>
			</nav>
		</div>



		<div class="content">
			<div class="banchay">

				<h3><%=category.getName()%></h3>

				<%
					for (Product p : products) {
				%>
				<div class="product view view-first">
					<div class="img-product">
						<img src="admin/upload/<%=p.getThumbnail().getName()%>" alt="">
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<a href="detail.html">Chi tiết</a><a href="cart.html">Mua</a>
						<div class="price"><%=p.getPrice()%>
							VND
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>

			<div class="quangcao">
				<img src="img/vanphong1.png" alt=""> <img
					src="img/vanphong2.jpg" alt="">
			</div>
		</div>
	</div>

	<footer>
		<div class="footer-top">
			<div class="footer-top-menu bb-2">
				<nav>
					<ul>
						<li><a href="#">home</a></li>
						<li><a href="#">Enable Cookies</a></li>
						<li><a href="#">Privacy and Cookie Policy</a></li>
						<li><a href="#">contact us</a></li>
						<li><a href="#">blog</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- end footer-top -->


		<div class="footer-mid">
			<div class="footer-description">
				<div class="simple-footer-bottom">
					<div class="footer-title">
						<h3>Products</h3>
					</div>

					<div>
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="#">Prices drop </a></li>
							<li><a href="#">New products</a></li>
							<li><a href="#">Best sales</a></li>
						</ul>
					</div>
				</div>

				<div class="simple-footer-bottom">
					<div class="footer-title">
						<h3>Products</h3>
					</div>

					<div>
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="#">Prices drop </a></li>
							<li><a href="#">New products</a></li>
							<li><a href="#">Best sales</a></li>
						</ul>
					</div>
				</div>

				<div class="simple-footer-bottom">
					<div class="footer-title">
						<h3>Products</h3>
					</div>

					<div>
						<ul>
							<li><a href="about.html">About us</a></li>
							<li><a href="#">Prices drop </a></li>
							<li><a href="#">New products</a></li>
							<li><a href="#">Best sales</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="footer-contact">
				<div class="footer-title">
					<h3>Thôn tin cửa hàng</h3>
				</div>

				<div class="footer-contact-detail">
					<p class="adress">
						<span>Địa chỉ</span> Nguyễn trãi hà đông hà nội
					</p>
					<p>
						<span>SDT :</span> (+1)866-540-3229
					</p>
					<p>
						<span>Email:</span> nguyenvanbay.no1@gmail.com
					</p>
				</div>
			</div>
			<!-- end footer-contact -->
		</div>
		<!-- footer-mid-end -->

		<div class="footer-bottom">
			<div class="copy-right-area">
				<p>
					Copyright ©<a href="#">Koparion</a>. All Right Reserved.
				</p>
			</div>
			<div class="payment-img text-right">
				<a href="#"><img src="img/1.png" alt="payment"></a>
			</div>
		</div>
		<!-- end footer-bottom -->
	</footer>

	<script src="js/my.js"></script>

</body>

</html>