<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="include/head.jsp"></jsp:include>

	<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
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
					<h3>Thể loại</h3>
					<a href="addCategory">Thêm thể loại</a>
					<hr>

					<form action="/Book/admin/listCategory" method="get">

						<div class="row seach-content">

							<div class="col-md-3 form-group">
								<input name="name" value="<%= (request.getParameter("name") == "" || request.getParameter("name") == null) ? "" : request.getParameter("name") %>" class="form-control-sm form-control" placeholder="Nhập thể loại">
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
								<th>Thể loại</th>
								<th></th>
							</tr>
						</thead>
						<tbody>

							<%
								for (Category c : categorys) {
							%>
							<tr class="tr-shadow">
								<td>
									<%=c.getId()%>
								</td>
								<td><span>
										<%=c.getName()%></span></td>
								<td>
									<div class="table-data-feature">
										<a href="editCategory?id=<%=c.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title=""
										 data-original-title="Sửa"> <i class="zmdi zmdi-edit"></i>
										</a> <a href="deleteCategory?id=<%=c.getId()%>" class="item" data-toggle="tooltip" data-placement="top" title=""
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