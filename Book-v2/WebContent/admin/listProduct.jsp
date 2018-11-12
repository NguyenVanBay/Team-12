<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>

<%@page import="java.text.*"%>

<%

	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
ArrayList<Product> products = (ArrayList) request.getAttribute("products");

ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
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
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
	<!-- font awesome CSS
		============================================ -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/list.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Sản phẩm</h3>
				<a href="addProduct">Thêm sản phẩm</a>
			</div>

			<form action="/Book/admin/listProduct" method="get">

				<div class="row seach-content">
					<div class="form-group">
						<input name="name" type="text" value="<%= (request.getParameter("name") == "" || request.getParameter("name") == null) ? "" : request.getParameter("name") %>" placeholder="Tên sản phẩm">
					</div>
					<div class="form-group">
						<input name="author" type="text" value="<%= (request.getParameter("author") == "" || request.getParameter("author") == null) ? "" : request.getParameter("author") %>" placeholder="Tác giả">
					</div>
					<div class="form-group">
						<input name="title" type="text" value="<%= (request.getParameter("title") == "" || request.getParameter("title") == null) ? "" : request.getParameter("title") %>" placeholder="Tiêu đề">
					</div>

					<div class="form-group">
						<input name="priceFrom" type="text" value="<%= (request.getParameter("priceFrom") == "" || request.getParameter("priceFrom") == null) ? "" : request.getParameter("priceFrom") %>" class="form-control-sm form-control" placeholder="Giá từ">
					</div>

					<div class="form-group">
						<input name="priceTo" type="text" value="<%= (request.getParameter("priceTo") == "" || request.getParameter("priceTo") == null) ? "" : request.getParameter("priceTo") %>" class="form-control-sm form-control" placeholder="Giá đến">
					</div>

					<div class="form-group">
						<select name="idCategory" id="SelectLm" class="form-control">
								<option value="">Thể loại</option>
							<%
									for (Category c : categorys) {
								%>
							<option <%= (request.getParameter("idCategory") == c.getId() + "") ? "selected" : "" %> value="<%=c.getId()%>">
								<%=c.getName()%>
							</option>
							<%
									}
								%>
						</select>
					</div>

					<div class="form-group">
						<button class="btn btn-success btn-sm" type="submit">Tìm kiếm</button>
						
					</div>
				</div>
			</form>
		</div>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>id</th>
						<th>Tên sách</th>
						<th>Tác giả</th>
						<th>Năm xuất bản</th>
						<th>Số lượng</th>
						<th>Giá</th>
						<th>Loại</th>
						<th>Thể loại</th>
						<th>Giới thiệu</th>
						<th>Thumbnail</th>
						<th style="width: 140px;"></th>
					</tr>
				</thead>
				<tbody>

					<%
						for (Product p : products) {
					%>
					<tr class="tr-shadow">
						<td>
							<%= p.getId() %>
						</td>
						<td><span>
								<%= p.getName() %></span></td>
						<td>
							<%= p.getAuthor() %>
						</td>
						<td>
							<%= p.getPublicAt() %>
						</td>
						<td>
							<%= p.getCount() %>
						</td>
						<td>
							<%= formatter.format(p.getPrice()) %> VND</td>
						<td>
							<%
							if(p.getType().equals("sellMultiple")) {
								out.print("Bán chạy");
							} else if(p.getType().equals("new")) {
								out.print("Mới");
								
							} else if(p.getType().equals("hot")) {
								out.print("Hót");
							}
							
							%>
						</td>
						<td>
							<%= p.getCategory().getName() %>
						</td>
						<td>
							<%= p.getTitle() %>
						</td>
						<td><img class="img img-responsive" style="height: 150px;" src="/Book/admin/upload/<%= p.getThumbnail().getName() %>" /></td>
						<td>
							<div class="table-data-feature">
							<a href="detailProduct?id=<%=p.getId()%>" class="item tooltip">
									<span class="tooltiptext">Chi tiết sản phẩm</span>
									<i class="fa fa-taxi"></i>
								</a>
								<a href="editProduct?id=<%= p.getId() %>" class="item tooltip">
									<i class="fa fa-pencil-square"></i>
									<span class="tooltiptext">Sửa sản phẩm</span>
								</a>
								<a href="deleteProduct?id=<%= p.getId() %>" class="item tooltip">
									<i class="fa fa-recycle"></i>
									<span class="tooltiptext">Xóa sản phẩm</span>
								</a>
							</div>
						</td>
					</tr>

					<%
						}
					%>
					<tr class="spacer"></tr>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>