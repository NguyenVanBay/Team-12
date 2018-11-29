<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Image"%>

<%@page import="java.text.*"%>

<%
	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
	Product product = (Product) request.getAttribute("product");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/list.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<h3>
				Chi tiết sản phẩm :
				<%=product.getName()%></h3>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table">
			<tbody>
				<tr>
					<th>Tên sách</th>
					<td><%=product.getName()%></td>
				</tr>

				<tr>
					<th>Đường dẫn</th>
					<td><%=product.getUrl()%></td>
				</tr>

				<tr>

					<th>Tác giả</th>
					<td><%=product.getAuthor()%></td>
				</tr>

				<tr>

					<th>Năm xuất bản</th>
					<td><%=product.getPublicAt()%></td>
				</tr>

				<tr>

					<th>Số lượng</th>
					<td><%=product.getCount()%></td>
				</tr>

				<tr>

					<th>Giá (VND)</th>
					<td><%=formatter.format(product.getPrice()) + " VND"%></td>
				</tr>

				<tr>

					<th>Tiêu đề</th>
					<td><%=product.getTitle()%></td>
				</tr>

				<tr>

					<th>Chi tiết</th>
					<td><%=product.getDescription()%></td>
				</tr>

				<tr>

					<th>Loại</th>
					<td><%=product.getCategory().getName()%></td>
				</tr>

				<tr>

					<th>Thumbnail</th>
					<td><img class="img img-responsive" style="height: 150px;"
						src="/Book/admin/upload/<%=product.getThumbnail().getName()%>" /></td>
				</tr>

				<tr>

					<th>Ảnh sản phẩm</th>
					<td>
						<%
							for (Image i : product.getListImage()) {
						%> <img class="img img-responsive"
						style="height: 150px; width: auto; margin-right: 15px; margin-top: 15px;"
						src="/Book/admin/upload/<%=i.getName()%>" /> <%
 	}
 %>
					</td>
				</tr>

			</tbody>
		</table>

	</div>

	

</body>

</html>