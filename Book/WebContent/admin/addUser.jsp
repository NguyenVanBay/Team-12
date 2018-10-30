<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<strong>Thêm</strong> User
				</div>
				<div class="card-body card-block">
					<form action="/Book/admin/addUser" method="post">

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Họ
									tên </label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="name" placeholder="Họ Tên" class="form-control"> <small class="form-text text-muted">Nhập
									họ tên</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="selectSm" class=" form-control-label">Chức vụ</label>
							</div>
							<div class="col-12 col-md-9">
								<select name="role" id="SelectLm" class="form-control-sm form-control">

									<option value="4">Giám đốc</option>
									<option value="1">Quản lý nhân viên</option>
									<option value="2">Quản lý sản phẩm</option>
									<option value="3">Quản lý đơn hàng</option>

								</select>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">email</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="email" placeholder="Email" class="form-control"> <small class="form-text text-muted">Nhập
									email</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Mật
									khẩu</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="password" id="password" name="password" placeholder="Mật khẩu" class="form-control"> <small class="form-text text-muted">Nhập
									mật khẩu</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Nhập
									lại mật khẩu</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="password" id="text-input" name="re-password" placeholder="Nhập lại mật khẩu" class="form-control">
								<small class="form-text text-muted">Nhập lại mật khẩu</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Số
									điện thoại</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="phone" placeholder="Số điện thoại" class="form-control"> <small class="form-text text-muted">Nhập
									số điện thoại</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="textarea-input" class=" form-control-label">Địa
									chỉ</label>
							</div>
							<div class="col-12 col-md-9">
								<textarea name="address" id="textarea-input" rows="9" placeholder="Địa chỉ..." class="form-control"></textarea>
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