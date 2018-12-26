<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<link rel="stylesheet" href="css/web.css">
<body>
	<div id="wrap">
		<div id="top">
			<a href="${pageContext.request.contextPath}/"> <img src="img/logo.png" alt=""
				style="padding: 20px 105px;">
			</a>
		</div>

		<div id="main">
			<div class="menu">
				<ul>
					<li><a href="${pageContext.request.contextPath}">TRANG CHỦ</a></li>

					<%
						ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");

						for (Category c : categorys) {
					%>
					<li><a
						href="${pageContext.request.contextPath}/theloai?id=<%= c.getPk_category_news_id() %>"><%=c.getC_name()%></a></li>
					<%
						}
					%>


					<li><a href="contact.html">LIÊN HỆ</a></li>
					<input type="text" id="search" placeholder="Search"
						style="margin-left: 160px;" />
					<li><a href=""><img src="img/search.png" alt=""
							style="width: 20px; height: 20px; padding-top: 0px;"></a></li>
				</ul>
			</div>

			<div id="left" style="width: 950px;">
				<div class="tin1">
					<div class="text1"><%=request.getAttribute("theloai")%></div>
					<%
						ArrayList<New> tintheoloai = (ArrayList) request.getAttribute("tintheoloai");

						for (New tin : tintheoloai) {
					%>
					<div class="news">
						<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>">
						<img src="${pageContext.request.contextPath}/admin/upload/<%= tin.getC_img() %>" alt=""></a>
						<div class="description">
							<div class="text2" style="text-decoration: none;">
								<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"><%=tin.getC_description() %></a>
							</div>
						</div>
					</div>
					<div style="clear: both;"></div>
					<%
						}
					%>

					

				</div>
			</div>


			<div class="footer1">
				<div
					style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Instragram
					Feed</div>
				<div class="anh1">
					<img src="img/i1.jpg" alt=""> <img src="img/i2.jpg" alt="">
					<img src="img/i3.jpg" alt=""> <img src="img/i4.jpg" alt="">
				</div>
				<div class="anh1">
					<img src="img/i5.jpg" alt=""> <img src="img/i6.jpg" alt="">
					<img src="img/i7.jpg" alt=""> <img src="img/i8.jpg" alt="">
				</div>
			</div>
			<div style="clear: both;"></div>
			<div class="footer1" style="color: white;">Copyright ©2018 All
				rights reserved | This template is made with by Colorlib</div>
		</div>

	</div>
	</div>
</body>
</html>