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
				<h3>Khách hàng</h3>
				
			</div>
			<p style="color: red; text-align: center;">

				<%
					String error = (request.getParameter("error") == null) ? "" : request.getParameter("error");

				if (error.equals("delete")) {
					out.print("Không thể xóa khách hàng !");
				}
				%>

			</p>

			<form action="/Book/admin/customer" method="get">
<input name="action" type="hidden" value="list"/>
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
							<p style="color: red">Khách hàng</p>
						</td>
						<td>
							<div class="table-data-feature">
								</a> <a href="${pageContext.request.contextPath}/admin/customer?action=delete&id=<%=u.getId()%>&type=customer" onclick="return confirm('Bạn có muốn thực sự muốn xoá không')" class="item tooltip">
									<i class="fa fa-recycle"></i>
									<span class="tooltiptext">Xóa khách hàng</span>
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