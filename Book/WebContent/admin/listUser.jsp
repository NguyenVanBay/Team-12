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
				<div>
					<h3 class="title-5 m-b-35" style="float: left; margin-left: 37px;">Nhân viên</h3>
					<a href="addUser" style="float: right; margin-right: 100px; color: #fff;"
						class="btn btn-success">Thêm Nhân viên</a>
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
								<th></th>
							</tr>
						</thead>
						<tbody>

							<%
								for (User u : users) {
							%>
							<tr class="tr-shadow">
								<td><%= u.getId() %></td>
								<td><span><%= u.getName() %></span></td>
								<td><%= u.getEmail() %></td>
								<td><%= u.getPhone() %></td>
								<td><%= u.getAddress() %></td>
								<td>
									<div class="table-data-feature">
										<a href="editUser?id=<%= u.getId() %>" class="item" data-toggle="tooltip"
											data-placement="top" title="" data-original-title="Sửa">
											<i class="zmdi zmdi-edit"></i>
										</a>
										<a href="deleteUser?id=<%= u.getId() %>" class="item" data-toggle="tooltip"
											data-placement="top" title="" data-original-title="xóa">
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
