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
					<h2>Danh sách bài viết</h2>
					<a href="${pageContext.request.contextPath}/admin/new?action=add">Thêm</a>
				</div>

				<table>
					<tr>
						<th>Mã</th>
						<th>Tên</th>
						<th>Thể loại</th>
						<th>Mô tả</th>
						<th style="width: 200px;">Nội dụng</th>
						<th>Hot</th>
						<th>Latest</th>
						<th>Ảnh</th>
						<th style="width: 100px;"></th>

					</tr>

					<%
						ArrayList<New> news = (ArrayList) request.getAttribute("news");

						for (New n : news) {
					%>
					<tr>
						<td><%=n.getPk_news_id()%></td>
						<td><%=n.getC_name()%></td>
						<td><%=new CategoryDAO().getCategoryById(n.getFk_category_news_id()).getC_name()%></td>
						<td><%=n.getC_description()%></td>
						<td><%=n.getC_content()%></td>
						<td><%=n.getC_hotnews() %></td>
						<td><%=n.getC_latestnews() %></td>
						<td>
						<img
							src="${pageContext.request.contextPath}/admin/upload/<%= n.getC_img() %>" /></td>
						<td><a
							href="${pageContext.request.contextPath}/admin/new?action=edit&id=<%= n.getPk_news_id() %>">Sửa</a>

							<a
							href="${pageContext.request.contextPath}/admin/new?action=delete&id=<%= n.getPk_news_id() %>">Xóa</a>

						</td>
					</tr>
					<%
						}
					%>


				</table>
			</div>
		</div>

	</div>

</body>

</html>