<%@page import="constant.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>
<%@page import="java.text.*"%>
<%
	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
%>

<%
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<style>
#nav {
	margin-right: 40px;
}

<
style>.mySlides1 {
	display: block;
}
</style>
</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<h3 style="text-align: center; color: red; font-size: 25px;">
		<%
		
			// thong bao.
			String checkout = (request.getParameter("checkout") == null) ? "" : request.getParameter("checkout");
			if (checkout.equals("success")) {
				out.print("Đặt hàng thành công ! Chúng tôi sẽ giao hàng cho bạn sớm nhất !");
			} else if(checkout.equals("error")) {
				out.print("Bạn chưa mua sản phẩm nào của cửa hàng !");
			}
		%>

	</h3>

	<!-- infomation -->
	<jsp:include page="include/infomation.jsp"></jsp:include>
	<!-- end infomation -->

	<!-- slider area -->
	<jsp:include page="include/menu.jsp"></jsp:include>
	<!-- end slide-area -->

	<div class="container">



		<!-- menu left -->
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<!-- end menu left -->

		<%
			SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
		%>


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
				<div class="product ">
					<div class="img-product view">
						<img class="image"
							src="${pageContext.request.contextPath}/admin/upload/<%= p.getThumbnail().getName() %>"
							alt="">
						<div class="overlay">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">
								<div class="text">
									<p>
										<%
											String title = p.getTitle();
													int maxLength = (title.length() < Constant.soLongChuMoTa) ? title.length() : Constant.soLongChuMoTa;
													String newtitle = title.substring(0, maxLength);

													out.print(newtitle + " ...");
										%>
									</p>
									<p
										style="color: white; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Tác giả : " + p.getAuthor()%></p>
									<p
										style="color: #fff; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Xuất bản " + format.format(p.getPublicAt())%></p>
								</div>
							</a>
						</div>
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">Chi
								tiết</a>
							<form action="${pageContext.request.contextPath}/cart"
								method="post">
								<input type="hidden" name="command" value="plus" /> <input
									type="hidden" name="productId" value="<%=p.getId()%>" />
								<button type="submit">Mua</button>
							</form>
						</div>

						<div class="price"><%=formatter.format(p.getPrice())%>
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
				<div class="product ">
					<div class="img-product view">
						<img class="image"
							src="${pageContext.request.contextPath}/admin/upload/<%= p.getThumbnail().getName() %>"
							alt="">
						<div class="overlay">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">
								<div class="text">
									<p>
										<%
											String title = p.getTitle();
													int maxLength = (title.length() < Constant.soLongChuMoTa) ? title.length() : Constant.soLongChuMoTa;
													String newtitle = title.substring(0, maxLength);

													out.print(newtitle + " ...");
										%>
									</p>
									<p
										style="color: white; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Tác giả : " + p.getAuthor()%></p>
									<p
										style="color: #fff; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Xuất bản " + format.format(p.getPublicAt())%></p>
								</div>
							</a>
						</div>
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">Chi
								tiết</a>
							<form action="${pageContext.request.contextPath}/cart"
								method="post">
								<input type="hidden" name="command" value="plus" /> <input
									type="hidden" name="productId" value="<%=p.getId()%>" />
								<button type="submit">Mua</button>
							</form>
						</div>
						<div class="price"><%=formatter.format(p.getPrice())%>
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
				<div class="product ">
					<div class="img-product view">
						<img class="image"
							src="${pageContext.request.contextPath}/admin/upload/<%= p.getThumbnail().getName() %>"
							alt="">
						<div class="overlay">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">
								<div class="text">
									<p>
										<%
											String title = p.getTitle();
													int maxLength = (title.length() < Constant.soLongChuMoTa) ? title.length() : Constant.soLongChuMoTa;
													String newtitle = title.substring(0, maxLength);

													out.print(newtitle + " ...");
										%>
									</p>
									<p
										style="color: white; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Tác giả : " + p.getAuthor()%></p>
									<p
										style="color: #fff; font-size: 15px; text-transform: uppercase; margin-top: 31px;"><%="Xuất bản " + format.format(p.getPublicAt())%></p>
								</div>
							</a>
						</div>
					</div>
					<div class="detail-product">
						<p><%=p.getName()%></p>
						<div class="btn-select">
							<a
								href="${pageContext.request.contextPath}/chi-tiet/<%= p.getUrl() %>-<%=p.getId()%>">Chi
								tiết</a>
							<form action="${pageContext.request.contextPath}/cart"
								method="post">
								<input type="hidden" name="command" value="plus" /> <input
									type="hidden" name="productId" value="<%=p.getId()%>" />
								<button type="submit">Mua</button>
							</form>
						</div>
						<div class="price"><%=formatter.format(p.getPrice())%>
							VND VND
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

</body>

</html>