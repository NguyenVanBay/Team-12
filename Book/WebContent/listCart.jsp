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

	ArrayList<Item> listItem = (ArrayList) request.getAttribute("listItem");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/cart.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<div class="infomation">
		<h3>Giỏ hàng</h3>
	</div>
	<div class="container">

		<div class="list-product">

			<table>
				<tr>
					<td>Ảnh</td>
					<td>Số lượng</td>
					<td>Giá</td>
					<td></td>
				</tr>

				<%
					for (Item i : listItem) {
				%>
				<form action="/Book/UpdateCart" method="post">
				<tr>
					<td><img
						src="/Book/admin/upload/<%=i.getProduct().getThumbnail().getName()%>"
						alt=""></td>
					<td><%=i.getQuantity()%></td>
					<td><%=i.getProduct().getPrice()%></td>
					<td>
						
							<button type="submit">update</button>
					</td>
					
					<td>
							<button type="submit">update</button>
						
					</td>
				</tr>
				</form>
				<%
					}
				%>
			</table>

			<form action="/Book/Checkout" method="get">
				<button type="submit">CheckOut</button>
			</form>

		</div>

	</div>
	
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end footer -->
	
	<script src="js/my.js"></script>

</body>

</html>