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
<jsp:include page="include/head.jsp"></jsp:include>

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
				<a href="product?action=add">Thêm sản phẩm</a>
			</div>

			<form action="/Book/admin/product" method="get">
				<input type="hidden" name="action" value="list" />
				<div class="row seach-content">
					<div class="form-group">
					<label>Tên sách</label>
						<input name="name" type="text"
							value="<%=(request.getParameter("name") == "" || request.getParameter("name") == null)
					? ""
					: request.getParameter("name")%>">
					</div>
					<div class="form-group">
					<label>Tác giả</label>
						<input name="author" type="text"
							value="<%=(request.getParameter("author") == "" || request.getParameter("author") == null)
					? ""
					: request.getParameter("author")%>">
					</div>
					<div class="form-group">
					<label>Tiêu đề</label>
						<input name="title" type="text"
							value="<%=(request.getParameter("title") == "" || request.getParameter("title") == null)
					? ""
					: request.getParameter("title")%>">
					</div>

					<div class="form-group">
					<label>Giá từ</label>
						<input name="priceFrom" type="text"
							value="<%=(request.getParameter("priceFrom") == "" || request.getParameter("priceFrom") == null) ? ""
					: request.getParameter("priceFrom")%>"
							class="form-control-sm form-control">
					</div>


					<div class="form-group">
					<label>Giá đến</label>
						<input name="priceTo" id="priceTo" type="text"
							value="<%=(request.getParameter("priceTo") == "" || request.getParameter("priceTo") == null) ? ""
					: request.getParameter("priceTo")%>"
							class="form-control-sm form-control">
					</div>

					<div class="form-group">
					<label>Xuất bản từ</label>
						<input name="publicFrom" type="date"
							value="<%=(request.getParameter("publicFrom") == "" || request.getParameter("publicFrom") == null) ? ""
					: request.getParameter("publicFrom")%>"
							class="form-control-sm form-control">
					</div>

					<div class="form-group">
					<label>Xuất bản đến</label>
						<input name="publicTo" type="date"
							value="<%=(request.getParameter("publicTo") == "" || request.getParameter("publicTo") == null) ? ""
					: request.getParameter("publicTo")%>"
							class="form-control-sm form-control" >
					</div>

					<div class="form-group">
					<label>Thể loại</label>
						<select name="idCategory" id="SelectLm" class="form-control">
							<option value="">Thể loại</option>
							<%
								for (Category c : categorys) {
							%>
							<option
								<%=(c.getId().toString().equals(request.getParameter("idCategory"))) ? "selected" : ""%>
								value="<%=c.getId()%>">
								<%=c.getName()%>
							</option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group">
						<button class="btn btn-success btn-sm" type="submit">Tìm
							kiếm</button>

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
						SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
					%>

					<%
						for (Product p : products) {
					%>
					<tr class="tr-shadow">
						<td><%=p.getId()%></td>
						<td><span> <%=p.getName()%></span></td>
						<td><%=p.getAuthor()%></td>
						<td><%=format.format(p.getPublicAt())%></td>
						<td><%=p.getCount()%></td>
						<td><%=formatter.format(p.getPrice())%> VND</td>
						<td>
							<%
								if (p.getType().equals("sellMultiple")) {
										out.print("Bán chạy");
									} else if (p.getType().equals("new")) {
										out.print("Mới");

									} else if (p.getType().equals("hot")) {
										out.print("Hót");
									}
							%>
						</td>
						<td><%=p.getCategory().getName()%></td>
						<td><%=p.getTitle()%></td>
						<td><img class="img img-responsive" style="height: 150px;"
							src="/Book/admin/upload/<%=p.getThumbnail().getName()%>" /></td>
						<td>
							<div class="table-data-feature">
								<a href="product?action=detail&id=<%=p.getId()%>"
									class="item tooltip"> <span class="tooltiptext">Chi
										tiết sản phẩm</span> <i class="fa fa-taxi"></i>
								</a> <a href="product?action=edit&id=<%=p.getId()%>"
									class="item tooltip"> <i class="fa fa-pencil-square"></i> <span
									class="tooltiptext">Sửa sản phẩm</span>
								</a> <a href="product?action=delete&id=<%=p.getId()%>" onclick="return confirm('Bạn có muốn thực sự muốn xoá không')"
									class="item tooltip"> <i class="fa fa-recycle"></i> <span
									class="tooltiptext">Xóa sản phẩm</span>
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