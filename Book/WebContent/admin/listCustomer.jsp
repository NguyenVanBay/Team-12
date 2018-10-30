<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="include/head.jsp"></jsp:include>

	<%
	ArrayList<User> users = (ArrayList) request.getAttribute("users");
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
					<h3>Khách hàng</h3>

					<hr>

					<form action="/Book/admin/listCustomer" method="get">

						<div class="row seach-content">
							<div class="col-md-3 form-group">
								<input name="name" value="<%= (request.getParameter("name") == "" || request.getParameter("name") == null) ? "" : request.getParameter("name") %>" class="form-control-sm form-control" placeholder="Nhập tên">
							</div>
							<div class="col-md-3 form-group">
								<input name="email" value="<%= (request.getParameter("email") == "" || request.getParameter("email") == null) ? "" : request.getParameter("phone") %>" type="email" class="form-control-sm form-control" placeholder="Nhập email">
							</div>
							<div class="col-md-3 form-group">
								<input name="phone" value="<%= (request.getParameter("phone") == "" || request.getParameter("phone") == null) ? "" : request.getParameter("phone") %>" class="form-control-sm form-control" placeholder="Nhập số điện thoại">
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
								<th>Họ tên</th>
								<th>Email</th>
								<th>SDT</th>
								<th>Địa chỉ</th>
								<th>Chức vụ</th>
								<th></th>
							</tr>
						</thead>
						<tbody>

							<%
								for (User u : users) {
							%>
							<tr class="tr-shadow">
								<td>
									<%=u.getId()%>
								</td>
								<td><span>
										<%=u.getName()%></span></td>
								<td>
									<%=u.getEmail()%>
								</td>
								<td>
									<%=u.getPhone()%>
								</td>
								<td>
									<%=u.getAddress()%>
								</td>
								<td>
									<%
										if (u.getRole() == 4) {
									%>
									<p style="color: red">Giám đốc</p>
									<%
										} else if (u.getRole() == 1) {
									%>
									<p style="color: red">Quản lý nhân viên</p>
									<%
										} else if (u.getRole() == 2) {
									%>
									<p style="color: red">Quản lý sản phẩm</p>
									<%
										} else {
									%>
									<p style="color: red">Quản lý đơn hàng</p>
									<%
										}
									%>
								</td>
								<td>
									<div class="table-data-feature">
										<a href="editUser?id=<%=u.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title=""
										 data-original-title="Sửa"> <i class="zmdi zmdi-edit"></i>
										</a> <a href="deleteUser?id=<%=u.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title=""
										 data-original-title="xóa"> <i class="zmdi zmdi-delete"></i>
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