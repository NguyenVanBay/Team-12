<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>

<%
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/home.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	

	<!-- infomation -->
	<jsp:include page="include/infomation.jsp"></jsp:include>
	<!-- end infomation -->



	<div class="container">
	
	

		<!-- menu left -->
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<!-- end menu left -->



		<div class="content">
		
		<!-- slider area -->
	<jsp:include page="include/slide.jsp"></jsp:include>
	<!-- end slide-area -->
		
			<div class="banchay">

				<h3>Sản phẩm nổi bật</h3>

				<%
					for (Product p : products) {
						if (p.getType().equals("hot")) {
				%>
				<div class="product view view-first">
					<div class="img-product">
						<img src="admin/upload/<%=p.getThumbnail().getName()%>" alt="">
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a href="/Book/chi-tiet-san-pham?id=<%=p.getId()%>">Chi
								tiết sản phẩm</a>
							<form action="/Book/cart" method="post">
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
					}
				%>
			</div>

			<!-- infomation -->
			<jsp:include page="include/quangcao.jsp"></jsp:include>
			<!-- end infomation -->


			<div class="banchay">

				<h3>Sản phẩm mới</h3>
				<%
					for (Product p : products) {
						if (p.getType().equals("new")) {
				%>
				<div class="product view view-first">
					<div class="img-product">
						<img src="admin/upload/<%=p.getThumbnail().getName()%>" alt="">
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a href="/Book/chi-tiet-san-pham?id=<%=p.getId()%>">Chi
								tiết sản phẩm</a>
							<form action="/Book/cart" method="post">
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
					}
				%>
			</div>

			<!-- infomation -->
			<jsp:include page="include/quangcao.jsp"></jsp:include>
			<!-- end infomation -->

			<div class="banchay">

				<h3>Bán chạy</h3>

				<%
					for (Product p : products) {
						if (p.getType().equals("sellMultiple")) {
				%>
				<div class="product view view-first">
					<div class="img-product">
						<img src="admin/upload/<%=p.getThumbnail().getName()%>" alt="">
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a href="/Book/chi-tiet-san-pham?id=<%=p.getId()%>">Chi
								tiết sản phẩm</a>
							<form action="/Book/cart" method="post">
								<input type="hidden" name="command" value="plus" />
								<input
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
					}
				%>
			</div>
		</div>

	</div>

	<!-- menu top -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end menu top -->

	<script src="js/my.js"></script>

</body>

</html>