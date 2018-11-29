<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>

<%
	Category category = (Category) request.getAttribute("category");
%>
<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/add.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">

		<div class="top">
			<h3>
				sửa thể loại sách :
				<%=category.getName()%>
			</h3>
			<a href="${pageContext.request.contextPath}/admin/category?action=list">Danh sách thể loại</a>
		</div>

		<p style="color: red; font-size: 20px"><%="edit".equals(request.getParameter("error")) ? "Sửa không thành công" : ""%></p>


		<form action="/Book/admin/category" method="post">
		
			<input type="hidden" name="action" value="edit">
			<input type="hidden" name="id" value="<%=category.getId()%>">
			<div class="form-group">
				<label for="text-input" class=" form-control-label"> Tên thể
					loại</label> <input type="text" id="text-input" name="name"
					value="<%=category.getName()%>">
			</div>

			<div class="form-group">
				<label for="text-input" class=" form-control-label"> Đường
					dẫn</label> <input type="text" id="text-input" name="url"
					value="<%=category.getUrl()%>">
			</div>

			<div class="card-footer">
				<label></label>
				<button type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</div>

		</form>
	</div>
</body>

</html>