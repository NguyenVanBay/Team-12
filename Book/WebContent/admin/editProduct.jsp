<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>


<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
	Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="include/head.jsp"></jsp:include>
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
			<div class="card">
				<div class="card-header">
					<strong>Thêm</strong> Sản phẩm
				</div>
				<div class="card-body card-block">
					<form action="/Book/admin/editProduct" method="post">

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Tên
									sản phẩm</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="name"
									value="<%=product.getName()%>" placeholder="Tên sản phẩm"
									class="form-control"> <small
									class="form-text text-muted">Nhập tên sản phẩm</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="selectSm" class=" form-control-label">Thể
									loại</label>
							</div>
							<div class="col-12 col-md-9">
								<select name="idCategory" id="SelectLm"
									class="form-control-sm form-control">
									<%
										for (Category c : categorys) {
									%>
									<option
										<%=(c.getId().equals(product.getCategory().getId())) ? "selected" : ""%>
										value="<%=c.getId()%>"><%=c.getName()%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Tác
									giả</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="author"
									value="<%=product.getAuthor()%>" placeholder="Tác giả"
									class="form-control"> <small
									class="form-text text-muted">Nhập tác giả</small>
							</div>
						</div>

						<%
							SimpleDateFormat format = new SimpleDateFormat("dd/MM/YYYY");
						%>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Thời
									gian xuất bản</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="date" id="text-input" name="publicAt"
									value="<%=format.format(product.getPublicAt())%>"
									placeholder="Giá tiền" class="form-control"> <small
									class="form-text text-muted"></small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Số
									lượng</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="password" name="count"
									value="<%=product.getCount()%>" placeholder="Số lượng"
									class="form-control"> <small
									class="form-text text-muted">Nhập Số lượng</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Giá
									tiền</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="price"
									value="<%=product.getPrice()%>" placeholder="Giá tiền"
									class="form-control"> <small
									class="form-text text-muted">Nhập giá tiền</small>
							</div>
						</div>

						<div class="card-footer">
							<button type="submit" class="btn btn-primary btn-sm">
								<i class="fa fa-dot-circle-o"></i> Submit
							</button>
							<button type="reset" class="btn btn-danger btn-sm">
								<i class="fa fa-ban"></i> Reset
							</button>
						</div>

					</form>
				</div>

			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>

	<jsp:include page="include/filejs.jsp"></jsp:include>

</body>

</html>
<!-- end document-->
