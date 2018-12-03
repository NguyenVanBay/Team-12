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
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*"%>


<%
	ArrayList<Product> listProductSugerencias = (ArrayList) request.getAttribute("listProductSugerencias");
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


	<!-- slider area -->
	<jsp:include page="include/menu.jsp"></jsp:include>
	<!-- end slide-area -->


	<div class="infomation">
		<h3>Giỏ hàng</h3>
	</div>


	<div class="container">

		<div class="list-product">
			<form id="formCart" action="/Book/cart" method="post">
				<input type="hidden" name="command" value="edit" />
				<table>
					<tr>
						<td>Ảnh</td>
						<td>Số lượng</td>
						<td>Giá</td>
						<td></td>
					</tr>

					<%
						DecimalFormat formatter = new DecimalFormat("###,###,###.00");

						for (Item i : listItem) {
					%>

					<tr>
						<td><img
							src="${pageContext.request.contextPath}/admin/upload/<%=i.getProduct().getThumbnail().getName()%>"
							alt=""></td>
						<td><input name="soLuong<%=i.getProduct().getId()%>"
							value="<%=i.getQuantity()%>" /></td>
						<td style="color: red"><%=formatter.format(i.getProduct().getPrice())%>
							VND</td>
						<td><a
							href="${pageContext.request.contextPath}/cart?command=remove&productId=<%= i.getProduct().getId() %>">Xóa</a></td>
					</tr>

					<%
						}
					%>
				</table>
			</form>

			<button id="updateCart">Cập nhật giỏ hàng</button>
			<form id="checkout" action="/Book/Checkout" method="get">
				<button id="checkout-btn" type="submit">CheckOut</button>
			</form>

			<script>
				var form = document.getElementById("formCart");

				document.getElementById("updateCart").addEventListener("click",
						function() {
							form.submit();
						});
			</script>

		</div>

		<div class="spTuongTu">

			<h3 style="margin-bottom: 20px; text-transform: uppercase;">Sản
				phẩm tương tự</h3>

			<%
				for (Product product : listProductSugerencias) {
			%>
			<div class="product">

				<div class="detail-product"
					style="overflow: hidden; margin-bottom: 20px;">
					<img style="width: 100px; float: left; margin-right: 20px;"
						src="${pageContext.request.contextPath}/admin/upload/<%= product.getThumbnail().getName() %>"
						alt=""><a
						href="${pageContext.request.contextPath}/chi-tiet/<%= product.getUrl() + "-" + product.getId() %>">Chi
						tiết</a>
					<p><%=product.getPrice()%>
						VND
					</p>
					<p><%=product.getName()%></p>
				</div>
			</div>
			<%
				}
			%>

		</div>

	</div>

	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end footer -->

</body>

</html>