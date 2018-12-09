<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Bai tap lơn web tin tức</title>
<link rel="stylesheet" href="css/style.css">
</head>

<body>

	<div class="container">

		<div class="menu">
			<p>Xin chào A</p>
			<a href="${pageContext.request.contextPath}/admin/Login?type=logout">Logout</a>
		</div>

		<div class="box">
			<%@ include file="/admin/include/menu.jsp"%>

			<div class="content">
				<div class="btn-menu">
					<h2>Thêm tin</h2>
				</div>


				<form
					action="${pageContext.request.contextPath}/admin/new?action=add"
					method="post" enctype="multipart/form-data">
					Tên
					<input name="name" /><br>
					Thể loại
					<select name="category"><% 
						
						for(Category category : new CategoryDAO().getAll()) {
						%>
						<option value="<%= category.getPk_category_news_id() %>"><%= category.getC_name() %></option>
						<%
						}
						%>
					</select><br>
					Description
					<input name="description" /><br>
					content
					<textarea style="width: 800px; height: 300px" name="content" rows="" cols="">
					</textarea><br>
					hot
					<input type="checkbox" name="hot" value="1"/><br>
					
					lastest
					<input type="checkbox" name="latest" value="1" /><br>
					Ảnh
					<input name="img" type="file"/><br><input
						type="submit" />
				</form>

			</div>
		</div>

	</div>

</body>

</html>