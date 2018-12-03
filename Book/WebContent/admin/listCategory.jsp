<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
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
				<h3>Thể loại</h3>
				<a href="${pageContext.request.contextPath}/admin/category?action=add">Thêm thể loại</a>
			
			</div>
			
		
		
		<p style="color: red; font-size: 20px"><%= request.getAttribute("error") %></p>
			
		<p style="color: green; font-size: 20px"><%= request.getAttribute("success") %></p>

			<form action="/Book/admin/category" method="get">

<input type="hidden" name="action" value="list"/>

				<div class="seach-content">

					<div class="form-group">
						<input name="name"
							value="<%=(request.getParameter(" name") == "" || request.getParameter("name") == null) ? ""
					: request.getParameter("name")%>"
							class="form-control-sm form-control" placeholder="Nhập thể loại">
					</div>

					<div class="form-group">
						<button type="submit">Tìm kiếm</button>
					</div>
				</div>
			</form>
		</div>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>id</th>
						<th>Thể loại</th>
						<th>Đường dẫn</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<%
						for (Category c : categorys) {
					%>
					<tr class="tr-shadow">
						<td><%=c.getId()%></td>

						<td><span> <%=c.getName()%></span></td>
						<td><%=c.getUrl()%></td>
						<td style="width: 100px;">
							<div class="table-feature">
								<a href="${pageContext.request.contextPath}/admin/category?action=edit&id=<%=c.getId()%>" class="item tooltip">
									<i class="fa fa-pencil-square"></i> <span class="tooltiptext">Sửa
										thể loại</span>
								</a> <a href="${pageContext.request.contextPath}/admin/category?action=delete&id=<%=c.getId()%>" onclick="return confirm('Bạn có muốn thực sự muốn xoá không')"  class="item tooltip">
									<i class="fa fa-recycle"></i> <span class="tooltiptext">Xóa
										thể loại</span>
								</a>
							</div>
						</td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>