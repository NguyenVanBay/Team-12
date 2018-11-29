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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<!-- slider area -->
	<jsp:include page="include/menu.jsp"></jsp:include>
	<!-- end slide-area -->



	<div class="container">

		<!-- menu left -->
		<jsp:include page="include/sidebar.jsp"></jsp:include>
		<!-- end menu left -->



		<div class="content">

			<div class="detail-product">


				<div class="w3-content w3-display-container">
					<div class="list-detail-img">
						<img class="mySlides" style="width: 100%"
							src="${pageContext.request.contextPath}/admin/upload/<%=product.getThumbnail().getName()%>" />
						<%
							for (Image i : product.getListImage()) {
						%>
						<img class="mySlides" style="width: 100%"
							src="${pageContext.request.contextPath}/admin/upload/<%=i.getName()%>" />
						<%
							}
						%>
					</div>
					<div class="btn-img">
						<button class="w3-button w3-black w3-display-left"
							onclick="plusDivs(-1)">&#10094;</button>
						<button class="w3-button w3-black w3-display-right"
							onclick="plusDivs(1)">&#10095;</button>
					</div>
				</div>

				<script>
					var slideIndex = 1;
					showDivs(slideIndex);

					function plusDivs(n) {
						showDivs(slideIndex += n);
					}

					function showDivs(n) {
						var i;
						var x = document.getElementsByClassName("mySlides");
						if (n > x.length) {
							slideIndex = 1
						}
						if (n < 1) {
							slideIndex = x.length
						}
						for (i = 0; i < x.length; i++) {
							x[i].style.display = "none";
						}
						x[slideIndex - 1].style.display = "block";
					}
				</script>


				<div class="details">
					<h3><%=product.getName()%></h3>
					<a href=""><%=product.getCategory().getName()%> : Tác giả <%= product.getAuthor() %></a>
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
						<label>Số lượng</label> <input type="hidden" name="command"
							value="plus" /> <input type="hidden" name="productId"
							value="<%=product.getId()%>" /> <input type="text" required
							name="count" />
						<button type="submit">Mua</button>
					</form>


				</div>
			</div>
		</div>
	</div>

	<!-- menu top -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end menu top -->

</body>

</html>