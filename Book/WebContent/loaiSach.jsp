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

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/home.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<!-- slider area -->
	<jsp:include page="include/slide.jsp"></jsp:include>
	<!-- end slide-area -->

	<!-- infomation -->
	<jsp:include page="include/infomation.jsp"></jsp:include>
	<!-- end infomation -->

	<div class="container">


		<!-- menu left -->
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
		<!-- end menu left -->



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
						<div class="btn-select">
							<form action="/Book/chi-tiet-san-pham" method="post">
								<input type="hidden" name="command" value="list" /> <input
									type="hidden" name="productId" value="<%=p.getId()%>" />
								<button type="submit">Chi tiết</button>
							</form>
							<form action="/Book/add-to-cart" method="post">
								<input type="hidden" name="command" value="plus" /> <input
									type="hidden" name="productId" value="<%=p.getId()%>" />
								<button type="submit">Mua</button>
							</form>
						</div>
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