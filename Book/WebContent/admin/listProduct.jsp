<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="include/head.jsp"></jsp:include>

	<%
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");

	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>

</head>

<body class="animsition">
	<div class="page-wrapper">

		<!-- MENU SIDEBAR-->
		<jsp:include page="include/menusidebar.jsp"></jsp:include>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="include/header.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="col-md-12">
				<!-- DATA TABLE -->

				<div class="bg-while">
					<h3>Sản phẩm</h3>
					<a href="addProduct">Add Product</a>
					<hr>

					<form action="/Book/admin/listProduct" method="get">

						<div class="row seach-content">
							<div class="col-md-3 form-group">
								<input name="name" class="form-control-sm form-control" value="<%= (request.getParameter("name") == "" || request.getParameter("name") == null) ? "" : request.getParameter("name") %>" placeholder="Tên sản phẩm">
							</div>
							<div class="col-md-3 form-group">
								<input name="author" type="text" class="form-control-sm form-control" value="<%= (request.getParameter("author") == "" || request.getParameter("author") == null) ? "" : request.getParameter("author") %>" placeholder="Tác giả">
							</div>
							<div class="col-md-3 form-group">
								<input name="title" type="text" class="form-control-sm form-control" value="<%= (request.getParameter("title") == "" || request.getParameter("title") == null) ? "" : request.getParameter("title") %>" placeholder="Tiêu đề">
							</div>

							<div class="col-md-3 form-group">
								<input name="priceFrom" type="text" value="<%= (request.getParameter("priceFrom") == "" || request.getParameter("priceFrom") == null) ? "" : request.getParameter("priceFrom") %>" class="form-control-sm form-control" placeholder="Giá từ">
							</div>

							<div class="col-md-3 form-group">
								<input name="priceTo" type="text" value="<%= (request.getParameter("priceTo") == "" || request.getParameter("priceTo") == null) ? "" : request.getParameter("priceTo") %>" class="form-control-sm form-control" placeholder="Giá đến">
							</div>

							<div class="col-md-3 form-group">
								<select name="idCategory" id="SelectLm" class="form-control-sm form-control">
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

							<div class="col-md-4 form-group">
								<button class="col-sm-offset-8 btn btn-success btn-sm" type="submit">Tìm kiếm</button>
							</div>


						</div>
					</form>
				</div>

				<div class="table-responsive table-responsive-data2">
					<table class="table table-data2">
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
								<th></th>
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
									<%= p.getPrice() %> VND</td>
								<td>
									<%= p.getType() %>
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
										<a href="editProduct?id=<%= p.getId() %>" class="item" data-toggle="tooltip" data-placement="top" title=""
										 data-original-title="Sửa">
											<i class="zmdi zmdi-edit"></i>
										</a>
										<a href="deleteProduct?id=<%= p.getId() %>" class="item" data-toggle="tooltip" data-placement="top" title=""
										 data-original-title="xóa">
											<i class="zmdi zmdi-delete"></i>
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
				<!-- END DATA TABLE -->
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>

	<jsp:include page="include/filejs.jsp"></jsp:include>

</body>

</html>
<!-- end document-->