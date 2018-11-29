<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

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
			<h3>Thêm thể loại sách</h3>
			<a href="${pageContext.request.contextPath}/admin/category?action=list">Danh sách thể loại</a>
		</div>
		
		<p style="color: red; font-size: 20px"><%= "add".equals(request.getParameter("error")) ? "Thêm không thành công" : "" %></p>
		
		<form action="/Book/admin/category" method="post">
		
		<input type="hidden" name="action" value="add"/>

			<div class="form-group">
				<label for="text-input" class=" form-control-label"> Tên thể loại</label>
				<input type="text" id="nameCategory" value="" onfocusout="checkParam()" name="name" placeholder="Thể loại">
				<div id="categoryEr">
					<p id="categoryEr-sub" class="er-red"></p>
				</div>
			</div>
			
			<div class="form-group">
				<label for="text-input" class=" form-control-label"> Đường dẫn</label>
				<input type="text" id="urlCategory" value="" onfocusout="checkParam()" name="url" placeholder="Đường dẫn">
				<div id="categoryEr1">
					<p id="categoryEr-sub1" class="er-red"></p>
				</div>
			</div>

			<div class="card-footer">
				<label></label>
				<button id="btn_submit" type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</div>

		</form>

		<script>
				function checkParam() {
	
					// chuẩn hóa đầu vào
					var nameCategory = document.getElementById("nameCategory").value.trim();
					var urlCategory = document.getElementById("urlCategory").value.trim();
					
					// nếu đủ điều kiện.
					
					if (nameCategory == "") {
						document.getElementById("categoryEr-sub").innerHTML = "Chưa nhập tên thể loại";
					} else {
						document.getElementById("categoryEr-sub").innerHTML = "";
					}
					
					if (urlCategory == "") {
						document.getElementById("categoryEr-sub1").innerHTML = "Chưa nhập đường dẫn";
	
					} else {
						document.getElementById("categoryEr-sub1").innerHTML = "";
					}
				}
			</script>

	</div>
</body>

</html>