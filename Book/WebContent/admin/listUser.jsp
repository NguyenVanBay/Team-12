<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>


<%
	ArrayList<User> users = (ArrayList) request.getAttribute("users");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/list.css">

<style>
.er-red {
	color: red;
	font-size: 18px;
	padding-left: 4px;
	text-align: center;
}
</style>

</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Nhân viên</h3>
				<a href="${pageContext.request.contextPath}/admin/user?action=add">Thêm nhân viên</a>
			</div>

			<p id="nameUserEr" class="er-red">

				<%
					String error = (request.getParameter("error") == null) ? "" : request.getParameter("error");

				if (error.equals("edit")) {
					out.print("Bạn chỉ có quyền sửa nhân viên do bạn tao ra !");
				}
				
				if (error.equals("delete")) {
					out.print("Không thể xóa nhân viên !");
				}
				%>

			</p>

			<form action="${pageContext.request.contextPath}/admin/user" method="get">
			
			<input type="hidden" name="action" value="list"/>

				<div class="row seach-content">
					<div class="col-md-3 form-group">
						<input name="name"
							value="<%=(request.getParameter("name") == "" || request.getParameter("name") == null) ? ""
					: request.getParameter("name")%>"
							class="form-control-sm form-control" placeholder="Nhập tên">
					</div>
					<div class="col-md-3 form-group">
						<input name="email" type="email"
							value="<%=(request.getParameter("email") == "" || request.getParameter("email") == null) ? ""
					: request.getParameter("email")%>"
							class="form-control-sm form-control" placeholder="Nhập email">
					</div>
					<div class="col-md-3 form-group">
						<input name="phone"
							value="<%=(request.getParameter("phone") == "" || request.getParameter("phone") == null) ? ""
					: request.getParameter("phone")%>"
							class="form-control-sm form-control"
							placeholder="Nhập số điện thoại">
					</div>

					<div class="col-md-3 form-group">
						<select name="role" id="SelectLm"
							class="form-control-sm form-control">
							<option value="0">Chức vụ</option>
							<option value="4">Giám đốc</option>
							<option value="1">Quản lý nhân viên</option>
							<option value="2">Quản lý sản phẩm</option>
							<option value="3">Quản lý đơn hàng</option>

						</select>
					</div>
					<div class="col-md-4 form-group">
						<button class="col-sm-offset-8 btn btn-success btn-sm"
							type="submit">Tìm kiếm</button>

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
						<th>Người tạo</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<%
						for (User u : users) {
					%>
					<tr class="tr-shadow">
						<td><%=u.getId()%></td>
						<td><span> <%=u.getName()%></span></td>
						<td><%=u.getEmail()%></td>
						<td><%=u.getPhone()%></td>
						<td><%=u.getAddress()%></td>

						<td style="color: red">
							<%
								if (u.getRole().equals(User.GIAMDOC)) {
										out.print("Giám đốc");
									} else if (u.getRole().equals(User.QUANLYKHO)) {
										out.print("Quản lý kho");
									} else if (u.getRole().equals(User.QUANLYNHANVIEN)) {
										out.print("Quản lý nhân viên");
									} else if (u.getRole().equals(User.QUANLYTHELOAI)) {
										out.print("Quản lý thể loại");
									}
							%>
						</td>
						<td style="color: gray">
							<%
								User temp = new UserDAO().getUserById(u.getCreateBy());

										if (temp.getRole()==User.GIAMDOC) {
											%> <a
							href="${pageContext.request.contextPath}/admin/user?action=list&email=<%= temp.getEmail() %>"><%= temp.getName() %>
								(Giám đốc)</a> <%
										} else if(temp.getRole()==User.QUANLYNHANVIEN){
											%> <a
							href="${pageContext.request.contextPath}/admin/user?action=list&email=<%= temp.getEmail() %>"><%= temp.getName() %>
								(Nhân Viên)</a> <%
										} else {
											
										}
							%>


						</td>
						<td>
						<%
						
						if(u.getRole() == User.GIAMDOC) {
							
						} else {
						%>
							<div class="table-data-feature">
								<a href="${pageContext.request.contextPath}/admin/user?action=edit&id=<%=u.getId()%>" class="item tooltip"> <i
									class="fa fa-pencil-square"></i> <span class="tooltiptext">Sửa
										thông tin nhân viên</span>
								</a> <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=<%=u.getId()%>" class="item tooltip">
									<i class="fa fa-recycle"></i> <span class="tooltiptext">Xóa
										nhân viên</span>
								</a>
							</div>
							<%	
						}
						
						%>
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