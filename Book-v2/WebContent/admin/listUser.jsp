<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>


<%
ArrayList<User> users = (ArrayList) request.getAttribute("users");
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
	<link rel="stylesheet" href="css1/font-awesome.min.css">

	<link rel="stylesheet" href="css1/style.css">
	<link rel="stylesheet" href="css1/list.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Nhân viên</h3>
				<a href="addUser">Thêm nhân viên</a>
			</div>

			<form action="/Book/admin/listUser" method="get">

				<div class="row seach-content">
					<div class="col-md-3 form-group">
						<input name="name"  value="<%= (request.getParameter("name") == "" || request.getParameter("name") == null) ? "" : request.getParameter("name") %>" class="form-control-sm form-control" placeholder="Nhập tên">
					</div>
					<div class="col-md-3 form-group">
						<input name="email" type="email" value="<%= (request.getParameter("email") == "" || request.getParameter("email") == null) ? "" : request.getParameter("email") %>" class="form-control-sm form-control" placeholder="Nhập email">
					</div>
					<div class="col-md-3 form-group">
						<input name="phone" value="<%= (request.getParameter("phone") == "" || request.getParameter("phone") == null) ? "" : request.getParameter("phone") %>" class="form-control-sm form-control" placeholder="Nhập số điện thoại">
					</div>
					
					<div class="col-md-3 form-group">
						<select name="role" id="SelectLm" class="form-control-sm form-control">
							<option value="0">Chức vụ</option>
							<option value="4">Giám đốc</option>
							<option value="1">Quản lý nhân viên</option>
							<option value="2">Quản lý sản phẩm</option>
							<option value="3">Quản lý đơn hàng</option>

						</select>
					</div>
					<div class="col-md-4 form-group">
						<button class="col-sm-offset-8 btn btn-success btn-sm" type="submit">Tìm kiếm</button>
					
					</div>


				</div>
			</form>
		</div>

		<div class="table-responsive">
			<table class="table">
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
								} else if (u.getRole() == 3) {
							%>
							<p style="color: red">Quản lý đơn hàng</p>
							<%
								}
							%>
						</td>
						<td>
							<div class="table-data-feature">
								<a href="editUser?id=<%=u.getId()%>" class="item tooltip">
									<i class="fa fa-pencil-square"></i>
									<span class="tooltiptext">Sửa thông tin nhân viên</span>
								</a> 
								<a href="deleteUser?id=<%=u.getId()%>" class="item tooltip">
									<i class="fa fa-recycle"></i>
									<span class="tooltiptext">Xóa nhân viên</span>
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