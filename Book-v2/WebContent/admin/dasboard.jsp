<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<% ArrayList<Product> listwarningProduct = (ArrayList) request.getAttribute("listwarningProduct"); %>

<html class="no-js" lang="vi">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bài tập lớn nhóm 12</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/dasboard.css">
</head>

<body>
	<!-- menu-top -->
<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<h3>Phần mềm quản lý bán hàng</h3>
		
		<p style="font-size: 25px; color: red; margin-bottom: 10px;">- Danh sách sản phẩm sắp hết hàng</p>
		<% 
		int i = 1;
		for(Product p : listwarningProduct) {
			
			out.print("<p style='margin-bottom: 10px;'> " + i + " - " + p.getName() + " <strong style='color: red;'>"+ p.getCount() +" (sản phẩm)</strong> </p>");
		i++;	
		}
		
			%>
		
		
	</div>
</body>

</html>