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
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");
%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/login.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<div class="container" style="margin: 50px;">
		<div class="form" >
			<h3>Đăng nhập</h3>
			
			<% if(request.getAttribute("errorLoginUser") != null) {
				%>
				<p style="color: red">Đăng nhập không thành công</p>
				<%
			} %>
			
			<form action="/Book/dang-nhap-dang-ki" method="post">
				<input type="hidden" name="type" value="login" />
				<div class="list-form">
					<div class="form-group">
						<label for="">Email</label> <input type="text" name="email"
							value="" placeholder="email">
					</div>


					<div class="form-group">
						<label for="">Password</label> <input type="password"
							name="password" value="" placeholder="password">
					</div>


					<div class="form-group">
						<button type="submit">Đăng nhập</button>
					</div>
				</div>
			</form>
		</div>


		<div class="form">
			<h3>Đăng kí</h3>
			<form action="/Book/dang-nhap-dang-ki" method="post">
				<input type="hidden" name="type" value="register" />
				<div class="list-form">
					
					<div class="form-group">
						<label for="">Tên</label> <input type="text" name="name"
							value="" placeholder="name">
					</div>
					
					<div class="form-group">
						<label for="">Email</label> <input type="text" name="email"
							value="" placeholder="email">
					</div>


					<div class="form-group">
						<label for="">Password</label> <input type="password"
							name="password" value="" placeholder="password">
					</div>

					<div class="form-group">
						<label for="">Re Password</label> <input type="password"
							name="repassword" value="" placeholder="re password">
					</div>

					<div class="form-group">
						<label for="">SDT</label> <input type="text" name="phone" value=""
							placeholder="số điện thoại">
					</div>

					<div class="form-group">
						<label for="">Địa chỉ</label> <input type="text" name="address"
							value="" placeholder="địa chỉ">
					</div>


					<div class="form-group">
						<button type="submit">Đăng kí</button>
					</div>
				</div>
			</form>
		</div>

	</div>

	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end footer -->

	<script src="js/my.js"></script>

</body>

</html>