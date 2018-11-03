<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>

<%
	Product product = (Product) request.getAttribute("product");
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>
<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/details.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

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
			<div class="detail-product">
				<div class="detail-img">
					<img class="img img-responsive"
						src="/Book/admin/upload/<%=product.getThumbnail().getName()%>" />
					<hr>
					<%
						for (Image i : product.getListImage()) {
					%>
					<img class="img img-responsive"
						style="height: 150px; width: auto; margin-right: 15px; margin-top: 15px;"
						src="/Book/admin/upload/<%=i.getName()%>" />
					<%
						}
					%>
				</div>
				<div class="details">
					<h3><%=product.getName()%></h3>
					<a href=""><%=product.getCategory().getName()%></a>
					<p><%=product.getPrice()%>
						VND
					</p>

					<%
						SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
					%>

					<p><%=format.format(product.getPublicAt())%></p>
					<p><%=product.getTitle()%></p>
					<p><%=product.getDescription()%></p>
					
					<form action="/Book/cart" method="post">
					<label>Số lượng</label>
						<input type="hidden" name="command" value="plus" />
						<input type="hidden" name="productId" value="<%=product.getId()%>" />
						<input type="text" required name="count"/>
						<button type="submit">Mua</button>
					</form>


				</div>
			</div>
		</div>
	</div>

	<!-- menu top -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end menu top -->


	<script src="js/my.js"></script>
</body>

</html>