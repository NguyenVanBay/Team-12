<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
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
					<form action="/Book/admin/addProduct" method="post"
						enctype="multipart/form-data">

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Tên
									sản phẩm</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="name"
									placeholder="Tên sản phẩm" class="form-control"> <small
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
									<option value="<%=c.getId()%>"><%=c.getName()%></option>
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
									placeholder="Tác giả" class="form-control"> <small
									class="form-text text-muted">Nhập tác giả</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Thời
									gian xuất bản</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="date" id="text-input" name="publicAt"
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
									placeholder="Số lượng" class="form-control"> <small
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
									placeholder="Giá tiền" class="form-control"> <small
									class="form-text text-muted">Nhập giá tiền</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Giới
									thiệu</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="title"
									placeholder="Giới thiệu tổng quan" class="form-control">
								<small class="form-text text-muted">Giới thiệu sách</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="textarea-input" class=" form-control-label">Mô
									tả</label>
							</div>
							<div class="col-12 col-md-9">
								<textarea name="description" id="textarea-input" rows="9"
									placeholder="Mô tả" class="form-control"></textarea>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="select" class=" form-control-label">Sản phẩm</label>
							</div>
							<div class="col-12 col-md-9">
								<select name="type" id="select" class="form-control">
									<option value="new">Mới</option>
									<option value="hot">Nổi bật</option>
									<option value="sellMultiple">Bán chạy</option>
								</select>
							</div>
						</div>


						<div class="row form-group">
							<div class="col col-md-3">
								<label for="file-input" class=" form-control-label">Ảnh
									thumbnail</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="file" id="file-input" name="thubnail"
									class="form-control-file">
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="file-input" class=" form-control-label">Ảnh
									1</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="file" id="file-input" name="image1"
									class="form-control-file">
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="file-input" class=" form-control-label">Ảnh
									2</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="file" id="file-input" name="image2"
									class="form-control-file">
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="file-input" class=" form-control-label">Ảnh
									3</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="file" id="file-input" name="image3"
									class="form-control-file">
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
