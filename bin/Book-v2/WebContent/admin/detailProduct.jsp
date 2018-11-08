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
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bài tập lớn nhóm 12</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet" href="css1/font-awesome.min.css">

<link rel="stylesheet" href="css1/style.css">
<link rel="stylesheet" href="css1/list.css">
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
					<td><%=formatter.format(product.getPrice()) + " VND" %></td>
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

				<tr>













				</tr>
			</tbody>
		</table>
	</div>
	</div>
</body>

</html>