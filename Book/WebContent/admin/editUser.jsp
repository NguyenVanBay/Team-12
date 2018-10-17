<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>

<%
	User user = (User) request.getAttribute("user");
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
					<strong>Sửa</strong> User
					<%=user.getName()%>
				</div>
				<div class="card-body card-block">
					<form action="/Book/admin/editUser" method="post">

						<input type="hidden" name="id" value="<%=user.getId()%>">

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Họ
									tên </label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="name"
									value="<%=user.getName()%>" placeholder="Họ Tên"
									class="form-control"> <small
									class="form-text text-muted">Nhập họ tên</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">email</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="email"
									value="<%=user.getEmail()%>" placeholder="Email"
									class="form-control"> <small
									class="form-text text-muted">Nhập email</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Mật
									khẩu</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="password" id="password" name="password"
									placeholder="Mật khẩu" class="form-control"> <small
									class="form-text text-muted">Nhập mật khẩu</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Số
									điện thoại</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="phone"
									value="<%=user.getPhone()%>" placeholder="Số điện thoại"
									class="form-control"> <small
									class="form-text text-muted">Nhập số điện thoại</small>
							</div>
						</div>

						<div class="row form-group">
							<div class="col col-md-3">
								<label for="textarea-input" class=" form-control-label">Địa
									chỉ</label>
							</div>
							<div class="col-12 col-md-9">
								<textarea name="address" id="textarea-input" rows="9"
									placeholder="Địa chỉ..." class="form-control"><%=user.getAddress()%></textarea>
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
